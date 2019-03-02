import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            title: Text('refresh')

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('search')

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('book')

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.markunread),
            title: Text('read')

          ),
        ],
      );
  }
}