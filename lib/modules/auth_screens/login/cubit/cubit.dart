
import 'package:farm_hub/modules/auth_screens/login/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../shared/components/constants.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(SocialInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  IconData suffix = FluentIcons.eye_off_24_filled;
  void changePass()
  {
    isPassword = !isPassword;
    if(isPassword == true)
    {
      suffix = FluentIcons.eye_off_24_filled;
    }
    else
    {
      suffix = FluentIcons.eye_24_filled;
    }
    emit(SocialChangeVisible());
  }


}