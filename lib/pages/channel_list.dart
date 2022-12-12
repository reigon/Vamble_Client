import 'dart:async';
import 'package:Vamble_Client/components/channel/tile/tile.dart';
import 'package:Vamble_Client/services/channel_service.dart';
import 'package:Vamble_Client/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/vamble_app_bar.dart';
import '../models/channel.dart';

const ListItemHeight = 300.0;
const ListItemWidth = 300.0;

class ChannelListPage extends StatefulWidget {
  @override
  createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  List<ChannelInfo> channelInfoList = [];
  List<VideoInfo> videoInfoList = [];
  List<Widget> listObject = [];
  bool loading = false;
  String searchText = "";

  @override
  void initState() {
    super.initState();
    this.searchText = "houseplants";
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                VambleAppBar(innerBoxIsScrolled),
              ];
            },
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      children: [
                        getSearchBarUI(),
                        Column(children: [
                          Container(child: renderProgressBar(context)),
                          SizedBox(height: 10.0),
                          renderListView(context),
                          Container(
                            height: 45,
                          )
                        ]),
                      ]),
                ),
              ],
            )));
  }

  Future<void> loadData([keyword = ""]) async {
    if (this.mounted) {
      setState(() => this.loading = true);
      if (keyword == "") {
        keyword = this.searchText;
      }
      Stopwatch stopwatch = new Stopwatch()..start();
      final searchLists = await ChannelService.fetchAll(searchText);
      print('doSomething() executed in ${stopwatch.elapsed}');
      setState(() {
        this.videoInfoList = searchLists!.videoList!;
        this.channelInfoList = searchLists.channelList!;
        this.loading = false;
      });
    }
  }

  Widget renderProgressBar(BuildContext context) {
    return (this.loading
        ? LinearProgressIndicator(
            minHeight: 2,
            value: null,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red))
        : Container(
            margin: EdgeInsets.only(top: 2),
          ));
  }

  Widget renderListView(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(channelInfoList.length, (index) {
        return Container(child: _listViewItemBuilder(context, index));
      }),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final channelInfo = this.channelInfoList[index];
    List<VideoInfo> videoInfoList = [];

    for (var videoInfo in this.videoInfoList) {
      if (videoInfo.channel!.id == channelInfo.channelId)
        videoInfoList.add(videoInfo);
    }
    return ChannelListTile(
        channelInfo: channelInfo, videoInfoList: videoInfoList);
  }

  Widget getSearchBarUI() {
    return Container(
      margin: EdgeInsets.only(bottom: 13, top: 5),
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 0, bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        offset: const Offset(0, 1),
                        blurRadius: 2.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 0),
                  child: TextField(
                      autofocus: false,
                      onChanged: (String txt) {
                        this.searchText = txt;
                      },
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      keyboardType: TextInputType.text,
                      cursorColor:
                          Themes.searchBarTheme.buildLightTheme().primaryColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Houseplants...',
                      ),
                      onSubmitted: (value) {
                        loadData(value);
                        this.searchText = value;
                      }),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    offset: const Offset(0, 2),
                    blurRadius: 10.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.search,
                          size: 20,
                          color: Themes.searchBarTheme
                              .buildLightTheme()
                              .backgroundColor),
                      onPressed: () => loadData(this.searchText)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
