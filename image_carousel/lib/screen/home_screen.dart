import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController pageController = PageController();

  // initState() 함수 등록
  @override
  void initState() {
    super.initState(); // 부모 initState() 실행

    Timer.periodic(
      Duration(seconds: 3),
        (timer) {

          // 현재 페이지 가져오기
          int? nextPage = pageController.page?.toInt();

          if (nextPage == null){
            return;
          }

          if (nextPage == 4){
            nextPage = 0;
          } else {
            nextPage++;
          }

          pageController.animateToPage(
              nextPage,
              duration: Duration(microseconds: 500),
              curve: Curves.ease,
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // 상태바 색상 변경
    // 상태바가 이미 흰색이면 light 대신 dart를 준다.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1, 2, 3, 4, 5]
            .map(
            (number) => Image.asset(
                'asset/img/image_$number.jpeg',
                fit: BoxFit.cover),
          ).toList(),
      ),
    );
  }
}