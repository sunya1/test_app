import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/app_custom_button.dart';
import 'package:test_app/app_icons.dart';
import 'package:test_app/auth/cubit/auth_cubit.dart';
import 'package:test_app/auth/cubit/auth_state.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/custom_text_field.dart';
import 'package:test_app/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
          listener: (_, state) {
            if (state is FillAllFieldsState) {
              _showWarningSnackBar(context, "Заполните все поля");
            } else if (state is AuthSuccessState) {
              context.read<AuthCubit>().setAccessToken(state.accessToken);
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomeScreen(),
                ),
              );
            } else if (state is ShowPasswordState) {
              _obscureText = state.isObscureText;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
                        padding: EdgeInsets.only(bottom: 69),
                        child: Text("Добро пожаловать,\nАвторизуйтесь ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      CustomTextField(
                          textColor: Colors.white,
                          bgColor: AppColors.elementsBgColor,
                          borderColor: AppColors.textFieldBorderColor,
                          focusedBorderColor: Colors.white,
                          hintColor: AppColors.hintColors,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          textEditingController:
                              context.read<AuthCubit>().getTextEmailController),
                      BlocBuilder<AuthCubit, AuthState>(builder: (_, state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: CustomTextField(
                              bgColor: AppColors.elementsBgColor,
                              borderColor: AppColors.textFieldBorderColor,
                              focusedBorderColor: Colors.white,
                              hintColor: AppColors.hintColors,
                              obscureText: state is ShowPasswordState
                                  ? state.isObscureText
                                  : _obscureText,
                              isPassword: true,
                              keyboardType: TextInputType.text,
                              textColor: Colors.white,
                              hintText: 'Password',
                              textEditingController: context
                                  .read<AuthCubit>()
                                  .getTextPasswordController,
                              onTapSuffixIcon: () {
                                context
                                    .read<AuthCubit>()
                                    .setShowPassword(!_obscureText);
                              }),
                        );
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: AppCustomElevatedButton(
                              text: 'Войти',
                              onPressed: () {
                                context.read<AuthCubit>().authUser();
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
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: SvgPicture.asset(AppIcons.googleIcon),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: SvgPicture.asset(AppIcons.facebookIcon),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          )),
    );
  }

  void _showWarningSnackBar(
    BuildContext context,
    String text,
  ) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 8),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          action: SnackBarAction(
              label: 'OK', textColor: Colors.white, onPressed: () {}),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.info_outline_rounded, color: Colors.white),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(text,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
