
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app_with_firebase/pages/auth/create_user/bloc/states.dart';
import 'package:social_app_with_firebase/pages/auth/create_user/create_user.dart';

class CreateUserCubit extends Cubit<CreateUserStates>
{
  CreateUserCubit( ) : super(CreateUserInitialState());

  static CreateUserCubit get(context) => BlocProvider.of(context);

  String? userName;
  var formKey = GlobalKey<FormState>();
  final DateTime timeStamp = DateTime.now();


  submitData(BuildContext conext)
  {
    formKey.currentState!.save();
    Navigator.pop(conext,userName);
  }

  CollectionReference userRef10 = FirebaseFirestore.instance.collection("users");
  createUserInFirebase(BuildContext con)async
  {
    // بجيب بيانات المستخدم
    final GoogleSignInAccount? user = GoogleSignIn().currentUser;
    // بعمل فحص اذا كان موجود او لا
    final document = await userRef10.doc(user?.id).get();
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
print("nullllllllllllllllllllllllll");
    print(user?.photoUrl);
  }



}