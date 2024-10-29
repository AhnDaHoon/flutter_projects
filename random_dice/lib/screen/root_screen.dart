
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/settings_screen.dart';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin{
  TabController? controller;
  ShakeDetector? shakeDetector;

  double threshold = 2.7;
  int number = 1; // 주사위 숫자

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this); // 컨트롤러 초기화 하기
    controller!.addListener(tabListener); // 컨트롤러 속성이 변경될 때마다 실행할 함수 등록

    shakeDetector = ShakeDetector.autoStart( // 흔들기 감지 즉시 시작
      shakeSlopTimeMS: 100, // 감지주기
      shakeThresholdGravity: threshold, // 감지 민감도
      onPhoneShake: onPhoneShake, // 감지 후 실행할 함수
    );
  }

  tabListener() {
    setState(() {});
  }

  void onPhoneShake() {
    final rand = new Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }


  @override
  void dispose() {
    controller!.removeListener(tabListener); // 리스너에 등록한 함수 등록 취소
    shakeDetector!.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: controller,
          children: renderChildren(),
      ),

      bottomNavigationBar: renderBottomNavigation(),
    );
  }
  List<Widget> renderChildren(){
    return [
      HomeScreen(number: number),
      SettingsScreen(
          threshold: threshold,
          onThresholdChange: onThresholdChange)
    ];
  }

  BottomNavigationBar renderBottomNavigation(){
    // 탭 내비게이션을 구하는 위젯
    return BottomNavigationBar(
        currentIndex: controller!.index,
        onTap: (int index) {  // ➎ 탭이 선택될 때마다 실행되는 함수
          setState(() {
            controller!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edgesensor_high_outlined,
            ),
            label: '주사위',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: '설정',
          ),
        ]
    );
  }

  void onThresholdChange(double val){
    setState(() {
      threshold = val;
    });
  }

}