

import 'package:farm_hub/modules/layout/cubit/cubit.dart';
import 'package:farm_hub/modules/layout/cubit/state.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(builder: (context, state) =>
        Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('asset/images/Handsome adult male posing.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white
                          ),
                          child:  TextField(
                            controller: searchController,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none
                            ),
                            decoration:  InputDecoration(
                                border: InputBorder.none,
                              prefixIcon: const Icon(
                                CupertinoIcons.search,
                                color: Colors.grey,
                              ),
                              suffix: IconButton(onPressed: (){
                                searchController.clear();
                              },
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: Colors.grey,
                                  )
                              ),
                              labelText: 'Search your Keywords...',
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.grey
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: (){
                        showModalBottomSheet(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context, builder: (context)=>Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    height: 6,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[700]
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Center(
                                  child: Text(
                                    'Filter by',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: defaultColor
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select Date',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: defaultColor
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      'Last one hour',
                                      style: TextStyle(
                                        fontSize: 16
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      '24 hour',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      'Today',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      'This week',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      'This month',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      'This year',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                      }, icon: const Icon(
                          FontAwesomeIcons.sliders,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Search History',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white
                        ),
                        child: Row(
                          children: [
                            const Text('Milk'),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: const Icon(
                                Icons.close,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white
                        ),
                        child: Row(
                          children: [
                            const Text('Butter'),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: const Icon(
                                Icons.close,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ), listener: (context, state) {});
  }
}
