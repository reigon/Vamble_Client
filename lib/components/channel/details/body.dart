import 'package:Vamble_Client/components/banner_image.dart';
import 'package:Vamble_Client/components/channel/details/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/channel.dart';
import '../../../styles/styles.dart';
import '../../../services/helper.dart';

const BannerImageHeight = 350.0;
const BodyVerticalPadding = 20.0;
const FooterHeight = 100.0;

class ChannelDetailsBody extends StatelessWidget {
  final ChannelInfo channelInfo;
  final List<VideoInfo> videoInfoList;

  ChannelDetailsBody({required this.channelInfo, required this.videoInfoList});

  @override
  Widget build(BuildContext context) {
    return _renderBody(context, this.channelInfo, this.videoInfoList);
  }

  Widget _renderBody(BuildContext context, ChannelInfo channelInfo,
      List<VideoInfo> videoInfoList) {
    var result = <Widget>[];

    result.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChannelDetailsHeader(channelInfo: channelInfo),
              SizedBox(
                height: 28,
              ),
              Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: channelInfo.description!,
                style: Styles.channelTileDescription,
                linkStyle: Styles.channelTileDescription,
              )
            ])));
    result.add(_renderVideoDetails(videoInfoList));
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: result));
  }

  Widget _renderVideoDetails(List<VideoInfo> videoInfoList) {
    List<Widget> videoWigetList = List.generate(videoInfoList.length, (index) {
      return Container(
          padding: EdgeInsets.symmetric(
              vertical: BodyVerticalPadding,
              horizontal: Styles.horizontalPaddingDefault),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Helper.launchVideoURL(videoInfoList[index].id!);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: BannerImage(
                        url: videoInfoList[index].imageLink!,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(videoInfoList[index].title!,
                      style: Styles.channelTileDescription),
                )
              ]));
    });
    videoWigetList.add(Container(
      height: 48,
    ));
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: Styles.horizontalPaddingDefault),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: videoWigetList));
  }
}
