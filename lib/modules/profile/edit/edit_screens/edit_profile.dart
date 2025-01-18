
import 'package:farm_hub/shared/components/components.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var userNameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var businessNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: back(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),

              ),
              const SizedBox(height: 20,),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                        'asset/images/Handsome adult male posing.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(onPressed: (){}, icon: const Icon(
                        FluentIcons.camera_28_regular,
                        color: Colors.black,

                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              defaultForm(
                  label: 'Mr. Harrison',
                  type: TextInputType.name,
                  prefix: FontAwesomeIcons.userLarge,
                  suffix: Icons.edit,
                  controller: nameController,
                  validate: (value){
                    return null;
                  }
              ),
              const SizedBox(height: 10,),
              defaultForm(
                  label: '@harrisonmatovu',
                  type: TextInputType.text,
                  prefix: FontAwesomeIcons.userLarge,
                  suffix: Icons.edit,
                  controller: userNameController,
                  validate: (value){
                    return null;
                  }
              ),
              const SizedBox(height: 10,),
              defaultForm(
                  label: '(123) 456 7890',
                  type: TextInputType.phone,
                  prefix: FluentIcons.phone_48_filled,
                  suffix: Icons.edit,
                  controller: phoneController,
                  validate: (value){
                    return null;
                  }
              ),
              const SizedBox(height: 10,),
              defaultForm(
                  label: 'harrisonmatovu@gmail.com',
                  type: TextInputType.emailAddress,
                  prefix: FluentIcons.mail_all_read_28_filled,
                  suffix: Icons.edit,
                  controller: emailController,
                  validate: (value){
                    return null;
                  }
              ),
              const SizedBox(height: 10,),
              defaultForm(
                  label: 'Duo Farm Hub',
                  type: TextInputType.text,
                  prefix: Icons.business_rounded,
                  suffix: Icons.edit,
                  controller: businessNameController,
                  validate: (value){
                    return null;
                  }
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: defaultButton(background: defaultColor,
                    text: 'Save change',
                    function: (){}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
