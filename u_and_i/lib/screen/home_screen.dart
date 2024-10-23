
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea( // 시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(

          // 위아래 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // 반대축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              // 하트를 눌렀을 때 실행할 함수 전달하기
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        )
      )
    );
  }

  void onHeartPressed(){
    showCupertinoDialog( // 쿠퍼티노 다이얼로그 실행
      context: context, // 보여줄 다이얼로그 빌드
      builder: (BuildContext context){
        // 날짜 선택하는 다이얼로그
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(

              maximumYear: DateTime.now().year,
              initialDateTime: DateTime.now(),
              maximumDate: DateTime.now(),
              minimumYear: 2000,

              // 시간 제외하고 날짜만 선택하기
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {

  // 하트를 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed, // 상위에서 입력받기
    required this.firstDay, // 날짜 변수로 입력 받기
  });

  @override
  Widget build(BuildContext context) {

    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단 글자
          'U&I',
          style: textTheme.displayLarge,
        ),

        const SizedBox(height: 16.0),
        Text( // 두 번째 글자
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        Text( // 세번째 글자
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyMedium,
        ),

        const SizedBox(height: 16.0),
        IconButton(
            onPressed: onHeartPressed,
            iconSize: 60.0,
            icon: Icon(
              Icons.favorite,
            ),
            color: Colors.red,
        ),

        const SizedBox(height: 16.0),
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:Center(
        child: Image.asset(
          'asset/img/middle_image.png',

          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
