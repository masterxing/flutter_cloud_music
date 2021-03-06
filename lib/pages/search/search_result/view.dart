import 'package:flutter/material.dart';
import 'package:flutter_cloud_music/pages/playlist_collection/widget/tab_widget.dart';
import 'package:flutter_cloud_music/pages/search/search_result/pages/result_common.dart';
import 'package:flutter_cloud_music/pages/search/search_result/pages/synthesize.dart';
import 'package:flutter_cloud_music/widgets/keep_alive_wrapper.dart';
import 'package:flutter_cloud_music/widgets/undeveloped.dart';

import '../../../common/values/constants.dart';
import '../../../common/values/server.dart';
import '../state.dart';

class SearchResultPage extends StatefulWidget {
  static const tabs = <TypeName>[
    TypeName(type: SEARCH_COMPOSITE, name: '综合'),
    TypeName(type: SEARCH_SONGS, name: '单曲'),
    TypeName(type: SEARCH_PLAYLIST, name: '歌单'),
    TypeName(type: SEARCH_VIDEOS, name: '视频'),
    TypeName(type: SEARCH_SINGER, name: '歌手'),
    TypeName(type: SEARCH_LYRIC, name: '歌词'),
    TypeName(type: SEARCH_ALBUMS, name: '专辑'),
    TypeName(type: SEARCH_USER, name: '用户'),
  ];
  final String keywords;

  const SearchResultPage({Key? key, required this.keywords}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SearchResultPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    logger.d('SearchResultPage initState');
  }

  @override
  void dispose() {
    logger.d('SearchResultPage dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabWidget(
        tabItems: getTab(),
        onPageCreated: (controller) {
          _pageController = controller;
        },
        pageItemBuilder: (context, index) {
          return KeepAliveWrapper(child: _buildPage(context, index));
        },
      ),
    );
  }

  List<Tab> getTab() {
    return SearchResultPage.tabs.map((data) => Tab(text: data.name)).toList();
  }

  Widget _buildPage(BuildContext context, int index) {
    final tab = SearchResultPage.tabs.elementAt(index);
    switch (tab.type) {
      case SEARCH_COMPOSITE:
        return SynthesizePage(
          keywords: widget.keywords,
          onMoreTap: (type) {
            final index = SearchResultPage.tabs
                .indexWhere((element) => element.type == type);
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        );
      case SEARCH_LYRIC:
        return UnDeveloped();
      default:
        return SearchResultCommonPage(
            key: Key(tab.type.toString()),
            keywords: widget.keywords,
            type: tab.type);
    }
  }
}
