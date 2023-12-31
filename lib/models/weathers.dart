class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feels_like,
      this.pressure});

  Weather.fromJson(Map<String,dynamic> json){
    cityName =json["name"];
    temp = json["current"]["temp_c"];
    wind= json["current"]["wind_kph"];
    pressure = json["current"]["pressure_mb"];
    humidity= json["current"]["humidity"];
    feels_like=json["current"]["feelslike_c"];
  }
}
