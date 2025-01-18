
import 'package:farm_hub/modules/layout/cubit/cubit.dart';
import 'package:farm_hub/modules/layout/cubit/state.dart';
import 'package:farm_hub/modules/profile/edit/edit.dart';
import 'package:farm_hub/modules/profile/posts_view.dart';
import 'package:farm_hub/shared/components/components.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocConsumer<AppCubit, AppStates>(builder: (context, state) =>
        Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(onPressed: (){
                  navigateTo(context, const EditScreen());
                },
                    icon: const Icon(
                      FluentIcons.edit_settings_24_filled,
                      size: 30,
                    )),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      '@harrisonmatovu',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: defaultColor
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(
                            'asset/images/Handsome adult male posing.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: CupertinoColors.white,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.green[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,),
                  const Text('Mr. Harrison',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24
                    ),),
                  const SizedBox(
                    height: 10,),
                  Text(
                    'Duo Farm Hub',
                    style: TextStyle(
                        color: Colors.grey[400]
                    ),
                  ),
                  const SizedBox(
                    height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            '2.4k',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Follower\'s',
                            style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            '800',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Following\'s',
                            style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Icon(
                                    FluentIcons.contact_card_group_16_filled
                                ),
                                Text('FAR001', style: TextStyle(fontSize: 12),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Icon(
                                    FluentIcons.live_24_filled
                                ),
                                Text(
                                  'Livestock', style: TextStyle(fontSize: 12),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Icon(
                                    FluentIcons.location_20_filled
                                ),
                                Text('Buikwe,Kasubi',
                                  style: TextStyle(fontSize: 12),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              'Timeline',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              'Review',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.1,
                          // Responsive avatar radius
                          backgroundImage: const AssetImage(
                              'asset/images/Handsome adult male posing.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.015),
                          child: CircleAvatar(
                            radius: screenWidth * 0.02,
                            backgroundColor: CupertinoColors.white,
                            child: CircleAvatar(
                              radius: screenWidth * 0.017,
                              backgroundColor: Colors.green[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harrisonmatovu',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth *
                                0.05, // Responsive font size
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location_solid,
                              color: Colors.grey[400],
                              size: screenWidth *
                                  0.04, // Responsive icon size
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Text(
                              'Anatole, France.',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: screenWidth *
                                    0.035, // Responsive font size
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: screenWidth * 0.005,
                                  backgroundColor: Colors.green,
                                ),
                                SizedBox(width: screenWidth * 0.005),
                                Text(
                                  'May 1, 24',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 0.03,
                                    // Responsive font size
                                    color: defaultColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.bookmark,
                        size: screenWidth *
                            0.05, // Optional: adjust icon size if needed
                      ),
                    ),
                    const SizedBox(width: 14,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < 3; i++) ...[
                          Container(
                            height: screenWidth * 0.01,
                            width: screenWidth * 0.01,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                          if (i < 2) SizedBox(
                              height: screenWidth * 0.005),
                        ],
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 8,
                      left: 24,
                      bottom: 8,
                      right: 8
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Cows',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 8,
                            left: 24,
                            bottom: 8,
                            right: 24
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: const Text(
                          'Sponsored',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Et ullamcorper sed nisi urna. Nibh nulla lobortis rhoncus dui habitasse id egestas amet.',
                  style: TextStyle(
                      color: Colors.grey[700]
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 52,
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'UGX 10',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                          ),

                        ),
                      ),
                    )),
                    const SizedBox(width: 8,),
                    const Text(
                      '-',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(child: Container(
                      height: 52,
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'UGX 15',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                          ),

                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image(
                                height: 240,
                                image: AssetImage('asset/images/Close up of box with ripe vegetables.png',),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                navigateTo(context, const PostsViewScreen());
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    const Image(
                                      height: 240,
                                      image: AssetImage('asset/images/Cows eating lush grass on the green field in front of fuji mountain, japan..png',),
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '6+',
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            ),
                                          ),
                                          const SizedBox(height: 8,),
                                          Text(
                                            'Posted on yofarmhub',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[100]
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 5,),
                                          const Text(
                                            'duofarmhub',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              height: 44,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.eye_fill,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 8,),
                                  Text(
                                    '11.2k',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              height: 44,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FluentIcons.share_android_20_filled,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 8,),
                                  Text(
                                    '11.2k',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,

                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    background: Colors.black,
                    text: 'Message',
                    function: (){

                    }
                )
              ],
            )
                ],
              ),
            ),
          ),
        ), listener: (context, state) {});
  }
}


