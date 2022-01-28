import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),
          headline2: TextStyle(fontSize: 16, color: Colors.white),
          bodyText1: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Body(),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myLayout(context);
  }
}

Widget _myLayout(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _searchBar(),
      _cityDate(context),
      _weatherToday(),
      _weeklyForecast(),
    ],
  );
}

Widget _searchBar() {
  return SizedBox(
    height: 30,
    child: Row(
      children: [
        const SizedBox(width: 10),
        const Icon(Icons.search, color: Colors.white),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
                label: Text('Enter city name',
                    style: TextStyle(color: Colors.white))),
          ),
        ),
      ],
    ),
  );
}

Widget _cityDate(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    child: Column(
      children: [
        Text('Chuyskaya Oblast, KG',
            style: Theme.of(context).textTheme.headline1),
        Text('Thursday, Jan 27, 2022',
            style: Theme.of(context).textTheme.bodyText1),
      ],
    ),
  );
}

Widget _weatherToday() {
  return Expanded(
      child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Row(
          children: [
            Icon(Icons.wb_sunny_rounded, color: Colors.white, size: 80),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('14 F',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    )),
                Text(
                  'LIGHT SNOW',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.ac_unit_rounded, color: Colors.white),
                Text('5', style: TextStyle(color: Colors.white)),
                Text('km/hr', style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.ac_unit, color: Colors.white),
                Text('3', style: TextStyle(color: Colors.white)),
                Text('%', style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.ac_unit, color: Colors.white),
                Text('20', style: TextStyle(color: Colors.white)),
                Text('%', style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    ],
  ));
}

Widget _weeklyForecast() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        '7-DAY WEATHER FORECAST',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      SizedBox(
        height: 150,
        child: ListView.builder(
            padding: EdgeInsets.all(15),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 160,
                //height: 140,
                child: Card(
                  color: Colors.white.withAlpha(120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Friday',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('6 F',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 32)),
                          Icon(
                            Icons.wb_sunny_rounded,
                            color: Colors.white,
                            size: 36,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      SizedBox(
        height: 70,
      ),
    ],
  );
}
