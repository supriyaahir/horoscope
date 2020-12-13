import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class ZodiacHoroscope {

  String zodiac;
  String week;
  String week_date;
  String week_text;
  String today_date;
  String today_text;
  String tomorrow_date;
  String tomorrow_text;
  String yesterday_date;
  String yesterday_text;
  String month_date;
  String month_text;
  String flag;
  String url;

  ZodiacHoroscope({ this.zodiac, this.flag, this.url });

  Future<void> getZodiacHoroscope() async {

    try{
      // make the request
      Response response = await get('http://mobs.horo4.me/apps/horo/v2/getHoroscopeBySignTTY?$url');
      Map data = jsonDecode(response.body);

      // get properties from json
      //String todayDate = data['today']['date'];
      //DateTime today_now = DateTime.parse(todayDate);
      today_date = DateFormat('dd-MM-yyyy') .format(DateTime.parse(data['today']['date']));
      today_text = data['today']['text'];

      tomorrow_date = DateFormat('dd-MM-yyyy') .format(DateTime.parse(data['tomorrow']['date']));
      tomorrow_text = data['tomorrow']['text'];

      yesterday_date = DateFormat('dd-MM-yyyy') .format(DateTime.parse(data['yesterday']['date']));
      yesterday_text = data['yesterday']['text'];

      week_date = DateFormat('dd-MM-yyyy') .format(DateTime.parse(data['week']['date']));
      week_text = data['today']['text'];

      month_date = DateFormat('dd-MM-yyyy') .format(DateTime.parse(data['today']['date']));
      month_text = data['today']['text'];
    }
    catch (e) {
      print(e);
      today_text = 'could not get zodiac horoscope';
    }

  }

}