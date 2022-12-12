import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Vamble_Client/models/channel.dart';

class ChannelService {
  static Future<SearchLists?> fetchAll(keyword) async {
    final resp = await http.get(Uri.parse(
        'http://vamble-server-bun3nyowfa-uc.a.run.app/api/youtube/list?q=${keyword}'));

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    return SearchLists.fromJson(json.decode(resp.body));
  }
}
