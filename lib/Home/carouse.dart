import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/widgets/smalltext_widget.dart';

class Carosen extends StatefulWidget {
  const Carosen({Key? key}) : super(key: key);

  @override
  State<Carosen> createState() => _CarosenState();
}

class _CarosenState extends State<Carosen> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Dimension.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              },
            ),
          ),
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
          // Popular driver
          SizedBox(height: Dimension.height10),
          // Container(
          //   margin: EdgeInsets.only(
          //       left: Dimension.width30, bottom: Dimension.height20),
          //   child: Row(
          //     children: [
          //       const BigText(text: "Popular", color: AppColors.BigTextColor),
          //       SizedBox(
          //         width: Dimension.height10,
          //       ),
          //        Container(
          //           child: const SmallText(
          //         text: ".",
          //         color: AppColors.BigTextColor,
          //       )),
          //       SizedBox(
          //         width: Dimension.height10,
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: Dimension.height10),
          //         child: const SmallText(
          //           text: "Available Garage",
          //           color: Colors.black26,
          //         ),
          //       ),
          //       // SizedBox(width:Dimension.width10),
          //     ],
          //   ),
          // ),
          // List view builder
          //image section
          SizedBox(
            height: Dimension.ListViewHeight900,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: Dimension.width20,
                        right: Dimension.width20,
                        bottom: Dimension.height20),
                    child: Row(
                      children: [
                        // image Section
                        Container(
                          width: Dimension.ListViewImaSize,
                          height: Dimension.ListViewImaSize,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radiUs20),
                            color: Colors.green,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/mabasi3.jpg"),
                            ),
                          ),
                        ),
                        // text section
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimension.radiUs20),
                                  bottomRight:
                                      Radius.circular(Dimension.radiUs20),
                                ),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Dimension.width10,
                                right: Dimension.width10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BigText(text: "Maximize garage corner"),
                                  SizedBox(
                                    height: Dimension.height10,
                                  ),
                                  const SmallText(
                                    text: "With affordable Price",
                                    color: Colors.black26,
                                  ),
                                  SizedBox(
                                    height: Dimension.height10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        text: "Discount Offer",
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
                                        text: "1.73km",
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
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

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
