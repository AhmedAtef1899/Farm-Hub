
import 'package:farm_hub/modules/layout/cubit/cubit.dart';
import 'package:farm_hub/modules/layout/cubit/state.dart';
import 'package:farm_hub/modules/home/notification.dart';
import 'package:farm_hub/modules/home/save_items.dart';
import 'package:farm_hub/shared/components/components.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile/posts_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocConsumer<AppCubit, AppStates>(builder: (context, state) =>
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70), // Set the height of the AppBar
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)), // Add bottom radius
              child: AppBar(
                backgroundColor: defaultColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: defaultColor,
                ),
                title: const Text(
                  'yofarm Hub B2B',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center icons horizontally
                    children: [
                      IconButton(
                        onPressed: () {
                          navigateTo(context, const NotificationScreen());
                        },
                        icon: const Icon(
                          CupertinoIcons.bell_fill,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          navigateTo(context, const SaveItemsScreen());
                        },
                        icon: const Icon(
                          CupertinoIcons.bookmark,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child:  Column(
                children: [
                  listingItem(),
                  const SizedBox(height: 40,),
                  insightItem(),
                ],
              ),
            ),
          ),
        ), listener: (context, state) {});
  }
}
