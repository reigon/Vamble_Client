import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class Helper {
  // convert subscriber numbers to string
  static String convertIntToString(int value) {
    const units = <int, String>{
      1000000000: 'B',
      1000000: 'M',
      1000: 'K',
    };
    return units.entries
        .map((e) => '${value ~/ e.key}${e.value}')
        .firstWhere((e) => !e.startsWith('0'), orElse: () => '$value');
  }

  // launch channel url
  static launchChannelURL(String channelID) async {
    String url = 'https://www.youtube.com/channel/' + channelID;

    if (Platform.isIOS) {
      if (await canLaunch('youtube://www.youtube.com/channel/' + channelID)) {
        await launch('youtube://www.youtube.com/channel/' + channelID,
            forceSafariVC: false);
      } else {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw url;
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static launchVideoURL(String videoID) async {
    String url = 'https://www.youtube.com/watch?v=' + videoID;

    if (Platform.isIOS) {
      if (await canLaunch('youtube://www.youtube.com/watch?v=' + videoID)) {
        await launch('youtube://www.youtube.com/watch?v=' + videoID,
            forceSafariVC: false);
      } else {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw url;
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
