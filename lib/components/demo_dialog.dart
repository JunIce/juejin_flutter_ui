import 'package:flutter/material.dart';

class DemoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
      ElevatedButton(
          child: Text("点击"),
            onPressed: () {
            _showDialog(context);
//              _alertDialog();
        })

      ]
    );
  }

  _alertDialog() {
    return AlertDialog(
      title: Text("sdfhjjlfksd"),
      actions: [
        TextButton(
          onPressed: () => {},
          child: Text(
            '1'
          ),
        ),
        TextButton(
          onPressed: () => {},
          child: Text(
              '2'
          ),
        )
      ],
    );
  }

  _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('确认退出登陆？'),
            // content: Text('退出登陆后将没法进行'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // 退出登陆
                  print("退出");
                },
                child: Text(
                  '确认',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('取消'),
              )
            ],
          );
        }
    );
  }
}