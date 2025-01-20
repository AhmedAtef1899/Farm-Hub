
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:solar_icons/solar_icons.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listController = TextEditingController();
    var minController = TextEditingController();
    var maxController = TextEditingController();
    var descriptionController = TextEditingController();
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(
            CupertinoIcons.back
          )) ,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Listing',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20,),
                 Text(
                  'What are you selling...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16,),
                      Expanded(
                        child: TextField(
                          maxLines: null,
                          controller: listController,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700]
                          ),
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter text...',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700]
                            ),
                            suffixIcon: Icon(
                              Icons.edit_rounded,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  'Price:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[100],
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 16,),
                              Expanded(
                                child: TextField(
                                  maxLines: null,
                                  controller: minController,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700]
                                  ),
                                  keyboardType: TextInputType.text,
                                  decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'MIN UGX',
                                    labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[700]
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      width: 8,
                      height: 2,
                      color: Colors.grey[800],
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[100],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16,),
                            Expanded(
                              child: TextField(
                                maxLines: null,
                                controller: maxController,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700]
                                ),
                                keyboardType: TextInputType.text,
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'MAX UGX',
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[700]
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                 Text(
                  'Description:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[100]
                  ),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Write a message...',
                      fillColor: Colors.grey[100],
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey[700]
                      ),

                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      SolarIconsBold.galleryMinimalistic
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 67,
                      height: 26,
                      decoration: BoxDecoration(
                        color: HexColor('#F7F7F7'),
                        borderRadius: BorderRadius.circular(100)
                      ),child: const Text(
                      'Photo'
                    ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 67,
                      height: 26,
                      decoration: BoxDecoration(
                          color: HexColor('#F7F7F7'),
                          borderRadius: BorderRadius.circular(100)
                      ),child: const Text(
                        'Video'
                    ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 112,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: const Image(image: AssetImage('asset/images/Large green rice field with green rice plants in rows.png')),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 112,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: const Image(image: AssetImage('asset/images/Large green rice field with green rice plants in rows.png')),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 112,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          border: Border.all(style: BorderStyle.solid,color: Colors.grey[400]!)
                        ),
                        child: Icon(
                          CupertinoIcons.plus,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: defaultColor,
                  ),
                  child: MaterialButton(onPressed: (){},
                    child:
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'List Now',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        ),
                        SizedBox(width: 16,),
                        Icon(
                          FluentIcons.save_28_filled,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
