import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app_with_firebase/bloc/cubit.dart';
import 'package:social_app_with_firebase/pages/auth/create_user/bloc/cubit.dart';
import 'package:social_app_with_firebase/pages/auth/login/login.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:social_app_with_firebase/pages/layout_page.dart';
bool? isLogin;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if(user == null)
  {
    isLogin = false;
  }
  else
  {
    isLogin =true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>AppCubit() ,
        ),
        BlocProvider(
          create: (context)=>CreateUserCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Social App",
        theme: ThemeData(
          primaryColor: Colors.blue[400],
          // colorScheme : const ColorScheme.light() ,
        ),
        home:isLogin == true? const LayoutPage() : const LoginPage(),
      ),
    );
  }
}
