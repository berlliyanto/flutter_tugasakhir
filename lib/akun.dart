// ignore_for_file: unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/user_service.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'constant.dart';

class akun extends StatefulWidget {
  static const nameRoute = '/akun';

  const akun(String g, {super.key});

  @override
  State<akun> createState() => _akunState();
}

class _akunState extends State<akun> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      home: Myakun(),
    );
  }
}

class Myakun extends StatefulWidget {
  const Myakun({super.key});

  @override
  State<Myakun> createState() => _MyakunState();
}

class _MyakunState extends State<Myakun> {
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nohp = TextEditingController();
    // List Otoritas
  final List<String> otoritas = <String>[
    "Admin (Disabled)",
    "User-Management",
    "User-Maintenance",
    "User-Production",
  ];
  late String? otoValue;
  // LIST USER
  List<userModel> userList = [];
  allUserGet alluser = allUserGet();
  
  Future<void> connectAPIGetAll() async {
    setState(() {
      userList.clear();
    });
    userList = await alluser.connectAPIGetAll();
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  void initState() {
    connectAPIGetAll();
    super.initState();
  }

  bool sort = true;
  @override
  Widget build(BuildContext context) {
    // UNTUK LEBAR TAMPILAN
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      //APPBAR----------------------------------------------------------------------------------------------------------------
      appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          toolbarHeight: blockVertical * 6,
          shadowColor: Colors.transparent,
          title: Text(
            "Kelola Akun",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 49, 65).withOpacity(0.5),
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                FontAwesomeIcons.bars,
                size: blockVertical * 3,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, mydashboard,
                      arguments: 'dari mesin 1');
                  // ignore: deprecated_member_use
                },
                icon: Icon(FontAwesomeIcons.house))
          ],
        ),
      drawer: drawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 5, 180, 238),
                Color.fromARGB(255, 1, 37, 53),
              ]),
        ),
        child: LiquidPullToRefresh(
          onRefresh: connectAPIGetAll,
          color: Color.fromARGB(255, 3, 76, 136),
          backgroundColor: Color.fromARGB(255, 5, 180, 238),
          animSpeedFactor: 3,
          showChildOpacityTransition: true,
          height: blockVertical * 30,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(blockHorizontal * 2,
                    blockVertical * 2, blockHorizontal * 2, blockVertical * 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: blockVertical * 70,
                    width: MediaQuerywidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: FutureBuilder(
                        future: allUserGet().connectAPIGetAll(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            if (snapshot.hasData) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      sortColumnIndex: 0,
                                      sortAscending: sort,
                                      border: TableBorder(
                                        verticalInside: BorderSide(
                                          width: 3,
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                        horizontalInside: BorderSide(
                                          width: 3,
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      ////HEADER TABLE------------------------------------------------------------------------------------------------------------
                                      columns: [
                                        DataColumn(
                                          onSort: ((ColumnIndex, ascending) {
                                            setState(() {
                                              sort = !sort;
                                            });
                                            onSortUserName(
                                                ColumnIndex, ascending);
                                          }),
                                          label: Text(
                                            "Username",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: blockVertical * 2),
                                          ),
                                        ),
                                        DataColumn(
                                            label: Text(
                                          "Nama Lengkap",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: blockVertical * 2),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Otoritas",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: blockVertical * 2),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "No Handphone",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: blockVertical * 2),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Actions",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: blockVertical * 2),
                                        )),
                                      ],
                                      //BODY TABLE----------------------------------------------------------------------------------------------------------------
                                      rows: userList.map((e) {
                                        return DataRow(cells: [
                                          DataCell(SelectableText("${e.username}")),
                                          DataCell(SelectableText("${e.name}")),
                                          DataCell(SelectableText("${e.otoritas}")),
                                          DataCell(SelectableText("${e.noHp}")),
                                          DataCell(Row(
                                            children: [
                                              // Update User-------------------------------------------------------------------------------
                                              IconButton(
                                                  onPressed: () {
                                                    AwesomeDialog(
                                                      context: context,
                                                      dialogType: DialogType.infoReverse,
                                                      animType: AnimType.leftSlide,
                                                      body: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text("Update Data "),
                                                              Text("${e.name} ?", style: TextStyle(fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          formField(context, "Username", username, TextInputType.text),
                                                          SizedBox(height: 5,),
                                                          formField(context, "Nama Lengkap", name, TextInputType.text),
                                                          SizedBox(height: 5,),
                                                          formField(context, "No Handphone", nohp, TextInputType.text),
                                                          SizedBox(height: 5,),
                                                          Container(
                                                            alignment: Alignment.center,
                                                            padding: EdgeInsets.only(left: blockHorizontal * 5),
                                                            height: blockVertical * 7.0,
                                                            width: MediaQuerywidth,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[200],
                                                              borderRadius:
                                                                  BorderRadius.circular(blockVertical * 5),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                  vertical: blockVertical * 0.1,
                                                                  horizontal: blockHorizontal * 1),
                                                              child: DropdownSearch<String>(
                                                                clearButtonProps: ClearButtonProps(
                                                                  isVisible: true,
                                                                ),
                                                                popupProps: PopupProps.menu(
                                                                  constraints: BoxConstraints(
                                                                      maxHeight: blockVertical * 30,
                                                                      ),
                                                                  showSelectedItems: true,
                                                                  disabledItemFn: (String s) => s.startsWith('A'),
                                                                ),
                                                                items: otoritas,
                                                                dropdownDecoratorProps: DropDownDecoratorProps(
                                                                  dropdownSearchDecoration: InputDecoration(
                                                                    border: InputBorder.none,
                                                                    labelText: "Pilih Otoritas",
                                                                    hintText: "Otoritas",
                                                                  ),
                                                                ),
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    otoValue = value;
                                                                  });
                                                                  print(otoValue);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      useRootNavigator: true,
                                                      btnOkIcon: FontAwesomeIcons.upload,
                                                      btnOkText: "Update",
                                                      btnOkOnPress: () {
                                                        HttpUserPut.connectAPIPut(e.id.toString(), username.text, name.text, otoValue.toString(), nohp.text);
                                                      },
                                                      btnCancelText: "Cancel",
                                                      btnCancelIcon: FontAwesomeIcons.ban,
                                                      btnCancelOnPress: (){
                                                      }
                                                    ).show();
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.amber,
                                                  )),
                                              // Delete User------------------------------------------------------------------------------
                                              (e.otoritas!="Admin")?IconButton(
                                                  onPressed: () {                                              
                                                    AwesomeDialog(
                                                      context: context,
                                                      dialogType:
                                                          DialogType.question,
                                                      animType:
                                                          AnimType.leftSlide,
                                                      body: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text("Yakin Mau Menghapus "),
                                                          Text("${e.name} ?", style: TextStyle(fontWeight: FontWeight.bold),),
                                                        ],
                                                      ),
                                                      useRootNavigator: true,
                                                      btnOkText: "Delete",
                                                      btnOkIcon: FontAwesomeIcons.trash,
                                                      btnOkOnPress: () {
                                                        HttpUserDelete
                                                                .connectAPIDelete(
                                                                    "${e.id}")
                                                            .then((value) =>
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    myakun,
                                                                    arguments:
                                                                        "berhasil hapus"));
                                                      },
                                                      btnCancelIcon: FontAwesomeIcons.ban,
                                                      btnCancelOnPress: () {},
                                                    ).show();
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ): SizedBox(height: 0.1,),
                                            ],
                                          ))
                                        ]);
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                          }
                          return Center(
                            child: Text("No DATA"),
                          );
                        },
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 1, 201, 201),
        onPressed: () {
          Navigator.pushNamed(context, mytambahuser, arguments: 'from akun');
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  onSortUserName(int ColumnIndex, bool ascending) {
    if (ColumnIndex == 0) {
      if (ascending) {
        userList.sort((a, b) => a.username!.compareTo(b.username!));
      } else if (ascending == false) {
        userList.sort((a, b) => b.username!.compareTo(a.username!));
      }
    }
  }
    Widget formField(BuildContext context, String hint,
      TextEditingController controller, TextInputType inputType) {
        
    final MediaQuerywidth = MediaQuery.of(context).size.width;
    double blockHorizontal = MediaQuerywidth / 100;

    // UNTUK TINGGI TAMPILAN
    final MediaQueryheight = MediaQuery.of(context).size.height;
    double blockVertical = MediaQueryheight / 100;
    return Container(
      padding: EdgeInsets.only(left: blockHorizontal * 5),
      height: blockVertical * 7,
      width: MediaQuerywidth,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(blockVertical * 5),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        autocorrect: false,
        keyboardType: inputType,
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
      ),
    );
  }
}
