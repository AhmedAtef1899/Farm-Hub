
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

  void getLogin({
  required String email,
    required String password,
})
  {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password
    ).then((value) {
      print(value.user!.email);
      uId = value.user!.uid;
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((onError){
      print(onError.toString());
      emit(SocialLoginErrorState());
    });
  }

  Future<void> googleLogin(context) async {
    emit(SocialLoginLoadingState());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      // userCreation(
      //     name: FirebaseAuth.instance.currentUser!.displayName.toString(),
      //     email: FirebaseAuth.instance.currentUser!.email.toString(),
      //     phone: FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
      //     uId: FirebaseAuth.instance.currentUser!.uid
      // );
      // navigateAndFinish(context, const SocialLayout());
      print("User signed in with Google: ${FirebaseAuth.instance.currentUser?.displayName}");
      emit(SocialLoginSuccessState(FirebaseAuth.instance.currentUser?.uid));
    } catch (e) {
      emit(SocialLoginErrorState());
      print("Error signing in with Google: $e");
    }
  }

  // void userCreation({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String uId,
  // })
  // {
  //   // SocialUserModel model =
  //   // SocialUserModel(
  //   //     name: name,
  //   //     email: email,
  //   //     phone: phone,
  //   //     image: 'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/09/instagram-image-size.jpg',
  //   //     uId: uId,
  //   //     bio: "Write your bio",
  //   //     isVerified: false
  //   // );
  //   FirebaseFirestore.instance.collection('users')
  //       .doc(uId)
  //       .set(model.toMap())
  //       .then((value){
  //     emit(SocialRegisterCreationSuccessState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(SocialRegisterCreationErrorState());
  //   });
  // }


}