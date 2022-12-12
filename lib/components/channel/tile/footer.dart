import 'package:Vamble_Client/models/channel.dart';
import 'package:Vamble_Client/styles/hexcolor.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../../styles/styles.dart';
import '../../../../services/helper.dart';

const ChannelTileHeight = 54.0;

class ChanneTileFooter extends StatelessWidget {
  final ChannelInfo channelInfo;

  ChanneTileFooter({required this.channelInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 0.0, horizontal: Styles.horizontalPaddingDefault),
          decoration: BoxDecoration(color: Colors.black54.withOpacity(0.6)),
          alignment: Alignment.center,
          child: _renderChannelInfoText(),
        )
      ],
    );
  }

  Widget _renderChannelInfoText() {
    final title = channelInfo.name!;
    final subscriberCount = Helper.convertIntToString(
        int.parse(channelInfo.statistics!.subscriberCount!));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 0.0, horizontal: Styles.horizontalPaddingDefault),
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: ChannelTileHeight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 6),
                  AutoSizeText('$title',
                      style: Styles.channelTileTitleDark,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 5),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('$subscriberCount',
                        style: Styles.channelTileSubscriberRate),
                    Icon(EvaIcons.heart, color: HexColor('#FF0000'), size: 13),
                    Text('    4.5', style: Styles.channelTileSubscriberRate),
                    Icon(
                      EvaIcons.star,
                      color: Colors.white,
                      size: 13,
                    )
                  ])
                ]),
          ),
        )
      ],
    );
  }
}
