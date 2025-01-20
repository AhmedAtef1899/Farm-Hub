
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/color.dart';

class NewPasswordScreen extends StatefulWidget {

   const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                 Text(
                  'Set a new password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                 Text(
                  'Set up a strong password for your security. Use a minimum of 8 letters, numbers, alphabets, symbols to make your password strong',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 40),
                defaultForm(
                  label: 'Enter new Password',
                  prefix: FluentIcons.password_16_regular,
                  type: TextInputType.visiblePassword,
                  controller:newPasswordController ,
                  isPassword: true,
                  validate: (value) {
                    if (value.isEmpty)
                    {
                      return 'Empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                defaultForm(
                  label: 'Confirm Password',
                  prefix: FluentIcons.password_16_regular,
                  type: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  isPassword: true,
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
                defaultButton(
                    background: defaultColor,
                    height: 58,
                    radius: 100,
                    text: 'Reset Password',
                    function: () {
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
