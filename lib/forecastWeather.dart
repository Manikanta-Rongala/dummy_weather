import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/weatherList.dart';
import 'package:http/http.dart' as http;



class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  List<ForecastWeather> forecastWeather = [];

  Future<void> getWeatherForecast() async {
    // Make an API call to OpenWeatherAPI to get the forecast weather data
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=hyderabad&appid=bb26f715f920ad6b3e6674d623cc555e&units=metric"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var weatherData = jsonData['list'];

      setState(() {
        forecastWeather.clear();

        for (var data in weatherData) {
          var date = data['dt_txt'];
          var description = data['weather'][0]['description'];
         //var temperature = data['main']['temp'];
          var speed = data['wind']['speed'];

          forecastWeather.add(ForecastWeather(
              date: date,
              description: description,
            //  temperature: temperature,
              speed: speed
          ));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherForecast();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(child: Text('Weather Forecast')),
      ),
      body: ListView.builder(
        itemCount: forecastWeather.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(forecastWeather[index].date),
            subtitle: Text(forecastWeather[index].description),
            trailing: Text(forecastWeather[index].speed.toString()),
          );
        },
      ),
    );
  }
}
