import 'package:flutter/material.dart';
import 'package:vms/Authentication/signIn.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import '../widgets/Text_String.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.BigTextColor,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: const AssetImage('assets/logo.png',) , height: height * 0.6),
                Column(
                  children: const [
                    Center(
                      child: Text(OnboardText,
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: AppColors.cardColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          )),
                    ),
                    SizedBox(height:5.0,),
                    Center(
                      child: Text(OnboardTextSubtitle,
                          style: TextStyle(
                            letterSpacing:1.0,
                            color: AppColors.cardColor,
                            fontWeight: FontWeight.w100,
                            fontSize: 20,
                          )),
                    ),
                  ],
                ),
                Row(
                  children:[
                    Expanded(
                      child: OutlinedButton(onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                 LoginPage()));
                             },
                          style:OutlinedButton.styleFrom(
                            shape:RoundedRectangleBorder(),
                                foregroundColor:AppColors.iconColor2,
                            side:BorderSide(color:AppColors.iconColor2),
                            padding:EdgeInsets.symmetric(vertical:Dimension.height10)
                          ),
                          child: Text(tlogin.toUpperCase(),style:const TextStyle(color:AppColors.cardColor,fontSize:18),)
                      ),
                    ),
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
