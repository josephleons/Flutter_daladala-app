import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/screens/users/Vehicle_details/carDetailsDriver.dart';
import 'package:vms/screens/users/WidgetsUser/userNavigationDrawer.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/appIconWidgets.dart';
import '../../util/colors.dart';
import '../../widgets/bigtext_widget.dart';
import '../../widgets/smalltext_widget.dart';

class userDashboard extends StatefulWidget {
  const userDashboard({Key? key}) : super(key: key);

  @override
  State<userDashboard> createState() => _userDashboardState();
}

class _userDashboardState extends State<userDashboard> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimension.pageViewContainer;
  @override
  void disposa() {
    pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const BigText(
            text: "UserDashboards",
            color: AppColors.cardColor,
          ),
          backgroundColor: AppColors.defaulColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(9),
            ),
          ),
        ),
        // Drawer
        drawer: const userNavigationDrawer(),

        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.only(left:Dimension.width5,top:5,right:Dimension.width5,bottom:Dimension.height45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimension.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position);
                    },
                  ),
                ),
                //
                DotsIndicator(
                  dotsCount: 5,
                  position: _currPageValue,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeColor: AppColors.iconColor2,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: Dimension.height45,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape:const RoundedRectangleBorder(
                                borderRadius:BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                )
                            ),
                            backgroundColor: AppColors.cardColor.withOpacity(Dimension.opacity),
                            foregroundColor: AppColors.iconColor2.withOpacity(Dimension.opacity),
                            side: const BorderSide(
                              color: AppColors.iconColor2,),
                            padding: const EdgeInsets.all(18),
                          ),
                          onPressed: () {
                          },
                          child:Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Icon(
                                    LineAwesomeIcons.user_cog,
                                    color: AppColors.iconColor2.withOpacity(Dimension.opacity),
                                    size: 40,
                                  ),
                                ),
                              ),
                              SizedBox(width:Dimension.width5,),
                               Expanded(
                                 child: BigText(
                                  text: "My Account",
                                  color: AppColors.defaulColor.withOpacity(Dimension.opacity),
                              ),
                               ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(width:Dimension.height10),
                    Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape:const RoundedRectangleBorder(
                                borderRadius:BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                )
                            ),
                            backgroundColor: AppColors.cardColor.withOpacity(Dimension.opacity),
                            foregroundColor: AppColors.iconColor2.withOpacity(Dimension.opacity),
                            side: const BorderSide(
                              color: AppColors.iconColor2,),
                            padding: const EdgeInsets.all(20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => CarDetails()));
                          },
                          child:Row(
                            children: [
                               Expanded(
                                 child: Center(
                                  child: Icon(
                                    LineAwesomeIcons.user_check,
                                    color: AppColors.iconColor2.withOpacity(Dimension.opacity),
                                    size: 40,
                                  ),
                              ),
                               ),
                              SizedBox(width:Dimension.width5,),
                              Expanded(child:BigText(
                                text: "Car",
                                color: AppColors.defaulColor.withOpacity(Dimension.opacity),
                              ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimension.height45,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape:const RoundedRectangleBorder(
                                borderRadius:BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                )
                            ),
                            backgroundColor: AppColors.cardColor.withOpacity(Dimension.opacity),
                            foregroundColor: AppColors.iconColor2.withOpacity(Dimension.opacity),
                            side: const BorderSide(
                              color: AppColors.iconColor2,),
                            padding: const EdgeInsets.all(20),
                          ),
                          onPressed: () {
                          },
                          child:Row(
                            children: [
                              Expanded(child: Icon(
                                  LineAwesomeIcons.car,
                                  color: AppColors.iconColor2.withOpacity(Dimension.opacity),
                                  size: 40,
                                ),
                              ),
                              SizedBox(width:Dimension.width5,),
                              Expanded(child:BigText(
                                text: "Service Car",
                                color: AppColors.defaulColor.withOpacity(Dimension.opacity),
                              ),
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(width:Dimension.height10),
                    Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape:const RoundedRectangleBorder(
                                borderRadius:BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                )
                            ),
                            backgroundColor: AppColors.cardColor.withOpacity(Dimension.opacity),
                            foregroundColor: AppColors.iconColor2.withOpacity(Dimension.opacity),
                            side: const BorderSide(
                              color: AppColors.iconColor2,),
                            padding: const EdgeInsets.all(20),
                          ),
                          onPressed: () {
                          },
                          child:Row(
                            children: [
                              Center(
                                child: Icon(
                                  LineAwesomeIcons.user_check,
                                  color: AppColors.iconColor2.withOpacity(Dimension.opacity),
                                  size: 40,
                                ),
                              ),
                              SizedBox(width:Dimension.width5,),
                              BigText(
                                text: "Driver",
                                color: AppColors.defaulColor.withOpacity(Dimension.opacity),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //Bottom Navigation
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.barColor,
          items: [
            CurvedNavigationBarItem(
                icon: const Icon(Icons.home,
                    size: 30, color: AppColors.textColor),
                label: "Home"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.settings,
                    size: 30, color: AppColors.textColor),
                label: "Settings"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.person,
                    size: 30, color: AppColors.textColor),
                label: "Accounts"),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        // BottomNavi(context);
      ),
    );
  }

  // scrolling left and right function?
  Widget _buildPageItem(int index) {
    // slide scale function
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, _height * (1 - _scaleFactor) / 2, 1);
    }
    // make it transform
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          // slider container
          Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimension.width5, right: Dimension.width5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xffEEFCFF)
                    : const Color(0xff2AA389),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/mabasi3.jpg"),
                )),
          ),
          // SmallBox Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.height130,
              margin: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width30,
                  bottom: Dimension.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffEEFCFF),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Color(0xffEEFCFF),
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Color(0xffEEFCFF),
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height10,
                    left: Dimension.width10,
                    right: Dimension.width10),
                child: Column(
                  children: [
                    const BigText(text: "Services"),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    color: AppColors.iconColor2,
                                    size: 15,
                                  )),
                        ),
                        SizedBox(width: Dimension.width10),
                        const SmallText(text: "4.5"),
                        SizedBox(
                          width: Dimension.width10,
                        ),
                        const SmallText(text: "Quality Service"),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.money_off,
                          color: AppColors.iconColor1,
                        ),
                        // SizedBox(
                        //   width: 2,
                        // ),
                        const Expanded(
                            child: SmallText(
                          text: "Discount",
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.location_on,
                          color: AppColors.iconColor2,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Expanded(
                            child: SmallText(
                          text: "Near Everywhere",
                        )),
                        SizedBox(
                          width: Dimension.width10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
