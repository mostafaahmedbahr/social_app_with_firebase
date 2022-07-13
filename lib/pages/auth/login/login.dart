import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app_with_firebase/core/toast/toast.dart';
import 'package:social_app_with_firebase/core/utils/nav.dart';
import 'package:social_app_with_firebase/pages/auth/login/bloc/cubit.dart';
import 'package:social_app_with_firebase/pages/auth/login/bloc/states.dart';
 import 'package:social_app_with_firebase/pages/layout_page.dart';

import '../../../core/toast/toast_states.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState)
          {
            AppNav.customNavigator(
                context: context,
                screen: const LayoutPage(),
                finish: true,
            );
          }
          if(state is LoginErrorState)
          {
            ToastConfig.showToast(
                msg: "Some thing is Error",
                toastStates: ToastStates.Error,
            );
          }

        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Welcome To Our App"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConditionalBuilder(
                          fallback: (BuildContext context){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          condition: state is !LoginLoadingState,
                          builder: (BuildContext context){
                            return ElevatedButton(
                              onPressed: () {
                                cubit.signInWithGoogle();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Sign in with Google",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            );
                          },

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
