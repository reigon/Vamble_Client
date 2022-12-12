import 'package:Vamble_Client/components/channel/details/body.dart';
import 'package:flutter/material.dart';
import '../models/channel.dart';
import '../components/vamble_app_bar.dart';

class ChannelDetailsPage extends StatefulWidget {
  final ChannelInfo channelInfo;
  final List<VideoInfo> videoInfoList;

  ChannelDetailsPage(this.channelInfo, this.videoInfoList);

  @override
  createState() =>
      _ChannelDetailsPageState(this.channelInfo, this.videoInfoList);
}

class _ChannelDetailsPageState extends State<ChannelDetailsPage> {
  final ChannelInfo channelInfo;
  final List<VideoInfo> videoInfoList;

  _ChannelDetailsPageState(this.channelInfo, this.videoInfoList);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          VambleAppBar(innerBoxIsScrolled),
        ];
      },
      body: ChannelDetailsBody(
          channelInfo: channelInfo, videoInfoList: videoInfoList),
    ));
  }
}
