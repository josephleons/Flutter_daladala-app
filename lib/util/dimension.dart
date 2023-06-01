import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 732/220
  static double pageViewContainer = screenHeight / 3.32;
  // 732/320
  static double pageView = screenHeight / 2.28;
  static double pageViewTextContainer = screenHeight / 7.03;

  // with dynamic padding and margin 732/10
  static double height10 = screenHeight / 73.2;
  static double height20 = screenHeight / 36.6;
  static double height15 = screenHeight / 48.8;
  static double height130 = screenHeight / 5.63;
  static double height45 = screenHeight / 16.27;
  static double height220 = screenHeight / 3.3;
  // with dynamic padding and margin 732/10

  static double width10 = screenHeight / 73.2;
  static double width20 = screenHeight / 36.6;
  static double width15 = screenHeight / 48.8;
  static double width30 = screenHeight / 24.4;
  static double width5 = screenHeight / 146.4;


  static double font18 = screenHeight / 40.6;
  static double radiUs10 = screenHeight / 73.2;
  static double radiUs20 = screenHeight / 36.6;
  // icon Size
  static double iconSize16 = screenHeight / 45.75;
  static double iconSize24 = screenHeight / 30.5;
  static double opacity = screenHeight / 1220;
  // listView
  static double ListViewImaSize = screenWidth / 4.88;
  static double ListViewHeight900 = screenHeight /0.81;
  static double ListViewTextSize = screenWidth / 36.6;

  // popula garage
  static double populaGarageImgSize = screenHeight /2.09;
  static double buttonSize120 = screenWidth /6.1;


}
