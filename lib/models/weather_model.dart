

class WeatherModel {
//    variables or properties
  final String cod;
  final List<WeatherList> list;

//   If the field or variable should be initialized to null :String cod,
//   then change the type to be nullable: String? cod
//
//   constructor
  WeatherModel({
    required this.cod,
    required this.list,
  });

  //fromJson named constructor function to create new instance for weathermodel

  factory WeatherModel.fromJson(Map<String, dynamic> json) {

   String cod = json["cod"];
    //  var lists = <WeatherList>[];
    // List<WeatherList>  list = List<WeatherList>.from(lists.map((i) => WeatherList.fromJson(i as Map<String, dynamic>)));
    //  list = lists;
   List<WeatherList> list = json["list"] as List<WeatherList>;
    //  list = List<WeatherList>.from(list as Iterable);

    return WeatherModel(cod: cod, list: list);
  }
}

class WeatherList {
  final int dt;
  // Main? main;
  // List<Weather>? weather;

  WeatherList({
    required this.dt,
   // this.main,
  });

  factory WeatherList.fromJson(Map<String, dynamic> json) {
   int dt = json["dt"];
   // main = json["main"];
    return WeatherList(dt: dt);
  }
}

// class Main {
//   double? temp;
//
//   Main({
//     this.temp,
//   });
//
//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//   }
// }
//
// class Weather {
//   String? description;
//
//   Weather({
//     this.description,
//   });
//
//   Weather.fromJson(Map<String, dynamic> json) {
//     description = json['description'];
//   }
// }

// class Clouds {
//   int? all;
//
//   Clouds({this.all});
//
//   Clouds.fromJson(Map<String, dynamic> json) {
//     all = json['all'];
//   }
//
// }
//
//
// class Wind {
//   double? speed;
//   int? deg;
//   double? gust;
//
//   Wind({this.speed, this.deg, this.gust});
//
//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//     deg = json['deg'];
//     gust = json['gust'];
//   }
// }
//
//
// class Rain {
//   double? d3h;
//
//   Rain({this.d3h});
//
//   Rain.fromJson(Map<String, dynamic> json) {
//     d3h = json['3h'];
//   }
// }
//
//
//
// class Sys {
//   String? pod;
//
//   Sys({this.pod});
//
//   Sys.fromJson(Map<String, dynamic> json) {
//     pod = json['pod'];
//   }
// }
//
//
// class City {
//   int? id;
//   String? name;
//   Coord? coord;
//   String? country;
//   int? population;
//   int? timezone;
//   int? sunrise;
//   int? sunset;
//
//   City(
//       {this.id,
//         this.name,
//         this.coord,
//         this.country,
//         this.population,
//         this.timezone,
//         this.sunrise,
//         this.sunset});
//
//   City.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     coord = json['coord'];
//     country = json['country'];
//     population = json['population'];
//     timezone = json['timezone'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//   }
// }
//
//
// class Coord {
//   double? lat;
//   double? lon;
//
//   Coord({this.lat, this.lon});
//
//   Coord.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lon = json['lon'];
//   }
// }

//
// class WeatherModel{
//
//   double? temperature;
//    String? description;
//    String? cityName;
//
//   WeatherModel({required this.temperature,
//   required this.description,
//   required this.cityName});
//
//   WeatherModel.fromJson(Map<String, dynamic> json){
//
//     temperature = json["main"]['temp'];
//     description = json["weather"][0]["description"];
//     cityName = json['name'];
//   }
// }
