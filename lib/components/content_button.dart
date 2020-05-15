import 'package:flutter/material.dart';
import 'package:flutter_app/pages/detail/detail.dart';

class ContentButton extends StatelessWidget {
  final Widget child;

  ContentButton({
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return DetailPage();
        }));
      },
      child: child,
    );
  }
}