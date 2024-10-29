import 'package:flutter/material.dart';
import 'package:random_dice/const/colors.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/root_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      sliderTheme: SliderThemeData( // Slider 위젯 관련 테마
        thumbColor: primaryColor,   // 노브 색상
        activeTickMarkColor: primaryColor,  // 노브가 이동한 트랙 생상

        // 노브가 아직 이동하지 안흔 트랙 색상ㅇ
        inactiveTrackColor: primaryColor.withOpacity(0.3),
      ),

      // bottomNavigationBar 위젯 과녈ㄴ 테마
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,        // 선택 상태 색
        unselectedItemColor: secondaryColor,    // 비선택 상태 색
        backgroundColor: backgroundColor,       // 배경색
      ),
    ),
    home: RootScreen(),
  ));
}
