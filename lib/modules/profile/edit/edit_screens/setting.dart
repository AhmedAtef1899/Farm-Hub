

import 'package:farm_hub/modules/layout/cubit/cubit.dart';
import 'package:farm_hub/shared/components/components.dart';
import 'package:farm_hub/shared/network/local/cache_helper.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restart_app/restart_app.dart';

import '../../../layout/cubit/state.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(builder: (context, state) =>
          Builder(
            builder: (context) {
              bool mode = CacheHelper.getData(key: 'iconMode') ?? false;
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(
                      CupertinoIcons.back
                  )),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Setting',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 30,),
                      GestureDetector(
                          onTap: () {},
                          child: _editItem('English', FontAwesomeIcons.language,
                              const Icon(FluentIcons.edit_12_filled))),
                      const SizedBox(height: 8,),
                      GestureDetector(
                          onTap: () {},
                          child: _editItem(
                              'FAQs', FluentIcons.question_circle_48_filled,
                              const Icon(CupertinoIcons.arrow_right))),
                      const SizedBox(height: 8,),
                      GestureDetector(
                          onTap: () {},
                          child: _editItem(
                              'Support', FluentIcons.person_support_32_filled,
                              const Icon(
                                  FluentIcons.arrow_right_24_filled
                              ))),
                      const SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {
                          AppCubit.get(context).changeMode();
                        },
                        child: _editItem('Light/Dark', Icons.dark_mode, Stack(
                          alignment:mode? Alignment.centerLeft : Alignment.centerRight,
                          children: [
                            Container(
                              width: 40,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 12,
                            ),
                          ],
                        )),
                      ),
                      const SizedBox(height: 8,),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) =>
                                FractionallySizedBox(
                                  heightFactor: 0.35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 8,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: mode? secondColor :Colors.grey,
                                              borderRadius: BorderRadius.circular(
                                                  8),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        const Text(
                                          'Heads up! You\'re about to delete your account. This action is permanent, and all your data will be lost. Are you sure you want to proceed?',
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 24),
                                        defaultButton(
                                          background: Colors.red,
                                          text: 'Delete Account',
                                          function: () {},
                                          height: 58,
                                        ),
                                        const SizedBox(height: 24,),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 58,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  100),
                                              color: mode? secondColor :Colors.white,
                                              border: Border.all(
                                                style: BorderStyle.solid,
                                                width: 2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: mode? secondColor :Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                FluentIcons.person_desktop_20_filled,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text('Delete Account', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ), listener: (context, state) {}),);
  }
}

Widget _editItem(String text, IconData icon,Widget widget) => Builder(
  builder: (context) {
    bool mode = CacheHelper.getData(key: 'iconMode') ?? false;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: mode? secondColor :Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 16,
          ),
          Text(text,style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
          ),),
          const Spacer(),
          widget
        ],
      ),
    );
  }
);
