import 'package:flutter/material.dart';

class HomeSpecialPage extends StatefulWidget {
  @override
  _HomeSpecialPageState createState() => _HomeSpecialPageState();
}

class _HomeSpecialPageState extends State<HomeSpecialPage> {

  int _willAcceptIndex = -1;
  List<Widget> _list = List.generate(10, (index) => renderItem(index));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页特别展示"),
      ),
      body: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _renderDragItem(index);
          },
          separatorBuilder: (BuildContext context, int index) => Divider(height: 1,),
          itemCount: _list.length
      ),
    );
  }


  Widget _renderDragItem(int index) {
    return Draggable(
      axis: Axis.vertical,
      child: DragTarget<int>(
          builder: (BuildContext context, data, rejects) {
            return _list[index];
          },
         onAccept: (data) {
            print("drag target accept $data");
         },
          onLeave: (data) {
            print("drag target onleave $data");
          },
         onWillAccept: (int fromIndex) {
          //  final accept = fromIndex != index;
          return fromIndex;
         },
      ),
      feedback: _list[index],
      childWhenDragging: _list[index],
      onDragStarted: () {
        print("drag start $index");
      },
      onDraggableCanceled: (velocity, offset) {
        print("drag cancel $velocity, $offset");
        setState(() {
          _willAcceptIndex = -1;
        });
      },
      onDragCompleted: () {
        print("drag end $index");
        setState(() {
          _willAcceptIndex = -1;
        });
      },
    );
  }


  static Widget renderItem(int index) {
    Widget menu = Icon(Icons.menu);

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: Colors.white,
        child: IntrinsicHeight(child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            menu,
            SizedBox(width: 10,),
            Text("hello world $index", style: TextStyle(fontSize: 14, color: Colors.black, decoration: TextDecoration.none),)
          ],
        )
        )
    );
  }

}
