import 'package:farm_hub/modules/auth_screens/new_password/new_password.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/color.dart';

class SubmitCodeScreen extends StatelessWidget {
  const SubmitCodeScreen({super.key});

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
                  'Verification Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                 Text(
                  'Collect the code from your email address and enter it\nharrisonmatovu@zamil.com',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 100),
                 Center(
                  child: Text(
                    '01:05',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => _buildCodeField(context)),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'Don\'nt received code?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(onPressed: () {}, child:
                    Text(
                      'Send again',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                defaultButton(
                    background: defaultColor,
                    height: 58,
                    radius: 100,
                    text: 'Submit',
                    function: () {
                      navigateTo(context, const NewPasswordScreen());
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeField(BuildContext context) {
    return Container(
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          fillColor: Colors.white,
          label: const Text(
              ''
          ),
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 40,
          ),
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
