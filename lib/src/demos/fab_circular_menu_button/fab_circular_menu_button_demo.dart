import 'package:flutter/material.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
// import 'package:fab_circular_menu/fab_circular_menu.dart';

class FabCircularMenuButtonDemo extends StatelessWidget {
  static const String routeName = '/FabCircularMenuButtonDemo';

  const FabCircularMenuButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FAB Circular Menu"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.yellowAccent[100],
      ),
      floatingActionButton: FabCircularMenuPlus(
        alignment: Alignment.bottomRight, // 메뉴버튼 위치
        // 메뉴버튼의 열기 아이콘
        fabOpenIcon: const Icon(Icons.menu, color: Colors.white),
        // 메뉴버튼 닫기 아이콘
        fabCloseIcon: const Icon(Icons.close, color: Colors.white),
        ringColor: Colors.blue.withAlpha(25),
        // ringColor: Colors.transparent,
        ringDiameter: 350.0, // 메뉴 버튼과의 거리
        ringWidth: 100.0, //
        fabSize: 70.0,
        // fabColor: Colors.white, // 메뉴버튼 아이콘 일반 색상
        fabOpenColor: Colors.amber[300], // 메뉴버튼 열린 색상
        fabCloseColor: Colors.green[500], // 메뉴버튼 닫힌 색상
        fabElevation: 8.0,
        fabIconBorder: const CircleBorder(),
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              displayMessage(context, 'Home Clicked');
            },
            elevation: 10.0,
            fillColor: Colors.green,
            padding: const EdgeInsets.all(14.0), // Action 버튼의 크기
            shape: const CircleBorder(),
            // Action 버튼의 아이콘
            child: const Icon(
              Icons.home,
              size: 30.0,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              displayMessage(context, 'Search Clicked');
            },
            elevation: 10.0,
            fillColor: Colors.orange,
            highlightColor: Colors.blue, // 클릭시 색상
            padding: const EdgeInsets.all(14.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.search,
              color: Colors.white, // Action 아이콘 색상
              size: 30.0,
              // weight: 1200.0,
            ),
          ),
          CircleAvatar(
            radius: 30, // Action 버튼의 크기
            backgroundColor: Colors.purple,
            foregroundColor: Colors.yellow,
            child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 30, // radius 와 크기가 같아야 중앙정렬이 됨.
                ),
                onPressed: () {
                  displayMessage(context, 'Setting Clicked');
                }),
          ),
          IconButton(
              icon: const Icon(
                Icons.star,
                color: Colors.brown,
                size: 40,
              ),
              onPressed: () {
                displayMessage(context, 'Favorite Clicked');
              }),
        ],
      ),
    );
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
}
