// import 'dart:core';
//
//
// import 'package:dummy_weather/Weather_api_repo.dart';
// import 'package:dummy_weather/forecastWeather.dart';
// import 'package:dummy_weather/models/weather_model.dart';
import 'package:flutter/material.dart';

import 'Weather_api_repo.dart';
import 'forecastWeather.dart';
import 'models/weather_model.dart';





// void main() {
//   runApp(const MaterialApp(
//     home: WeatherForecast(),
//   ));
// }



void main() {
  runApp( const WeatherForecast());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // String datetime = DateTime.now().toString();
  // String date = DateTime.now().day.toString();


  WeatherApiRepository weatherData = WeatherApiRepository();
  WeatherModel? weather;

  @override
  void initState() {
    super.initState();
  }

  Future<WeatherModel> getData() async{
     return weather = await weatherData.getUserData();

  }

  @override
  Widget build(BuildContext context) {
     return

    FutureBuilder<WeatherModel>(
      future: getData(),
      builder: (context, AsyncSnapshot<WeatherModel> weatherNew) {
        if (weatherNew.hasData) {
            Text(weatherNew.data!.city!.name.toString());
        } else if (weatherNew.hasError) {
          return Center(child: Text(weatherNew.error.toString()));
        }
        // By default show a loading spinner.
        return const CircularProgressIndicator();
      },
    );


  }
}




