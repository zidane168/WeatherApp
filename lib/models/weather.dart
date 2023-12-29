/*

// https://api.openweathermap.org/data/2.5/weather?lat=10.771129367135972&lon=106.65882433849404&APPID=07c743c754f9d16aac0c458df7d5c956
// 10.771129367135972, 106.65882433849404 --> HCM City
{
  "coord": {
    "lon": 106.6588,
    "lat": 10.7711
  },
  "weather": [
    {
      "id": 802,
      "main": "Clouds",
      "description": "scattered clouds",
      "icon": "03d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 301.73,
    "feels_like": 304.98,
    "temp_min": 301.73,
    "temp_max": 301.73,
    "pressure": 1014,
    "humidity": 70,
    "sea_level": 1014,
    "grnd_level": 1013
  },
  "visibility": 10000,
  "wind": {
    "speed": 0.56,
    "deg": 45,
    "gust": 0.73
  },
  "clouds": {
    "all": 26
  },
  "dt": 1703814256,
  "sys": {
    "country": "VN",
    "sunrise": 1703805000,
    "sunset": 1703846391
  },
  "timezone": 25200,
  "id": 1566083,
  "name": "Ho Chi Minh City",
  "cod": 200
}
 */

import "dart:convert";

/*
{
  "city": "Mumbai",
  "streets": [
    "address1",
    "address2"
  ]
}

TH1
*/

class Address {
    String city;
    List<String> streets;

    Address({ required this.city, required this.streets });

    factory Address.fromJson(Map<String, dynamic> json) {

      var streetsFromJson = json['streets'];
      return  Address(
          city: json['city'],
          streets: List<String>.from(streetsFromJson),
      );
    }

    Map<String, dynamic> toJson() {
      return  {
        "city" : city,
        "streets" : streets,
      };
    }
}


// TH2, list of map
/*
[
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "http://placehold.it/600/771796",
    "thumbnailUrl": "http://placehold.it/150/771796"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "officia porro iure quia iusto qui ipsa ut modi",
    "url": "http://placehold.it/600/24f355",
    "thumbnailUrl": "http://placehold.it/150/24f355"
  }
]

class Photo {
    String id;
    String title;
    String url;

  Photo({ required this.id, required this.title, required this.url });

  Map<String, String> toJson() {
    return {
      'id' : id,
      'title' : title,
      'url' : url,
    };
  }

  factory Photo.fromJson(Map<String, String> json) {
    return Photo (
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }
}

class T {
  String id;
  List<Photo> listPhoto;
  Address address;

  T({required this.id, required this.listPhoto, required this.address});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "listPhoto": listPhoto.map((e) => e).toList(),
      "address": address,
    };
  }

  factory T.fromJson(Map<String, dynamic> json) {
      return T(
        id: json['id'] as String,
        listPhoto: json['listPhoto'], // chua xu ly
        address: json['address'],
      );
  }
}
*/

class Weather {
  int id;
  String main;
  String description;

  Map<String, dynamic> toJson() {
    return {
      "id":  id,
      "main":  main,
      "description":  description,
    };
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id:  (json["id"]) as int,
      main: json["main"] as String,
      description: json["description"] as String,
    );
  }

  Weather({required this.id, required this.main, required this.description});
}

class Main {
  num temp;
  num feels_like;
  num temp_min;
  num temp_max;
  num humidity;

  Map<String, dynamic> toJson() {
    return {
      "temp":  temp,
      "feels_like":   feels_like,
      "temp_min":  temp_min,
      "temp_max":  temp_max,
      "humidity":  humidity,
    };
  }

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp:  (json["temp"]) as num ,
      feels_like: json["feels_like"] as num,
      temp_min:  json["temp_min"] as num,
      temp_max:  json["temp_max"] as num,
      humidity:  json["humidity"] as num,
    );
  }

  Main({required this.temp, required this.feels_like, required this.temp_min,
      required this.temp_max, required this.humidity});
}

class Wind {
  num speed;
  num deg;

  Map<String, dynamic> toJson() {
    return {
      "speed":  speed,
      "deg": deg,
    };
  }

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json["speed"]) as num,
      deg: (json["deg"]) as num,
    );
  }

  Wind({required this.speed, required this.deg});
}

class WeatherData {
  int id;
  String name;
  int cod;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;


  Map<String, dynamic> toJson() {
    return {
      "id":  id,
      "name":  name,
      "cod":  cod,
      "weather": List<dynamic>.from(weather.map((x) => x.toJson())),  //jsonEncode(this.weather),
      "base":  base,
      "main":  main,
      "visibility":  visibility,
      "wind":  wind,
    };
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      id:  (json["id"]) as int,
      name: json["name"] as String,
      cod: (json["cod"]) as int ,
      weather: List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
       base: json["base"] as String,    // ko dung parse dc, phai dun as String / as int
       main: Main.fromJson(json["main"]),
       visibility: (json["visibility"]) as int,
       wind: Wind.fromJson(json["wind"]),
    );
  }

  WeatherData({required this.id,required this.name, required this.cod,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind
  });
}



