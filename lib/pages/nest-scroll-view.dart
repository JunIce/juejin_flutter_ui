import 'package:flutter/material.dart' hide NestedScrollView;
import 'dart:async';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';


class PullToRefreshDemo extends StatefulWidget {
  @override
  _PullToRefreshDemoState createState() => _PullToRefreshDemoState();
}

class _PullToRefreshDemoState extends State<PullToRefreshDemo>
    with TickerProviderStateMixin {
  late TabController primaryTC;
  int _length1 = 50;
  final int _length2 = 50;
  DateTime lastRefreshTime = DateTime.now();
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    primaryTC = TabController(length: 2, vsync: this);
    super.initState();

    _scrollController.addListener(() {
      print(_scrollController);
    });
  }

  @override
  void dispose() {
    primaryTC.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScaffoldBody(),
    );
  }

  Widget _buildScaffoldBody() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
    //statusBar height
    statusBarHeight +
        //pinned SliverAppBar height in header
        kToolbarHeight;
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext c, bool f) {
        return <Widget>[
          SliverAppBar(
              pinned: true,
              title: const Text('pull to refresh in body'),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Image.network("https://p.ssl.qhimg.com/sdm/420_627_/t01bddb6d255c33fc3e.jpg", fit: BoxFit.cover,)
              )
          )
        ];
      },
      //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
      innerScrollPositionKeyBuilder: () {
        String index = 'Tab';

        index += primaryTC.index.toString();

        return Key(index);
      },
      body: Column(
        children: <Widget>[
          TabBar(
            controller: primaryTC,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            isScrollable: false,
            unselectedLabelColor: Colors.grey,
            tabs: const <Tab>[
              Tab(text: 'Tab0'),
              Tab(text: 'Tab1'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: primaryTC,
              children: <Widget>[
                ListView.builder(
                    //store Page state
                    key: const PageStorageKey<String>('Tab0'),
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext c, int i) {
                      return Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: Text(const Key('Tab0').toString() +
                            ': ListView$i of $_length1'),
                      );
                    },
                    itemCount: _length1,
                    padding: const EdgeInsets.all(0.0),
                  ),

                Expanded(
                  child: ListView.builder(
                    //store Page state
                    key: const PageStorageKey<String>('Tab1'),
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext c, int i) {
                      return Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: Text(const Key('Tab1').toString() +
                            ': ListView$i of $_length2'),
                      );
                    },
                    itemCount: _length2,
                    padding: const EdgeInsets.all(0.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}