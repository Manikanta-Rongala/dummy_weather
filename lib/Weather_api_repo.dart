import 'dart:convert';

import 'package:dummy_weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

  class WeatherApiRepository {


        Future<WeatherModel> getUserData() async {
          var data = Uri.parse( "https://api.openweathermap.org/data/2.5/forecast?q=hyderabad&appid=bb26f715f920ad6b3e6674d623cc555e&units=metric");

          var response = await http.get(data);
          var body = jsonDecode(response.body);
          return WeatherModel.fromJson(body);
        // try {
        //   var data =
        //   await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=hyderabad&appid=bb26f715f920ad6b3e6674d623cc555e&units=metric"));
        //   return (json.decode(data.body)["list"])
        //       .map((e) => ListElement.fromJson(e));
        //
        // } catch (e) {
        //   throw Exception(e);
        // }

      }
  //   Future<List<TransactionDetails>> fetchTransaction() async {
  //     final response = await http
  //         .get(
  //         'https://brotherlike-navies.000webhostapp.com/people/people.php' as Uri);
  //
  //     if (response.statusCode == 200) {
  //       return TransactionDetails.fromJsonList(json.decode(response.body));
  //     } else {
  //       throw Exception('Request Failed.');
  //     }
  //   }
   }