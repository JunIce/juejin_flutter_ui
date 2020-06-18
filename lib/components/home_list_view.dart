
import 'package:flutter/material.dart';
import 'package:flutter_app/common/util.dart';
import 'package:flutter_app/components/home_list_item1.dart';
import 'package:flutter_app/components/home_list_item2.dart';


class HomeListView extends StatelessWidget {
  final ScrollController controller;
  final List list;
  final int type;
  final TabController tabController;
  final String Wkey = Util.slRandomColor().toString();


  HomeListView({
    @required this.controller,
    @required this.list,
    @required this.type,
    this.tabController
  });

  List<ChoiceChip> _tabs = [
    ChoiceChip(label: Text("全部"),labelStyle:TextStyle(color: Colors.black),  selected: true, selectedColor: Colors.blue),
    ChoiceChip(label: Text("Java"),selected: false,),
    ChoiceChip(label: Text("Python"),selected: false,),
    ChoiceChip(label: Text("Go"),selected: false,),
    ChoiceChip(label: Text("php"),selected: false,),
    ChoiceChip(label: Text("Nodejs"),selected: false,),
    ChoiceChip(label: Text("Go"),selected: false,),
    ChoiceChip(label: Text("php"),selected: false,),
    ChoiceChip(label: Text("Nodejs"),selected: false,),
    ChoiceChip(label: Text("Go"),selected: false,),
    ChoiceChip(label: Text("php"),selected: false,),
    ChoiceChip(label: Text("Nodejs"),selected: false,),
    ChoiceChip(label: Text("Go"),selected: false,),
    ChoiceChip(label: Text("php"),selected: false,),
    ChoiceChip(label: Text("Nodejs"),selected: false,),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(type == 0) {
      return ListView.separated(
        controller: controller,
        key: PageStorageKey<String>("tab_${Wkey}"),
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
        itemBuilder: (BuildContext context, int index) {
          return HomeListItem2();
        },
        itemCount: list.length,
      );
    }

    if(type == 1) {
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return HomeListItem1();
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
        itemCount: list.length,
      );
    }


    if(type > 1) {
      BoxScrollView listview = ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return HomeListItem1();
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
        itemCount: list.length,
      );


      return Column(
        children: [
          ColoredBox(
              color: Colors.white,
              child: Container(
                height: 56,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child:  ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: _tabs[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10,);
                  },
                ),
              )
          ),
          Expanded(child: listview)
        ],
      );
    }
  }
}