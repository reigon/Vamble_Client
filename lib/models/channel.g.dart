// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchLists _$SearchListsFromJson(Map<String, dynamic> json) {
  return SearchLists(
    videoCount: json['video_count'] as int?,
    videoSearchTime: (json['video_search_time'] as num?)?.toDouble(),
    channelNames: (json['channel_names'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    videoList: (json['video_list'] as List<dynamic>?)
        ?.map((e) => VideoInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalTime: (json['total_time'] as num?)?.toDouble(),
    channelList: (json['channel_list'] as List<dynamic>?)
        ?.map((e) => ChannelInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SearchListsToJson(SearchLists instance) =>
    <String, dynamic>{
      'video_count': instance.videoCount,
      'video_search_time': instance.videoSearchTime,
      'channel_names': instance.channelNames,
      'video_list': instance.videoList,
      'total_time': instance.totalTime,
      'channel_list': instance.channelList,
    };
