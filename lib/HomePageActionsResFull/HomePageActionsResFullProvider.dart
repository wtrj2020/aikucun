import 'package:flutter/material.dart';
import 'package:xshop/Class/ActionsGoodsListClass.dart';
import 'package:xshop/Common/server_method.dart';

class HomePageActionsResFullProvider extends ChangeNotifier {
  var currentIndex = 0;

  Color leftColor = Colors.red;
  Color rightColor = Colors.white;
  Color leftTextColor = Colors.white;
  Color rightTextColor = Colors.red;
  int tabBarIValue = 0;
  ActionsGoodsListClass data;

  HomePageActionsResFullProvider.instance() {
    //TODO Add code here
  }

  Future request(int themeId,actStatus,catId,isPage,pageNum,pageSize) async {
    var formData = {
      "themeId": themeId,
      "ActStatus": actStatus,
      "CatId": catId,
      "ShopId": 0,
      "IsPage": 0,
      "PageNum": 1,
      "PageSize": 10
    };
    await requestPost('ActionsGoodsList', formData: formData).then((val) {
      data = ActionsGoodsListClass.fromJson(val);
      print(val);
    });
    return '填充完成';
  }

  void changeTabBarIndex(int tabBarIndex) {
    if (tabBarIndex == 0) {
      leftColor = Colors.red;
      rightColor = Colors.white;
      leftTextColor = Colors.white;
      rightTextColor = Colors.red;
      tabBarIValue = tabBarIndex;
    } else if (tabBarIndex == 1) {
      rightColor = Colors.red;
      leftColor = Colors.white;
      leftTextColor = Colors.red;
      rightTextColor = Colors.white;
      tabBarIValue = tabBarIndex;
    }
    notifyListeners();
  }
}
