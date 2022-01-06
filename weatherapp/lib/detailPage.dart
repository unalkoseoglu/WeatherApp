import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weatherapp2/dataset.dart';
import 'package:weatherapp2/extraWeather.dart';

class DetailPage extends StatelessWidget {
  final Weather tomorrowTemp;
  final List<Weather> sevenDay;
  const DetailPage(this.sevenDay, this.tomorrowTemp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff030317),
      body: Column(
        children: [
          TomorrowWeather(tomorrowTemp),
          SevenDays(sevenDay),
        ],
      ),
    );
  }
}

class SevenDays extends StatelessWidget {
  final List<Weather> sevenDay;
  SevenDays(this.sevenDay);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: sevenDay.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sevenDay[index].day,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 135,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(sevenDay[index].image),
                          width: 40,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          sevenDay[index].name,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('+' + sevenDay[index].max.toString() + '\u00B0',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text('+' + sevenDay[index].min.toString() + '\u00B0',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          )),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

class TomorrowWeather extends StatelessWidget {
  final Weather tomorrowTemp;
  TomorrowWeather(
    this.tomorrowTemp,
  );

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      color: const Color(0xff00A1FF),
      glowColor: const Color(0xff00A1FF),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    Text(
                      '  7 days',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(tomorrowTemp.image),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Tomorrow',
                      style: TextStyle(fontSize: 30, height: 0.1),
                    ),
                    Container(
                      height: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            tomorrowTemp.max.toString(),
                            style: const TextStyle(
                                fontSize: 100, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '/' + tomorrowTemp.min.toString() + '\u00B0',
                            style: TextStyle(
                                color: Colors.black54.withOpacity(0.3),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' ' + tomorrowTemp.name,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              right: 50,
              left: 50,
            ),
            child: Column(
              children: [
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                ExtraWeather(tomorrowTemp),
              ],
            ),
          )
        ],
      ),
    );
  }
}
