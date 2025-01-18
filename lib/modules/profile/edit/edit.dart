
import 'package:farm_hub/modules/profile/edit/edit_screens/edit_profile.dart';
import 'package:farm_hub/modules/profile/edit/edit_screens/interest.dart';
import 'package:farm_hub/modules/profile/edit/edit_screens/location.dart';
import 'package:farm_hub/modules/profile/edit/edit_screens/password.dart';
import 'package:farm_hub/modules/profile/edit/edit_screens/setting.dart';
import 'package:farm_hub/shared/components/components.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/color.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(
          CupertinoIcons.back
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
              height: 30,),
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
            GestureDetector(
              onTap: (){
                navigateTo(context, const EditProfileScreen());
              },
                child: _editItem('Edit Profile', CupertinoIcons.person_crop_circle)),
            const SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                navigateTo(context, const PasswordScreen());
              },
                child: _editItem('Password', FluentIcons.password_16_regular)),
            const SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                navigateTo(context, const LocationScreen());
              },
                child: _editItem('Location', FluentIcons.location_16_regular)),
            const SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                navigateTo(context, const InterestScreen());
              },
                child: _editItem('Interest', Icons.interests_outlined)),
            const SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                navigateTo(context, const SettingScreen());
              },
                child: _editItem('Setting', FluentIcons.settings_16_regular)),
          ],
        ),
      ),
    );
  }
}

Widget _editItem(String text, IconData icon) => Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: CupertinoColors.white,
  ),
  child: Row(
    children: [
      Icon(icon),
      const SizedBox(
        width: 16,
      ),
      Text(text,style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),)
    ],
  ),
);
