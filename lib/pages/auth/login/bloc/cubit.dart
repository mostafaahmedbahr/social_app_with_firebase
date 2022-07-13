
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app_with_firebase/pages/auth/login/bloc/states.dart';

import '../../../../core/utils/nav.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

 static LoginCubit get(context) => BlocProvider.of(context);



  void signInWithGoogle() async {
    emit(LoginLoadingState());
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
       await FirebaseAuth.instance.signInWithCredential(credential).then((value)
     {
       print(value.user!.email);
       emit(LoginSuccessState());
     }).catchError((error)
     {
       print("error in sign with google ${error.toString()}");
       emit(LoginErrorState());
     });
  }



}