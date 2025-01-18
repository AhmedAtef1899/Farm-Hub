

import 'package:farm_hub/modules/auth_screens/register/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/components/constants.dart';

class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  IconData suffix = CupertinoIcons.eye;
  void changePass()
  {
    isPassword = !isPassword;
    if(isPassword == true)
      {
        suffix = CupertinoIcons.eye;
      }
    else
      {
        suffix = CupertinoIcons.eye_slash;
      }
    emit(SocialChangeVisible());
  }

  void getRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
})
  {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){
      print(value.user!.email.toString());
      print(value.user!.uid.toString());
      uId = value.user!.uid;
      // userCreation(
      //     name: name,
      //     email: email,
      //     phone: phone,
      //     password: password,
      //     uId: value.user!.uid
      // );
    }).catchError((onError){
      print(onError.toString());
      emit(SocialRegisterErrorState());
    });
  }

//   void userCreation({
//     required String name,
//     required String email,
//     required String phone,
//     required String password,
//     required String uId,
//
// })
//   {
//     // SocialUserModel model =
//     // SocialUserModel(
//     //   name: name,
//     //   email: email,
//     //   phone: phone,
//     //   password: password,
//     //   image: 'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/09/instagram-image-size.jpg',
//     //   uId: uId,
//     //   bio: "Write your bio",
//     //   isVerified: false
//     // );
//
//     FirebaseFirestore.instance.collection('users')
//         .doc(uId)
//         .set(model.toMap())
//         .then((value){
//           emit(SocialRegisterCreationSuccessState());
//     }).catchError((error){
//       print(error.toString());
//           emit(SocialRegisterCreationErrorState());
//     });
// }


}