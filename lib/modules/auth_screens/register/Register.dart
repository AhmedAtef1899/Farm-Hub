
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/color.dart';
import '../login/login.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class RegisterScreen extends StatefulWidget {


  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        builder: (context, state) => Container(
          color: Colors.grey[100],
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                         children: [
                           Expanded(
                             flex: 2,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   'YoFarm Hub',
                                   style: Theme.of(context).textTheme.titleLarge,
                                 ),
                                 const SizedBox(
                                   height: 16,
                                 ),
                                  Text(
                                   'Enter your Sign Up information below',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                 ),
                               ],
                             ),
                           ),
                           Expanded(
                             child: Stack(
                               alignment: FractionalOffset.topRight,
                               children: [
                                  Container(
                                   height: 110,
                                   width: 110,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Container(
                                    height: 18,
                                     width: 18,
                                     decoration: BoxDecoration(
                                       color: defaultColor,
                                       shape: BoxShape.circle
                                     ),
                                     child: Icon(
                                       Icons.add,
                                       color: CupertinoColors.white,
                                       size: 14,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           )
                         ],
                       ),
                      const SizedBox(
                        height: 40,
                      ),
                      defaultForm(
                        label: 'Enter your User name',
                        prefix: FontAwesomeIcons.circleUser,
                        type: TextInputType.text,
                        controller: nameController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      defaultForm(
                        label: 'Enter your Business name',
                        prefix: Icons.add_home_work_outlined,
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultForm(
                        label: 'Enter your location',
                        prefix: CupertinoIcons.location_solid,
                        type: TextInputType.text,
                        controller: phoneController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultForm(
                        label: 'Enter your Phone',
                        prefix: CupertinoIcons.phone,
                        type: TextInputType.visiblePassword,
                        controller: passController,
                        isPassword: RegisterCubit.get(context).isPassword,
                        validate: (value) {
                          if (value.isEmpty)
                          {
                            return 'Empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultForm(
                        label: 'Enter your Password',
                        prefix: FluentIcons.password_16_regular,
                        type: TextInputType.visiblePassword,
                        controller: passController,
                        isPassword: RegisterCubit.get(context).isPassword,
                        validate: (value) {
                          if (value.isEmpty)
                          {
                            return 'Empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      state is SocialRegisterLoadingState?
                       LinearProgressIndicator(color: Colors.greenAccent[500]
                        ,) :
                      defaultButton(
                        height: 58,
                          radius: 100,
                          background: defaultColor,
                          text: 'Sign up',
                          function: (){
                          }
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 68,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: CupertinoColors.white
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 68,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: CupertinoColors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.facebook,
                              color: HexColor('#1877F2'),
                            ),
                            const SizedBox(width: 10,),
                            const Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            'Already have an account?',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 5,),
                          TextButton(onPressed: (){
                            navigateAndFinish(context, const LoginScreen());
                            },
                              child: Text(
                                'Login',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        listener: (context, state) {
        },
      ),
    );
  }
}
