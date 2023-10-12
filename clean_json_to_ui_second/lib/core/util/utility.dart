


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home_screen/data/model/home_screen_guideline_model.dart' as modal;

List<modal.HomeScreenGuidelinesModel> listGuideLineModal = [];
List<modal.HomeScreenGuidelinesModel> listGuideLineModalOnline = [];
List<modal.HomeScreenGuidelinesModel> listGuideLineModalOffline = [];
bool switchValue = false;
String global_name = "globaltoremove";
late SharedPreferences sharedprefrance;

//authentication
//

// bool? newBool;
// List<modal.Userdata> user_list = [];
// var mail1;
// var pass;
// Map< String, dynamic>? user_list1 ={};

bool? isChecked=false;
bool? boolApi;
bool? decision;
dynamic login_credentails = {};
dynamic loginCredentialsApi = {};
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
String? finalEmail;
String? finalPassword;
String? finalName;