import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ZodiacHoroscopeDetail extends StatefulWidget {
  @override
  _ZodiacHoroscopeDetailState createState() => _ZodiacHoroscopeDetailState();
}

class _ZodiacHoroscopeDetailState extends State<ZodiacHoroscopeDetail> {
  Map data={};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      backgroundColor: Colors.purpleAccent[100],
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration:BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                 // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width,
                      height: 170.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                        image: AssetImage("assets/background1.jpg"),
                          fit: BoxFit.cover,
                           ),
                      ),

                      child: Center(
                        child: Text("Zodiac Horoscope for ${data['zodiac']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,

                              ),
                        ),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                FlatButton(
                  onPressed: ()async {
                          dynamic result = await Navigator.pushNamed(context, '/chooseZodiac');
                          if(result != null) {
                            setState(() {
                              data = {
                                'zodiac': result['zodiac'],
                                'today_date': result['today_date'],
                                'today_text': result['today_text'],

                                'tomorrow_date': result['tomorrow_date'],
                                'tomorrow_text': result['tomorrow_text'],

                                'yesterday_date': result['yesterday_date'],
                                'yesterday_text': result['yesterday_text'],

                                'month_date': result['month_date'],
                                'month_text': result['month_text'],

                                'week_date': result['week_date'],
                                'week_text': result['week_text'],
                                'flag': result['flag']
                              };
                            });
                          }
                }, child: Text("Choose Your Zodiac Sign",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
                    fontFamily: "Lobster-Regular",
                  ),
                )),
                SizedBox(height: 20.0),
                GFAccordion(
                    title: 'Today',
                    content: data['today_text'],
                    collapsedIcon: Text('Show',
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    expandedIcon: Text('Hide',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),

                GFAccordion(
                    title: 'Tommorow',
                    content: data['tomorrow_text'] ,
                    collapsedIcon: Text('Show',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    expandedIcon: Text('Hide',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GFAccordion(
                    title: 'Yesterday',
                    content:  data['yesterday_text'],
                    collapsedIcon: Text('Show',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    expandedIcon: Text('Hide',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GFAccordion(
                    title: 'Week',
                    content:  data['week_text'],
                    collapsedIcon: Text('Show',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    expandedIcon: Text('Hide',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GFAccordion(
                    title: 'Month',
                    content:  data['month_text'],
                    collapsedIcon: Text('Show',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                    expandedIcon: Text('Hide',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
