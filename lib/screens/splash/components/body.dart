import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

// This is the best practice
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Spacer();
    
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Image.asset(
          "assets/images/login.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Padding(
            padding: new EdgeInsets.all(1.0)),

        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          height: SizeConfig.screenHeight * 0.07,
          
          
          
          child: DefaultButton(
            text: "Student",
            
           
            press: () {
              Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            },
          ),
        ),
        Padding(
              padding: EdgeInsets.only(top: 10),
        ),
        Align(
        alignment: Alignment.bottomCenter,),
        SizedBox(
          
          width: SizeConfig.screenWidth * 0.6,
          height: SizeConfig.screenHeight * 0.07, 
          child: DefaultButton(
            text: "Adminstration",
            
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        
      ],
    );
  }
}