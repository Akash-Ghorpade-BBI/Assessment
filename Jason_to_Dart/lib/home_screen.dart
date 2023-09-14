import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'details_model.dart';
import 'guideline_model.dart' as modal;
import 'package:http/http.dart' as http;

class MyAppState extends StatefulWidget {
  const MyAppState({super.key});

  @override
  State<MyAppState> createState() => _MyApp();
}

class _MyApp extends State<MyAppState> {
  var jsonData;
  bool switchState= false;
  List<modal.GuidelinesModel> guidline_list = [];
  List<modal.GuidelinesModel> offline_list = [];
  List<modal.GuidelinesModel> online_list = [];

var abc;

  Future<List<modal.GuidelinesModel>> loadJsonAsset() async {
  try {

    if(switchState == true ){
      if(online_list.isEmpty) {

        final data = await http.get(Uri.parse(
            'https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/home_screen.json'));

        if (data.statusCode == 200) {

          var node = json.decode(data.body);
          for (int i = 0; i < node.length; i++) {
            online_list.add(modal.GuidelinesModel.fromJson(node[i]));
          }


          //return guidline_list;
        }
        return guidline_list = online_list;
      }else{return guidline_list = online_list;}
    }//if
    else{

      if(online_list.isEmpty) {
        final String jsonString = await rootBundle.loadString(
            'assets/data.json');
        final data = jsonDecode(jsonString);
        modal.GuidelinesModel obj = modal.GuidelinesModel.fromJson(data[0]);
        var len_data = data.length;
        // print(obj);

        for (int i = 0; i < len_data; i++) {
          offline_list.add(modal.GuidelinesModel.fromJson(data[i]));
        }
        return guidline_list = offline_list;
      }else{
        return guidline_list = offline_list;
      }
      //return guidline_list;
    }
    print(abc);
     return guidline_list;

  } catch (e) {
  throw Exception("Error:$e");
  }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loadJsonAsset();
  // }

  @override
  Widget build(BuildContext context) {
    final nameprovider= Provider.of<UserName>(context);
    return Scaffold(
        appBar: AppBar(

          actions: <Widget>[

            Padding(

              padding: const EdgeInsets.only(top: ),
              child: Text(nameprovider.global_name.toString(),style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            TextButton(
              onPressed: () {},
              child: CupertinoSwitch(
                value: switchState,
                onChanged: (bool value){
                  setState(() {
                    switchState = value;
                  });
                  print(value);
                },
              ),

            ),

            TextButton(
              onPressed: () {},
              child:  ElevatedButton(
                onPressed: () async{
                  Navigator.pushNamed(context,'details');
                },
                child: const Text(
                  'Users Detils',
                  //style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),

            ),


          ],
        ),
        body: FutureBuilder<List<modal.GuidelinesModel>>(

            future: loadJsonAsset(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator while data is being fetched.
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                guidline_list = snapshot.data!;
                return ListView.builder(


                    itemCount: guidline_list.length,
                    itemBuilder: (context, index) {
                      modal.GuidelinesModel guidLineModel =
                      guidline_list[index];

                      return Column(

                        children: [
                          // SizedBox(
                          //   height: 10,
                          //   width: 1000,
                          //   child: Column(
                          //     children: [
                          //       Text('Guidline App'),
                          //       TextButton(
                          //         onPressed: () {},
                          //         child: const Text('Action 1'),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 150,
                            width: 400,
                            child: Column(
                              children: [
                                Text(
                                  guidLineModel.categoryName!,
                                ),
                                SizedBox(
                                  height: 100,
                                  width: 1000,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: guidLineModel.items!.length,
                                      itemBuilder: (context, index) {
                                        modal.Items xyz =
                                        guidLineModel.items![index];
                                        // modal.Items1 xyz1=guidLineModel.items![index];

                                        String? hexString = xyz
                                            .defaultProperties!
                                            .color!
                                            .backgroundColor;
                                        final Color z1 =
                                        HexColor.fromHex(hexString!);

                                        String? hexaText = xyz
                                            .defaultProperties!
                                            .color!
                                            .textColor;
                                        final Color z2 =
                                        HexColor.fromHex(hexaText!);

                                        String? hexaTheam = xyz
                                            .defaultProperties!
                                            .color!
                                            .themeColor;
                                        final Color z3 =
                                        HexColor.fromHex(hexaTheam!);
                                        return Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 100,
                                              color: z3,
                                            ),
                                            Container(
                                                color:
                                                z1, //Color(int.parse(z1)),
                                                height: 100,
                                                width: 100,
                                                child: Text(
                                                  "${xyz.id!}\n${xyz.tag!}",
                                                  style: (TextStyle(color: z2)),
                                                ))
                                          ],
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: guidLineModel.showOnlySubCategory!,
                            child: SizedBox(
                              height: 150,
                              width: 400,
                              child: Column(
                                children: [
                                  Text(
                                    guidLineModel.subCategory!.title!,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: 1000,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: guidLineModel
                                            .subCategory!.items!.length,
                                        itemBuilder: (context, index) {
                                          modal.Items1 xyz = guidLineModel
                                              .subCategory!.items![index];
                                          // modal.Items1 xyz1=guidLineModel.items![index];

                                          String? hexString = xyz
                                              .defaultProperties!
                                              .color!
                                              .backgroundColor;
                                          final Color z1 =
                                          HexColor.fromHex(hexString!);

                                          String? hexaText = xyz
                                              .defaultProperties!
                                              .color!
                                              .textColor;
                                          final Color z2 =
                                          HexColor.fromHex(hexaText!);

                                          String? hexaTheam = xyz
                                              .defaultProperties!
                                              .color!
                                              .themeColor;
                                          final Color z3 =
                                          HexColor.fromHex(hexaTheam!);
                                          return Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 100,
                                                color: z3,
                                              ),
                                              Container(
                                                  color:
                                                  z1, //Color(int.parse(z1)),
                                                  height: 100,
                                                  width: 100,
                                                  child: Text(
                                                    "${xyz.id!}\n${xyz.name!}",
                                                    style:
                                                    (TextStyle(color: z2)),
                                                  ))
                                            ],
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );

                    });

              }
            } //buildr
        ));

  } //widget
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}