import 'package:flutter/material.dart';
import 'package:horoscope/pages/loading.dart';
import 'package:horoscope/pages/choose_zodiac.dart';
import 'package:horoscope/pages/zodiac_horoscope_detail.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes:{
      '/':(context) => Loading(),
      '/chooseZodiac': (context) => ChooseZodiac(),
      '/zodiacDetail': (context) => ZodiacHoroscopeDetail(),
    }
  )
);