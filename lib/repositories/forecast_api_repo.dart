// import 'dart:convert';
//
// import '../models/weatherList.dart';
// import 'package:http/http.dart' as http;
// class ForecastApiRepo{
//
//   List<ForecastWeather> forecastWeather = [];
//
//   Future<void> getWeatherForecast() async {
//     // Make an API call to OpenWeatherAPI to get the forecast weather data
//     var response = await http.get(Uri.parse(
//         "https://api.openweathermap.org/data/2.5/forecast?q=hyderabad&appid=bb26f715f920ad6b3e6674d623cc555e&units=metric"));
//
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       var weatherData = jsonData['list'];
//
//       setState(() {
//         forecastWeather.clear();
//
//         for (var data in weatherData) {
//           var date = data['dt_txt'];
//           var description = data['weather'][0]['description'];
//           var temperature = data['main']['temp'];
//
//           forecastWeather.add(ForecastWeather(
//               date: date,
//               description: description,
//               temperature: temperature
//           ));
//         }
//       });
//     }
//   }
//
//
//
//
//
// }