import 'package:flutter/material.dart';

class HomeListItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _renderTitle()
        ],
      ),
    );
  }

  Widget _renderTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.red
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://img2.woyaogexing.com/2020/05/13/6a6bc5e61e864388bf102528be9ffa8c!400x400.png"
                  ))
              )
            )
          ],
        ),
        Icon(Icons.menu)
      ],
    );
  }
}