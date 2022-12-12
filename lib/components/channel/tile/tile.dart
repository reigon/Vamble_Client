import 'package:Vamble_Client/components/banner_image.dart';
import 'package:Vamble_Client/components/channel/tile/footer.dart';

import 'package:Vamble_Client/models/channel.dart';
import 'package:Vamble_Client/pages/channel_details.dart';
import 'package:flutter/material.dart';

class ChannelListTile extends StatelessWidget {
  final ChannelInfo channelInfo;
  final List<VideoInfo> videoInfoList;

  const ChannelListTile(
      {required this.channelInfo, required this.videoInfoList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>
            _navigateToChannelDetail(context, channelInfo, videoInfoList),
        child: Container(
          margin: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 12.0),
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: BannerImage(
                  url: channelInfo.imageLink,
                )),
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: ChanneTileFooter(channelInfo: channelInfo))
          ]),
        ));
  }

  void _navigateToChannelDetail(BuildContext context, ChannelInfo channelInfo,
      List<VideoInfo> videoInfoList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChannelDetailsPage(channelInfo, videoInfoList)));
  }
}
