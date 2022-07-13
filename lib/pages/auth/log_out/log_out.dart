import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app_with_firebase/pages/auth/log_out/bloc/states.dart';

import '../../../models/user_model.dart';
import '../../../widgets/header_appbar.dart';
import '../create_user/create_user.dart';
import 'bloc/cunit.dart';
  class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  final DateTime timeStamp = DateTime.now();
  User? currentUser;
  CollectionReference userRef10 = FirebaseFirestore.instance.collection("users");
  createUserInFirebase(BuildContext con)async
  {
    // بجيب بيانات المستخدم
    final GoogleSignInAccount? user = GoogleSignIn().currentUser;
    // بعمل فحص اذا كان موجود او لا
    var document = await userRef10.doc(user?.id).get();
    // لو مش موجود بعمله create
    String userNameName="";
    if(!document.exists)
    {
      WidgetsBinding.instance?.addPostFrameCallback((bContext)async{
        userNameName = await Navigator.push(con,
            MaterialPageRoute(builder: (context)
            {
              return CreateUserPage();
            }));
      });


    }
    userRef10.doc(user?.id).set({
      "id":user?.id,
      " userName " : userNameName,
      "photoUrl" : user?.photoUrl,
      "displayName" : user?.displayName,
      "email" : user?.email,
      "bio" : "",
      "timeStamp" : timeStamp,
    });
    document = await userRef10.doc(user?.id).get();
        print("gggggggggggggggggggggggggg");
    print(user?.email);
    currentUser = User.fromDocument(document);
    print(currentUser?.email);
    print("zzzzzzzzzzzzzzzzzz");
  }


  @override
  void initState()
  {
    createUserInFirebase(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LogOutCubit(),
      child: BlocConsumer<LogOutCubit,LogOutState>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = LogOutCubit.get(context);
          return   Scaffold(
            appBar: header(
              context,
              title: "Log Out",
              color: Theme.of(context).primaryColor,
              centerTitle: true,
            ),
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                     cubit.signOut();
                  },
                  child: Text("logout"),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
