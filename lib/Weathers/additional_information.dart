import 'package:flutter/cupertino.dart';

Widget additionalInformation(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("wind",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
                SizedBox(
                  height: 18,
                ),
                Text("pressure",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  " $wind",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18.0),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "$pressure ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18.0),
                ),
              ],
            ),
            const Column(
              children: [
                Text("humidity",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
                SizedBox(
                  height: 18,
                ),
                Text("feels_like",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0))
              ],
            ),
            Column(
              children: [
                Text(
                  " $humidity",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18.0),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  " $feels_like",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18.0),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
