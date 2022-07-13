 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app_with_firebase/pages/auth/log_out/bloc/states.dart';

class LogOutCubit extends Cubit<LogOutState>
{
  LogOutCubit( ) : super(InitialLogOutState());

  static LogOutCubit get(context) => BlocProvider.of(context);


  void signOut()async
  {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
   }

}