import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchLists {
  int? videoCount;
  double? videoSearchTime;
  List<String>? channelNames;
  List<VideoInfo>? videoList;
  double? totalTime;
  List<ChannelInfo>? channelList;

  SearchLists(
      {this.videoCount,
      this.videoSearchTime,
      this.channelNames,
      this.videoList,
      this.totalTime,
      this.channelList});

  SearchLists.fromJson(Map<String, dynamic> json) {
    videoCount = json['videoCount'];
    videoSearchTime = json['videoSearchTime'];
    channelNames = json['channelNames'].cast<String>();
    if (json['videoList'] != null) {
      videoList = <VideoInfo>[];
      json['videoList'].forEach((v) {
        videoList!.add(new VideoInfo.fromJson(v));
      });
    }
    totalTime = json['totalTime'];
    if (json['channelList'] != null) {
      channelList = <ChannelInfo>[];
      json['channelList'].forEach((v) {
        channelList!.add(new ChannelInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoCount'] = this.videoCount;
    data['videoSearchTime'] = this.videoSearchTime;
    data['channelNames'] = this.channelNames;
    if (this.videoList != null) {
      data['videoList'] = this.videoList!.map((v) => v.toJson()).toList();
    }
    data['totalTime'] = this.totalTime;
    if (this.channelList != null) {
      data['channelList'] = this.channelList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoInfo {
  String? id;
  String? title;
  String? viewCount;
  Channel? channel;
  String? link;
  String? imageLink;

  VideoInfo(
      {this.id,
      this.title,
      this.viewCount,
      this.channel,
      this.link,
      this.imageLink});

  VideoInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    viewCount = json['viewCount'];
    channel =
        json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    link = json['link'];
    imageLink = json['imageLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['viewCount'] = this.viewCount;
    if (this.channel != null) {
      data['channel'] = this.channel!.toJson();
    }
    data['link'] = this.link;
    data['imageLink'] = this.imageLink;
    return data;
  }
}

class Channel {
  String? name;
  String? id;

  Channel({this.name, this.id});

  Channel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class ChannelInfo {
  Statistics? statistics;
  List<String>? tags;
  List<String>? topicDetails;
  String? name;
  String? channelId;
  String? description;
  String? channelAddress;
  late String imageLink;
  String? country;

  ChannelInfo.blank()
      : statistics = Statistics(),
        name = '',
        imageLink = '';

  ChannelInfo(
      {this.statistics,
      this.tags,
      this.topicDetails,
      this.name,
      this.channelId,
      this.description,
      this.channelAddress,
      required this.imageLink,
      this.country});

  ChannelInfo.fromJson(Map<String, dynamic> json) {
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
    tags = json['tags'].cast<String>();
    topicDetails = json['topicDetails'].cast<String>();
    name = json['name'];
    channelId = json['channelId'];
    description = json['description'];
    channelAddress = json['channelAddress'];
    imageLink = json['imageLink'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    data['tags'] = this.tags;
    data['topicDetails'] = this.topicDetails;
    data['name'] = this.name;
    data['channelId'] = this.channelId;
    data['description'] = this.description;
    data['channelAddress'] = this.channelAddress;
    data['imageLink'] = this.imageLink;
    data['country'] = this.country;
    return data;
  }
}

class Statistics {
  int? rating;
  String? viewCount;
  String? videoCount;
  String? subscriberCount;

  Statistics(
      {this.rating, this.viewCount, this.videoCount, this.subscriberCount});

  Statistics.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    viewCount = json['viewCount'];
    videoCount = json['videoCount'];
    subscriberCount = json['subscriberCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['viewCount'] = this.viewCount;
    data['videoCount'] = this.videoCount;
    data['subscriberCount'] = this.subscriberCount;
    return data;
  }
}
