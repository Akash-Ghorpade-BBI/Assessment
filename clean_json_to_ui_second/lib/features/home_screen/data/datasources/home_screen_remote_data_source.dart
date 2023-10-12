import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/util/utility.dart';
import '../model/home_screen_guideline_model.dart';

abstract class HomeScreenRemoteDataSource {
  Future<List<HomeScreenGuidelinesModel>> homeScreenRemoteData();
}

class HomeScreenRemoteDataSourceImpl implements HomeScreenRemoteDataSource {
  HomeScreenRemoteDataSourceImpl();

  @override
  Future<List<HomeScreenGuidelinesModel>> homeScreenRemoteData() async {
    try {
      if (listGuideLineModalOnline.isEmpty) {
        // List<modal.HomeScreenGuidelinesModel> listGuideLineModalOnline = [];

        final response = await http.read(Uri.parse(
            'https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/home_screen.json'));
        final List<dynamic> jsonResponse = json.decode(response);
        listGuideLineModalOnline =
            jsonResponse.map((data) => HomeScreenGuidelinesModel.fromJson(data)).toList();

        print("api fetched");
        return listGuideLineModal = listGuideLineModalOnline;
      } else {
        return listGuideLineModal = listGuideLineModalOnline;
      }
      // return json.decode(response);
    } catch (e) {
      throw Exception("error:$e");
    }
  }
}
// Future<List<modal.HomeScreenGuidelinesModel>> readJsonOnline() async {
//
// }