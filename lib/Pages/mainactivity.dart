import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/widget/mytext.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quiz', style: TextStyle(color: Colors.white)).tr(),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('Test');
            },
          ),
        ],
      ),
      body: Container(margin: const EdgeInsets.all(10), child: getBotton()),
    );
  }

  Widget getBotton() {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.amber,
          ),
          child:  MyText(title: 'General Setting',maltilanguage: false,
                                            ), // Background Color
        ),
        TextButton(
          onPressed: () {
            // login("test@gmail.com", '12345', "3", "test123");
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.amber,
          ),
          child:  MyText(title: 'Login',maltilanguage: false,
                                            ), // Background Color
        ),
        TextButton(
          onPressed: () {
            // getCategory();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.amber,
          ),
          child:  MyText(title: 'Category',maltilanguage: false), // Background Color
        ),
        TextButton(
          onPressed: () {
            // getLeval('2', '1');
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.amber,
          ),
          child:  MyText(title: 'Get Level',maltilanguage: false,), // Background Color
        ),
      ],
    );
  }

  // Future<GeneralSettingModel> fetchgeneralSettings() async {
  //   final response = await ApiService().genaralSetting();
  //   if (response.statusCode == 200) {
  //     debugPrint(response.data);
  //     return GeneralSettingModel.fromJson(jsonDecode(response.data));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  // Future<GeneralSettingModel> login(
  //     String email, String password, String type, String devicetoken) async {
  //   final response =
  //       await ApiService().login(email, password, type, devicetoken);

  //   if (response.statusCode == 200) {
  //     debugPrint(response.data);
  //     return GeneralSettingModel.fromJson(jsonDecode(response.data));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  // Future<CategoryModel> getCategory() async {
  //   final response = await ApiService().categorylist();

  //   if (response.statusCode == 200) {
  //     debugPrint("Get Category==>" + response.data);
  //     return CategoryModel.fromJson(jsonDecode(response.data));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  // Future<GetLevel> getLeval(String categoryID, String userID) async {
  //   final response = await ApiService().getLeval(categoryID, userID);

  //   if (response.statusCode == 200) {
  //     debugPrint(response.data);
  //     return GetLevel.fromJson(jsonDecode(response.data));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
}
