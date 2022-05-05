import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/app_custom_button.dart';
import 'package:test_app/app_icons.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter , 
          colors: <Color>[
            AppColors.loginBgColor,
            AppColors.loginBgSecondColor
          ], // red to yellow
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Padding(
                padding:  EdgeInsets.only(bottom : 69),
                child:  Text("Добро пожаловать,\nАвторизуйтесь ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              CustomTextField(
                  bgColor: AppColors.elementsBgColor,
                  borderColor: AppColors.textFieldBorderColor,
                  focusedBorderColor: Colors.white,
                  hintColor: AppColors.hintColors,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomTextField(
                    bgColor: AppColors.elementsBgColor,
                    borderColor: AppColors.textFieldBorderColor,
                    focusedBorderColor: Colors.white,
                    hintColor: AppColors.hintColors,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Password'),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppCustomElevatedButton(
                      text: 'Войти',
                      onPressed: () {
                        print("hfhjdsf");
                      },
                      bgColor: AppColors.elementsBgColor,
                      borderColor: AppColors.textFieldBorderColor,
                      fontSize: 16,
                      textColor: Colors.white.withOpacity(0.37),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          print("go to registration");
                        },
                        child: const Text(
                          "Регистрация",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                    InkWell(
                        onTap: () {
                          print("go to foreget password");
                        },
                        child: Text(
                          "Забыли пароль ?",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.35),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ),
              const Text("Или войдите через:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1 , color: Colors.white),
                    ),
                    child: SvgPicture.asset(AppIcons.googleIcon),
                  ),
                  const SizedBox(width: 8,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1 , color: Colors.white),
                    ),
                    child: SvgPicture.asset(AppIcons.facebookIcon),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
