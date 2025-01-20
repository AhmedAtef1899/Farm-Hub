

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:solar_icons/solar_icons.dart';

import '../styles/color.dart';

Widget defaultButton ({
  double width = double.infinity,
  double height = 60,
  required Color background,
  double radius = 100,
  required String text,
  required Function() function,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  child: MaterialButton(onPressed: function,
    child:
   Text(
    text,style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  ),
  ),
);

Widget defaultForm({
  required String label,
  IconData? prefix,
  required TextInputType type,
  required TextEditingController controller,
  required FormFieldValidator validate,
  Function()? onTap,
  bool isPassword = false,
  IconData? suffix,
  Function()? suffixPressed,
  Function(String value)? onSubmit,
  bool enable = true,
  Function(String value)? onChange,
  double height = 68,
  double radius = 12
}) => Container(
  alignment: Alignment.centerLeft,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: Colors.white,
  ),
  child: TextFormField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.grey[700],
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix),
      )
          : null,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onFieldSubmitted: onSubmit,
    obscureText: isPassword,
    keyboardType: type,
    controller: controller,
    validator: validate,
    onTap: onTap,
    enabled: enable,
    onChanged: onChange,
  ),
);

Widget line()=> Padding(
  padding: const EdgeInsets.all(20),
  child:   Container(
    height: 1,
    color: Colors.grey[600],
  ),
);

void navigateTo(context,widget) =>   Navigator.push(
context,
MaterialPageRoute(builder:
(context)=> widget)) ;

void navigateAndFinish(context,widget) =>   Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder:
        (context)=> widget),
    (route){
      return false;
    }
) ;

// void showToast({required String msg, ToastState? state}) =>  Fluttertoast.showToast(
//     msg: msg,
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 5,
//     backgroundColor: chooseToastColor(state!),
//     textColor: Colors.white,
//     fontSize: 16.0
// );
//
// //enum
//
// enum ToastState {SUCCESS,ERROR,WARNING}

// Color chooseToastColor(ToastState state){
//   Color color;
//   switch(state)
//   {
//     case ToastState.SUCCESS:
//       color = Colors.green;
//       break;
//     case ToastState.ERROR:
//       color =  Colors.red;
//       break;
//     case ToastState.WARNING:
//       color =  Colors.amber;
//       break;
//   }
//   return color;
// }

Widget listingItem()=> Builder(
  builder: (context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.1,
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
                        0.047, // Responsive font size
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.grey[400],
                          size: screenWidth *
                              0.04, // Responsive icon size
                        ),
                        Text(
                          'Anatole, France.',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: screenWidth *
                                0.035, // Responsive font size
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
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
            const SizedBox(width: 20,),
            InkWell(
              onTap: (){
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                    context: context, builder: (context)=>ownerMenu() );
              },
              child: SizedBox(
                width: 20,
                height: 20,
                child: Column(
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
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
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
          height: 15,
        ),
        Text(
          'Lorem ipsum dolor sit amet consectetur. Et ullamcorper sed nisi urna. Nibh nulla lobortis rhoncus dui habitasse id egestas amet.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(child:
            Container(
              height: 52,
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: const Text(
                'UGX 10',
                style: TextStyle(
                  color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              )
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
                  borderRadius: BorderRadius.circular(12)
              ),
              child: const Text(
                'UGX 10',
                style: TextStyle(
                    color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
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
        ),
        const SizedBox(height: 20,),
        line()
      ],
    );
  }
);

Widget listingMenu(String text,IconData icon) =>  Row(
  children: [
    Icon(
        icon
    ),
    const SizedBox(width: 10,),
    Text(
        text
    ),
  ],
);

Widget insightItem()=> Builder(
  builder: (context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return  Column(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.grey[400],
                          size: screenWidth *
                              0.04, // Responsive icon size
                        ),
                        Text(
                          'Anatole, France.',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: screenWidth *
                                0.035, // Responsive font size
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
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
        const SizedBox(height: 15,),
        const Text(
          'Mixed farming diversifies agriculture for resilience.',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          'Mixed farming involves cultivating different crops and raising various types of livestock on the same piece of land. This approach enhances the resilience of agricultural systems by spreading risks assoc ...see more',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 15,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    '11.2k',
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.eye_fill,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    '11.2k',
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                      context: context, builder: (context)=> const CommentModal()
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      FluentIcons.comment_20_filled,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      '11.2k',
                      style: TextStyle(
                          color: Colors.grey[600]
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    FluentIcons.share_android_16_filled,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    '11.2k',
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100)
          ),
          child:Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('asset/images/Ellipse 130.png'),
                radius: 17,
              ),
              const SizedBox(width: 10,),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    hintText: 'Express your opinion...',
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              TextButton(onPressed: (){},child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[100]
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
              ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
        line()
      ],
    );
  }
);

Widget back(context)=>IconButton(
    onPressed: (){
  Navigator.pop(context);
}, icon: const Icon(
  CupertinoIcons.back
));

class CommentModal extends StatelessWidget {
  const CommentModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 6,
              width: 48,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
          const SizedBox(height: 24,),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('asset/images/Ellipse 130.png'), // Replace with user image
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Express your opinion...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {}, // Add send functionality
              ),
            ],
          ),
          const Divider(height: 20, thickness: 1),

          // List of comments
          Expanded(
            child: ListView.builder(
              itemCount: 2, // Example count
              itemBuilder: (context, index) => const CommentItem(),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('asset/images/Ellipse 130.png'), // Replace with user image
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('@harrisonmathovu', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('2 days ago', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Et ullamcorper sed nisi urna. Nibh nulla lobortis rhoncus dui habitasse id egestas amet. Lorem ipsum dolor sit amet consectetur...',
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up_alt_outlined),
                onPressed: () {}, // Add like functionality
              ),
              const Text('100'),
              IconButton(
                icon: const Icon(Icons.thumb_down_alt_outlined),
                onPressed: () {}, // Add dislike functionality
              ),
              const SizedBox(width: 10),
              const Icon(Icons.comment_outlined),
              const SizedBox(width: 5),
              const Text('5 Replies', style: TextStyle(color: Colors.green)),
            ],
          ),
          const Divider(height: 20, thickness: 1),
        ],
      ),
    );
  }
}

Widget ownerMenu()=>FractionallySizedBox(
  heightFactor: 0.7,
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Center(
          child: Container(
            height: 6,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        listingMenu('On time line', FluentIcons.timeline_24_regular),
        const SizedBox(height: 12,),
        listingMenu('Edit listing', Icons.edit),
        const SizedBox(height: 12,),
        listingMenu('Mark a sold', FluentIcons.virtual_network_20_regular),
        const SizedBox(height: 12,),
        Row(
          children: [
            listingMenu('Mark as Booked', FluentIcons.communication_24_regular),
            const SizedBox(width: 8,),
            Icon(
              CupertinoIcons.checkmark_rectangle_fill,
              color: defaultColor,
            )
          ],
        ),
        const SizedBox(height: 12,),
        Row(
          children: [
            listingMenu('Listing Id', SolarIconsOutline.billList),
            const SizedBox(
              width: 8,
            ),
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              child: Row(
                children: [
                  const Text('BUY001'),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(const ClipboardData(text: 'BUY001'));
                      // showToast(msg: 'ID copied to clipboard');
                    },
                    child: Icon(
                      Icons.copy,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 12,),
        listingMenu('Share', FluentIcons.share_android_20_regular),
        const SizedBox(height: 12,),
        listingMenu('Promote', Icons.campaign_outlined),
      ],
    ),
  ),
);

Widget userMenu()=>FractionallySizedBox(
  heightFactor: 0.4,
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Center(
          child: Container(
            height: 6,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        listingMenu('Share listing', FluentIcons.share_android_20_regular),
        const SizedBox(height: 12,),
        listingMenu('Report listing', Icons.report_gmailerrorred),
        const SizedBox(height: 12,),
        Row(
          children: [
            listingMenu('Listing Id', SolarIconsOutline.billList),
            const SizedBox(
              width: 8,
            ),
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              child: Row(
                children: [
                  const Text('BUY001'),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(const ClipboardData(text: 'BUY001'));
                      // showToast(msg: 'ID copied to clipboard');
                    },
                    child: Icon(
                      Icons.copy,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  ),
);





