import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // void somethingThatExpectsLessThan10(int n) {
  //   if (n > 10) {
  //     throw 'n is greater that 10, n should always be less than 10.';
  //   }
  // }

  // void getData() async {
  //   Response response = await get(
  //       'https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1');
  //   print(response);
  // }

  @override
  Widget build(BuildContext context) {
    // String myMargin = 'abc';
    // double myMarginAsADouble;
    // try {
    //   myMarginAsADouble = double.parse(myMargin);
    // } catch (e) {
    //   print(e);
    //   myMarginAsADouble = 30.0;
    // }
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
      // body: Container(
      //   margin: EdgeInsets.all(myMarginAsADouble ??
      //       30.0), //?? if first statement works use that if null use 30.0
      //   color: Colors.red,
      // ),
    );
  }
}
