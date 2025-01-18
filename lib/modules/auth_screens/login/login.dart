
import 'package:farm_hub/modules/auth_screens/forget_password/forget_password.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../shared/components/components.dart';
import '../register/Register.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
            builder: (context, state) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100,),
                           Text(
                            'YoFarm Hub',
                             style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: defaultColor
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Enter your credential to Login',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultForm(
                              label: 'Enter your User name',
                              prefix: FontAwesomeIcons.circleUser,
                              type: TextInputType.name,
                              controller: emailController,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Empty';
                                }
                                return null;
                              }
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          defaultForm(
                              label: 'Enter your Password',
                              prefix: FluentIcons.password_16_regular,
                              type: TextInputType.visiblePassword,
                              controller: passController,
                              suffix: LoginCubit
                                  .get(context)
                                  .suffix,
                              suffixPressed: () {
                                LoginCubit.get(context).changePass();
                              },
                              isPassword: LoginCubit
                                  .get(context)
                                  .isPassword,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Empty';
                                }
                                return null;
                              }
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          state is SocialLoginLoadingState ?
                          const LinearProgressIndicator(color: Colors.green
                            ,) :
                          defaultButton(
                            background: defaultColor,
                              height: 58,
                              radius: 100,
                              text: 'Login',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).getLogin(
                                      email: emailController.text,
                                      password: passController.text
                                  );
                                }
                              }
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text(
                              'or',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: HexColor('#28282899'),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  navigateTo(context, const ForgetPasswordScreen());
                                },
                                child:  Text(
                                  'Forget password?',
                                  style: TextStyle(
                                      color: defaultColor,
                                      fontSize: 14,
                                    fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.center,
                                )
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'nt have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              TextButton(onPressed: () {
                                navigateAndFinish(context,
                                    const RegisterScreen()
                                );
                              }, child:
                               Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: defaultColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: defaultColor
                                ),
                              )
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            listener: (context, state) {
              // if (state is SocialLoginSuccessState) {
              //   CacheHelper.saveData(key: 'uId',
              //       value: state.uId
              //   ).then((value) {
              //     navigateAndFinish(context, SocialLayout());
              //   });
              //   showToast(msg: 'Login Successfully', state: ToastState.SUCCESS);
              // } else if (state is SocialLoginErrorState) {
              //   showToast(msg: 'Email or Password is invalid',
              //       state: ToastState.ERROR);
              // }
            }
        )
    );
  }
}
