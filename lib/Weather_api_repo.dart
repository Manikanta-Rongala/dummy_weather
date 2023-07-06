import 'dart:convert';

import 'package:dummy_weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

  class WeatherApiRepository {


    Future<WeatherModel> getForecast() async{

      var response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=hyderabad&appid=bb26f715f920ad6b3e6674d623cc555e&units=metric"));

      if(response.statusCode == 200){
        var data = jsonDecode(response.body);

        return  WeatherModel.fromJson(data);


        // Assuming nested weather data is present as 'weather' array in JSON
        // final weatherList = jsonData['list'] as List<dynamic>;
        // List<WeatherList> weatherDataList = [];
        //
        // for (var data in weatherList) {
        //   final weatherData = WeatherList.fromJson(data);
        //   weatherDataList.add(weatherData);
        // }
        //
        // return weatherDataList;



        // Map<String, dynamic> data = jsonDecode(response.body);
       //
       //  List<WeatherList> forecasts = [];
       //
       //  for (var item in data['list']) {
       //    forecasts.add(WeatherList.fromJson(item));


       // return forecasts;


      }else{
        throw Exception("failed");
      }

    }
  }


    // List<WeatherList> weatherList = [];
    //
    // Future<List<WeatherList>> getUserData() async {
    //   final response = await http.get(Uri.parse(
    //       "https://api.openweathermap.org/data/2.5/forecast?q=hyderabad&appid=bb26f715f920ad6b3e6674d623cc555e&units=metric"));
    //
    //   // // var response = await http.get(data);
    //    if (response.statusCode == 200){
    //      var jsonData = jsonDecode(response.body);
    //
    //      final weatherList = List<WeatherList>.from(jsonData['list'].map((WeatherList){
    //
    //        );
    //      }));
    //   //    var weatherData = jsonData['list'];
    //   //  }
    //   var data = jsonDecode(response.body);
    //  // return WeatherList.fromJson(data);
    //
    //   return (json.decode(data.body)["list"]["main"]as List)
    //       .map((e) => WeatherList.fromJson(e))
    //       .toList();
    //   // try {
    //   //   var data =
    //   //   await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=hyderabad&appid=bb26f715f920ad6b3e6674d623cc555e&units=metric"));
    //   //   return (json.decode(data.body)["list"])
    //   //       .map((e) => ListElement.fromJson(e));
    //   //
    //   // } catch (e) {
    //   //   throw Exception(e);
    //   // }
    //
    // }

