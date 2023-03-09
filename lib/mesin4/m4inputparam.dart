// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/back_button_pop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class m4param extends StatefulWidget {
  static const nameRoute = '/m4param';
  const m4param(String aj, {super.key});

  @override
  State<m4param> createState() => _m4paramState();
}

class _m4paramState extends State<m4param> {
  String machine_id = "4";
  TextEditingController loading= TextEditingController();
  TextEditingController cycle = TextEditingController();
  TextEditingController oee = TextEditingController();
  TextEditingController harga = TextEditingController();
  final List<String> tipeBenda = [
    "A",
    "B",
    "C",
  ];
  late String? tipeValue;
  @override
  Widget build(BuildContext context) {

    final MediaQuerywidth = MediaQuery.of(context).size.width;
    double blockHorizontal = MediaQuerywidth / 100;

    // UNTUK TINGGI TAMPILAN
    final MediaQueryheight = MediaQuery.of(context).size.height;
    double blockVertical = MediaQueryheight / 100;
    final myappbar = AppBar(
      title: Text("Media Query"),
    );
    final bodyheight = MediaQueryheight -
        myappbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    // Mengetahui Orientasi Device
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mesin 4 Input Parameter",style: TextStyle(fontSize: blockVertical * 2.5),),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 45, 49, 83),
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
                  Color.fromARGB(255, 37, 39, 59),
                  Color.fromARGB(255, 107, 100, 168),
                  
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // CONTAINER PARAMETER-----------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      blockHorizontal * 2,
                      blockVertical * 2,
                      blockHorizontal * 2,
                      blockVertical * 0.1),
                  child: Container(
                    width: MediaQuerywidth,
                    height: blockVertical * 4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 92, 95, 107).withOpacity(0.6),
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                          ]),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: blockHorizontal * 2),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.flask,
                            size: blockVertical * 3,
                            color: Colors.white,
                          ),
                          Text(
                            "    PARAMETER",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: blockVertical * 2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: blockHorizontal * 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuerywidth,
                      height: blockVertical * 20,
                      color: Colors.transparent,
                      child: Stack(children: [
                        //blurEffect
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          child: Container(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.13),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.15),
                                Colors.white.withOpacity(0.5)
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Loading Time",
                                style: TextStyle(
                                    fontSize: blockVertical * 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("5"),
                                  Text(
                                    "  Menit",
                                    style: TextStyle(
                                        fontSize: blockVertical * 1.5),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: blockVertical * 2,
                              ),
                              Text(
                                "Cycle Time",
                                style: TextStyle(
                                    fontSize: blockVertical * 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("5"),
                                  Text(
                                    "  Menit",
                                    style: TextStyle(
                                        fontSize: blockVertical * 1.5),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: blockVertical * 2,
                              ),
                              Text(
                                "OEE Target",
                                style: TextStyle(
                                    fontSize: blockVertical * 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("5"),
                                  Text(
                                    "  %",
                                    style: TextStyle(
                                        fontSize: blockVertical * 1.5),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                InputParam(
                  context,
                ),
                Padding(
                        padding:  EdgeInsets.symmetric(horizontal: blockHorizontal * 2, vertical: blockVertical * 1),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: MediaQuerywidth,
                            height: MediaQueryheight * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromARGB(211, 10, 179, 69),
                                      Color.fromARGB(235, 2, 139, 146)
                                    ])),
                            child: Material(
                              type: MaterialType.canvas,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              child: InkWell(
                                splashColor: Color.fromARGB(19, 3, 191, 233),
                                radius: 100,
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  
                                },
                                child: Center(
                                  child: Text(
                                    "INPUT DATA",
                                    style: TextStyle(
                                        fontSize: MediaQueryheight * 0.02,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: blockHorizontal * 2,),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: MediaQuerywidth,
                            height: MediaQueryheight * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromARGB(210, 179, 117, 10),
                                      Color.fromARGB(235, 146, 2, 2)
                                    ])),
                            child: Material(
                              type: MaterialType.canvas,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              child: InkWell(
                                splashColor: Color.fromARGB(19, 3, 191, 233),
                                radius: 100,
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  
                                },
                                child: Center(
                                  child: Text(
                                    "RESET DATA",
                                    style: TextStyle(
                                        fontSize: MediaQueryheight * 0.02,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget InputParam(BuildContext context) {
    final MediaQuerywidth = MediaQuery.of(context).size.width;
    double blockHorizontal = MediaQuerywidth / 100;
    final MediaQueryheight = MediaQuery.of(context).size.height;
    double blockVertical = MediaQueryheight / 100;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(blockHorizontal * 2, blockVertical * 2,
              blockHorizontal * 2, blockVertical * 0.1),
          child: Container(
            width: MediaQuerywidth,
            height: blockVertical * 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 92, 95, 107).withOpacity(0.6),
                    Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                  ]),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: blockHorizontal * 2),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.plus,
                    size: blockVertical * 3,
                    color: Colors.white,
                  ),
                  Text(
                    "    INPUT PARAMETER",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: blockVertical * 2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockHorizontal * 2, vertical: blockVertical * 0.05),
          child: Container(
            width: MediaQuerywidth,
            height: blockVertical * 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.5)
                  ]),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockHorizontal * 2,
                        vertical: blockVertical * 1),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF605F64))),
                          hintText: "Masukan Nilai...",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 106, 106, 107)),
                          labelText: "Loading Time (Menit)",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 98, 97, 100))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockHorizontal * 2,
                        vertical: blockVertical * 1),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF605F64))),
                          hintText: "Masukan Nilai...",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 106, 106, 107)),
                          labelText: "Cycle Time (Menit)",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 98, 97, 100))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockHorizontal * 2,
                        vertical: blockVertical * 1),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF605F64))),
                          hintText: "Masukan Nilai...",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 106, 106, 107)),
                          labelText: "OEE Target (%)",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 98, 97, 100))),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: blockHorizontal * 2,
                          vertical: blockVertical * 1),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF605F64))),
                            hintText: "Masukan Nilai...",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 106, 106, 107)),
                            labelText: "Harga per Unit (Rp)",
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 98, 97, 100))),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockHorizontal * 2,
                        vertical: blockVertical * 1),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: blockHorizontal*2.5, vertical: blockVertical*0.5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black.withOpacity(0.3)),
                      ),
                      child: DropdownSearch<String>(
                                clearButtonProps: ClearButtonProps(
                                  isVisible: true,
                                ),
                                popupProps: PopupProps.dialog(
                                  constraints: BoxConstraints(maxHeight: blockVertical * 21.5),
                                  showSelectedItems: true,
                                  
                                ),
                                items: tipeBenda,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Pilih Tipe Benda",
                                    labelStyle: TextStyle(color: Color.fromARGB(255, 98, 97, 100)),
                                    hintText: "Tipe Benda",
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 98, 97, 100))
                                  ),
                                ),
                                onChanged: (value){
                                  setState(() {
                                    tipeValue = value;
                                  });
                                  print(tipeValue);
                                },
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
