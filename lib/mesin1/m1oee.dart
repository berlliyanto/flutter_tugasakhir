// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/back_button_pop.dart';
import 'package:percent_indicator/percent_indicator.dart';

class m1oee extends StatelessWidget {
  static const nameRoute = '/m1oee';
  const m1oee(String m, {super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQuerywidth = MediaQuery.of(context).size.width;
    double blockHorizontal = MediaQuerywidth / 100;

    // UNTUK TINGGI TAMPILAN
    final MediaQueryheight = MediaQuery.of(context).size.height;
    double blockVertical = MediaQueryheight / 100;

    // Mengetahui Orientasi Device
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Mesin 1 OEE",
            style: TextStyle(fontSize: blockVertical * 2.5),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 6, 160, 207),
          toolbarHeight: blockVertical * 8,
          leading: backbutton(context),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 29, 206, 215),
                  Color.fromARGB(255, 19, 78, 227),
                ]),
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: blockVertical * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockHorizontal * 2,
                        vertical: blockVertical * 1),
                    child: Container(
                      height: blockVertical * 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                          offset: Offset(3, 5),
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                        )],
                          borderRadius:
                              BorderRadius.circular(blockVertical * 2)),
                      child: Column(
                        children: [
                          SizedBox(height: blockVertical * 0.5),
                          Text(
                            "Overall Equipment and Effectivenes",
                            style: TextStyle(
                                fontSize: blockVertical * 2.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Center(
                            child: CircularPercentIndicator(
                              radius: blockVertical * 10,
                              lineWidth: 20,
                              percent: 0.7,
                              backgroundColor: Colors.green.withOpacity(0.5),
                              progressColor: Color.fromARGB(255, 0, 255, 8),
                              circularStrokeCap: CircularStrokeCap.round,
                              animation: true,
                              animationDuration: 2000,
                              center: Text(
                                "70 %",
                                style: TextStyle(fontSize: blockVertical * 3),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: blockVertical * 2.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Availability",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("20%", style: TextStyle()),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Performance",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                          Text("20%", style: TextStyle()),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Quality",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                          Text("50%", style: TextStyle()),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: blockHorizontal * 2,
                        right: blockHorizontal * 2,
                        top: blockVertical * 0.5,
                        bottom: blockVertical * 1.5),
                    child: Container(
                      height: blockVertical * 87,
                      width: MediaQuerywidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(blockVertical * 2),
                        boxShadow: [BoxShadow(
                          offset: Offset(3, 5),
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                        )]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: blockVertical * 1,
                          ),
                          Text(
                            "Availability",
                            style: TextStyle(
                                fontSize: blockVertical * 2.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(thickness: 2),
                          SizedBox(
                            height: blockVertical * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularPercentIndicator(
                                radius: blockVertical * 8,
                                lineWidth: 10,
                                percent: 0.7,
                                backgroundColor:
                                    Color.fromARGB(255, 76, 175, 170)
                                        .withOpacity(0.5),
                                progressColor: Color.fromARGB(255, 0, 217, 255),
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 2000,
                                center: Text(
                                  "70 %",
                                  style: TextStyle(fontSize: blockVertical * 3),
                                ),
                              ),
                              Container(
                                height: blockVertical * 20,
                                width: blockHorizontal * 40,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        end: Alignment.bottomRight,
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color.fromARGB(255, 180, 179, 179)
                                              .withOpacity(0.5),
                                          Color.fromARGB(255, 182, 182, 182)
                                              .withOpacity(0.2),
                                        ]),
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Running Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("2 menit"),
                                    Divider(color: Colors.transparent),
                                    Text(
                                      "Operation Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("30 menit"),
                                    Divider(color: Colors.transparent),
                                    Text(
                                      "Downtime",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("1 menit"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: blockVertical * 1,
                          ),
                          Divider(thickness: 2),
                          Text(
                            "Performance",
                            style: TextStyle(
                                fontSize: blockVertical * 2.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: blockVertical * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularPercentIndicator(
                                radius: blockVertical * 8,
                                lineWidth: 10,
                                percent: 0.7,
                                backgroundColor:
                                    Color.fromARGB(255, 175, 76, 76)
                                        .withOpacity(0.5),
                                progressColor: Color.fromARGB(255, 255, 0, 0),
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 2000,
                                center: Text(
                                  "70 %",
                                  style: TextStyle(fontSize: blockVertical * 3),
                                ),
                              ),
                              Container(
                                height: blockVertical * 20,
                                width: blockHorizontal * 40,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        end: Alignment.bottomRight,
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color.fromARGB(255, 180, 179, 179)
                                              .withOpacity(0.5),
                                          Color.fromARGB(255, 182, 182, 182)
                                              .withOpacity(0.2),
                                        ]),
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Cycle Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("2 menit"),
                                    Divider(color: Colors.transparent),
                                    Text(
                                      "Flawless",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("30 menit"),
                                    Divider(color: Colors.transparent),
                                    Text(
                                      "Operation Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("1 menit"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: blockVertical * 1,
                          ),
                          Divider(thickness: 2),
                          Text(
                            "Quality",
                            style: TextStyle(
                                fontSize: blockVertical * 2.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: blockVertical * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularPercentIndicator(
                                radius: blockVertical * 8,
                                lineWidth: 10,
                                percent: 0.7,
                                backgroundColor:
                                    Color.fromARGB(255, 175, 173, 76)
                                        .withOpacity(0.5),
                                progressColor: Color.fromARGB(255, 251, 255, 0),
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 2000,
                                center: Text(
                                  "70 %",
                                  style: TextStyle(fontSize: blockVertical * 3),
                                ),
                              ),
                              Container(
                                height: blockVertical * 20,
                                width: blockHorizontal * 40,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        end: Alignment.bottomRight,
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color.fromARGB(255, 180, 179, 179)
                                              .withOpacity(0.5),
                                          Color.fromARGB(255, 182, 182, 182)
                                              .withOpacity(0.2),
                                        ]),
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Processed Unit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("2 menit"),
                                    Divider(color: Colors.transparent),
                                    Text(
                                      "Flawless",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("30 menit"),
                                    Divider(color: Colors.transparent),
                                    Text(
                                      "Defect",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("1 menit"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
