import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      // 한글 다이어그램 지정
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,   // for 안드로이드
        GlobalCupertinoLocalizations.delegate,  // for IOS
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
      ],

      theme: ThemeData( // 테마를 지정할 수 있는 클래스
        fontFamily:'sunflower',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'parisienne',
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: HomeScreen(),
    )
  );
}



