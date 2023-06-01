
import 'package:get/get.dart';
import 'package:vms/Wecome.dart/welcomepage.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find=>Get.find();

  RxBool animate = false.obs;

  Future startAnimation()async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(const WelcomePage());
  }
}