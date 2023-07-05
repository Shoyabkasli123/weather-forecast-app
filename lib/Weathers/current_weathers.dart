import 'package:apis/Weathers/additional_information.dart';
import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          temp,
          style: const TextStyle(
            fontSize: 46,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          location,
          style: const TextStyle(color: Colors.cyan, fontSize: 18.0),
        ),
        SizedBox(
          height: 40,
        ),
        const Text(
          "Additional Information",
          style: TextStyle(
              fontSize: 20.0,
              color: Color(0xdd212121),
              fontWeight: FontWeight.bold),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        additionalInformation("10", "2", "2000", "24.6")
      ],
    ),
  );
}
