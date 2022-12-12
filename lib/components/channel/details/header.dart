import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../models/channel.dart';
import '../../../styles/styles.dart';
import '../../../services/helper.dart';

const ChannelTileHeight = 54.0;

class ChannelDetailsHeader extends StatelessWidget {
  final ChannelInfo channelInfo;

  ChannelDetailsHeader({
    required this.channelInfo,
  });

  @override
  Widget build(BuildContext context) {
    return _renderHeader(context);
  }

  Widget _renderHeader(context) {
    String subscriberString = 'Subs: ' +
        Helper.convertIntToString(
            int.parse(channelInfo.statistics!.subscriberCount!));
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Helper.launchChannelURL(this.channelInfo.channelId!);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  channelInfo.imageLink,
                  height: 160,
                  width: 160,
                ),
              )),
          SizedBox(
            width: 18,
          ),
          InkWell(
              onTap: () {
                Helper.launchChannelURL(this.channelInfo.channelId!);
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      width: 150,
                      alignment: Alignment.bottomLeft,
                      child: AutoSizeText(
                        channelInfo.name!.toUpperCase(),
                        style: Styles.channelDetailsTitleLight,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 55,
                      width: 150,
                      child: Text(channelInfo.topicDetails!.join(', '),
                          style: Styles.channelTileCaption,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 30,
                      width: 150,
                      child: Text(
                        subscriberString,
                        style: Styles.channelTileCaption,
                      ),
                    )
                  ]))
        ]);
  }
}
