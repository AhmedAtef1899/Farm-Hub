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
                const Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Collect the code from your email address and enter it\nharrisonmatovu@zamil.com',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                const SizedBox(height: 100),
                const Center(
                  child: Text(
                    '01:05',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => _buildCodeField(context)),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'nt received code?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    TextButton(onPressed: () {
                    }, child:
                    Text(
                      'Send again',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: defaultColor,
                      ),
                    )
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                defaultButton(
                    background: defaultColor,
                    height: 58,
                    radius: 100,
                    text: 'Submit',
                    function: () {
                      navigateTo(context, NewPasswordScreen());
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
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          fillColor: Colors.white,
          label: Text(
              ''
          ),
          labelStyle: TextStyle(
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
