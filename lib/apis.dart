// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Apis extends StatefulWidget {
//   const Apis({Key? key}) : super(key: key);
//
//   @override
//   State<Apis> createState() => _ApisState();
// }
//
// class _ApisState extends State<Apis> {
//   List<Photos> photoslist = [];
//   Future<List<Photos>> getPhotos() async {
//     final response = await http
//         .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       for (Map i in data) {
//         Photos photos = Photos(title: i["title"], url: i["url"] , id:i["id"]);
//         photoslist.add(photos);
//       }
//       return photoslist;
//     } else {
//       return photoslist;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Api Integration",
//           style: TextStyle(color: Colors.orange),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//                 future:  getPhotos(),
//                 builder: (context, snapshot){
//               return ListView.builder(
//                 itemCount: photoslist.length,
//                   itemBuilder: (context,index){
//                 return  ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
//                   ),
//                   subtitle: Text(snapshot.data![index].title.toString()),
//                     title: Text( "Notes id: ${snapshot.data![index].id.toString()}"),
//                 );
//               });
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class Photos {
//   String title;
//   String url;
//   int id;
//
//   Photos({required this.title, required this.url , required this.id});
// }
import 'dart:convert';

import 'package:apis/services/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Weathers/additional_information.dart';
import 'Weathers/current_weathers.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherApiCalling calling = WeatherApiCalling();
  Weather? data;

  Future<void> getdata() async {
    data = await calling.getCurrentlocation("Delhi") as Weather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Weather App",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.blue),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(
                      Icons.wb_sunny_sharp, "{$data!.temp}",
                      "{$data!.cityName}"),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text("Additional information", style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xdd212121),
                      fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const SizedBox(height: 15,),
                  additionalInformation(
                      "{$data.wind}", "{$data.humidity}", "{$data.pressure.}",
                      "$data.feels_loke")
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          }
        ));
  }
}
