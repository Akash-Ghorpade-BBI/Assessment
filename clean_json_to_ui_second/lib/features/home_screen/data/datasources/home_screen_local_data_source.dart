
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

import '../../../../core/util/utility.dart';
import '../model/home_screen_guideline_model.dart';

abstract class HomeScreenLocalDataSource {
  Future<List<HomeScreenGuidelinesModel>> homeScreenLocalData();
}

class HomeScreenLocalDataSourceImpl implements HomeScreenLocalDataSource {
  HomeScreenLocalDataSourceImpl();

  @override
  Future<List<HomeScreenGuidelinesModel>> homeScreenLocalData() async {
    try {
      if (listGuideLineModalOffline.isEmpty) {
        final String response = await rootBundle.loadString('assests/temp.json');
        final data = await json.decode(response);
        // modal.HomeScreenGuidelinesModel obj = modal.HomeScreenGuidelinesModel.fromJson(data[0]);
        // print(obj);
        for (int i = 0; i < data.length; i++) {
          listGuideLineModalOffline.add(HomeScreenGuidelinesModel.fromJson(data[i]));
        }
        // print(listGuideLineModal[0].sequenceNo);
        listGuideLineModalOffline.sort((a, b) =>
            num.parse(a.sequenceNo!).compareTo(num.parse(b.sequenceNo!)));
        // print(listGuideLineModal[0].sequenceNo);
        // setState(() {
        //   _items = data[0]["items"];
        // });
        print("local data used");
        return listGuideLineModal = listGuideLineModalOffline;
      } else {
        return listGuideLineModal = listGuideLineModalOffline;
      }
    } catch (e) {
      throw Exception("error:$e");
    }
  }
}