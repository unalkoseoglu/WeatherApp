import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp2/dataset.dart';

class ExtraWeather extends StatelessWidget {
  final Weather temp;

   ExtraWeather(this.temp);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
           const SizedBox(
              height: 10,
            ),
            Text(
              temp.wind.toString() + ' Km/h',
              style:const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
           const SizedBox(
              height: 10,
            ),
           const Text(
              'Wind',
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
          const  Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
          const  SizedBox(
              height: 10,
            ),
            Text(
              temp.humidity.toString() + ' %',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
           const SizedBox(
              height: 10,
            ),
          const  Text(
              'Humidity',
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
          const  Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
           const SizedBox(
              height: 10,
            ),
            Text(
              temp.chanceRain.toString() + ' %',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          const  SizedBox(
              height: 10,
            ),
          const  Text(
              'Rain',
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
      
      ],
    );
  }
}
