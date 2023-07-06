// import 'dart:core';
//
//
// import 'package:dummy_weather/Weather_api_repo.dart';
// import 'package:dummy_weather/forecastWeather.dart';
// import 'package:dummy_weather/models/weather_model.dart';
import 'package:flutter/material.dart';

import 'Weather_api_repo.dart';

import 'models/weather_model.dart';


void main() {
  runApp( const MyApp());
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
  late WeatherModel weather;

  @override
  void initState() {
    super.initState();

  }

  Future< WeatherModel> getData() async{
     return weather = await weatherData.getForecast();
  }

  @override
  Widget build(BuildContext context) {
     return FutureBuilder<WeatherModel>(
      future: weatherData.getForecast(),
      builder: (context, AsyncSnapshot<WeatherModel> weatherData) {
        if (weatherData.hasData) {
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 // Text(weatherData.data!.main!.temp.toString()),
       Text(weatherData.data!.list![0].dt.toString()),
        Text(weatherData.data!.cod)

                ],
              ),
            );
        } else if (weatherData.hasError) {
          return Center(child: Text(weatherData.error.toString()));
        }
        // By default show a loading spinner.
        return const CircularProgressIndicator();
      },
    );


  }
}


// return ListView.builder(
//   itemCount: weatherData.data!.length,
//   itemBuilder: (context, index) {
//     //final weatherData = weatherData[index];
//     return ListTile(
//       title: Text(weatherData.data![index].dt.toString()),
//      // subtitle: Text(weatherData.dat),
//     );
//   },
// );

