
import 'package:farm_hub/modules/chat/conversation.dart';
import 'package:farm_hub/modules/layout/cubit/cubit.dart';
import 'package:farm_hub/modules/layout/cubit/state.dart';
import 'package:farm_hub/shared/components/components.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solar_icons/solar_icons.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(builder: (context, state) =>
        Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(onPressed: (){},
                    icon: const Icon(
                      FluentIcons.info_48_filled,
                      color: Colors.black,
                    )
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Chat List',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: defaultColor
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Hello, Harrison',
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){},
                      child:  CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 4,
                              width: 4,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                color: Colors.black
                              ),
                            ),
                            const SizedBox(height: 2,),
                            Container(
                              height: 4,
                              width: 4,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                color: Colors.black
                              ),
                            ),
                            const SizedBox(height: 2,),
                            Container(
                              height: 4,
                              width: 4,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                defaultForm(
                    height: 50,
                    radius: 100,
                    label: 'Search',
                    prefix: CupertinoIcons.search,
                    type: TextInputType.text,
                    controller: searchController,
                    validate: (value){
                      return null;
                    }
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>GestureDetector(
                        onTap: (){
                          navigateTo(context, const ConversationScreen());
                        },
                        child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CupertinoColors.white
                                            ),
                                            child:  Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            child: Image(image: AssetImage('asset/images/Group 20.png')),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Column(
                            children: [
                              Text(
                                'Nile Navigator',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '@nilenavigator',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 2,
                                    width: 2,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black
                                    ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Container(
                                    height: 2,
                                    width: 2,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black
                                    ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Container(
                                    height: 2,
                                    width: 2,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              const Text(
                                  'Apr 23, 2024'
                              )
                            ],
                          )
                        ],
                                            ),
                                          ),
                      ),
                      separatorBuilder: (context,index)=>const SizedBox(height: 8,),
                      itemCount: 10
                  ),
                )
              ],
            ),
          ),
        ), listener: (context, state) {});
  }
}
