abstract class LoginStates{}

class SocialInitialState extends LoginStates{}

class SocialChangeVisible extends LoginStates{}

class SocialLoginLoadingState extends LoginStates{}

class SocialLoginSuccessState extends LoginStates{
  final String?  uId;
  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorState extends LoginStates{}

class SocialRegisterCreationSuccessState extends LoginStates{}
class SocialRegisterCreationErrorState extends LoginStates{}


