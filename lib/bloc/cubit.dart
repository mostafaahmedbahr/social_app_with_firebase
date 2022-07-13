
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
 import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:social_app_with_firebase/bloc/states.dart';
import 'package:social_app_with_firebase/pages/auth/create_user/create_user.dart';
import 'package:social_app_with_firebase/pages/auth/log_out/log_out.dart';

import '../pages/bottomnavpages/camera_page.dart';
 import '../pages/bottomnavpages/notifications_page.dart';
import '../pages/bottomnavpages/profile_page.dart';
 import '../pages/bottomnavpages/search_page.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavBarAppState());
  }
  void signOut()async
  {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();

  }
  List<Widget> pages()
  {
    return [
      LogOut(),
      const NotificationsPage(),
      const CameraPage(),
      const SearchPage(),
       const ProfilePage(),
    ];
  }


  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_active_outlined),
        title: ("Notifications"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.post_add),
        title: ("post"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search_circle),
        title: ("Search"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
  final bottomNavBarController = PersistentTabController();

  CollectionReference userRef1 = FirebaseFirestore.instance.collection("users");
  getUsers()async
  {
    emit(GetUsersLoadingState());
    await userRef1.get().then((value)
    {
      print("sucess in getuserdata");
       value.docs.forEach((element) {
         print("----------------------------");
         print(element.data());
         print("----------------------------");
       });
      emit(GetUsersSuccessState());
    }).catchError((error)
    {
      print("error in getuserdata in appcubit ${error.toString()}");
      emit(GetUsersErrorState());
    });
  }

  DocumentReference  userRef2 = FirebaseFirestore.instance.collection("users")
      .doc("zIcr6ELVcLm6eUuMcAWU");

  getUserById()async
  {
    emit(GetUsersLoadingState());
    await userRef2.get().then((value)
    {
      print("sucess in getuser by id");
        print("----------------------------");
        print(value.data());
        print("----------------------------");
      emit(GetUsersSuccessState());
    }).catchError((error)
    {
      print("error in getuser by id in appcubit ${error.toString()}");
      emit(GetUsersErrorState());
    });
  }

  CollectionReference userRef3 = FirebaseFirestore.instance.collection("users");
  getOneThingForUser()async
  {
    emit(GetUsersLoadingState());
    await userRef3.where("name",isEqualTo: "mostafa").get().then((value)
    {
      value.docs.forEach((element) {
        print("----------------------------");
        print(element.data());
        print("----------------------------");
      });
      emit(GetUsersSuccessState());
    }).catchError((error)
    {
      print("error in getOneThingForUser in appcubit ${error.toString()}");
      emit(GetUsersErrorState());
    });
  }

  CollectionReference userRef4 = FirebaseFirestore.instance.collection("users");
  getDataByOrder()async
  {
    emit(GetUsersLoadingState());
    await userRef4.orderBy("postsnum",descending: false).get().then((value)
    {
      value.docs.forEach((element) {
        print("----------------------------");
        print(element.data());
        print("----------------------------");
      });
      emit(GetUsersSuccessState());
    }).catchError((error)
    {
      print("error in getOneThingForUser in appcubit ${error.toString()}");
      emit(GetUsersErrorState());
    });
  }

  CollectionReference userRef5 = FirebaseFirestore.instance.collection("users");
  getDataWithLimit()async
  {
    emit(GetUsersLoadingState());
    await userRef5.limit(1).get().then((value)
    {
      value.docs.forEach((element) {
        print("----------------------------");
        print(element.data());
        print("----------------------------");
      });
      emit(GetUsersSuccessState());
    }).catchError((error)
    {
      print("error in getOneThingForUser in appcubit ${error.toString()}");
      emit(GetUsersErrorState());
    });
  }

  CollectionReference userRef6 = FirebaseFirestore.instance.collection("users");
  getTwoThingsOrMore()async
  {
    emit(GetUsersLoadingState());
    await userRef6.where("name",isEqualTo: "ali")
        .where("isAdmin",isEqualTo: false)
        .where("postsnum",isGreaterThan: 15).get().then((value)
    {
      value.docs.forEach((element) {
        print("----------------------------");
        print(element.data());
        print("----------------------------");
      });
      emit(GetUsersSuccessState());
    }).catchError((error)
    {
      print("error in getOneThingForUser in appcubit ${error.toString()}");
      emit(GetUsersErrorState());
    });
  }

  CollectionReference userRef7 = FirebaseFirestore.instance.collection("users");
  List usersList = [];
  getUsersDataToShowInUi()async
  {
    emit(GetUsersLoadingState());
    var responseBody  =  await userRef7.get();
    responseBody.docs.forEach((element) {
      usersList.add(element.data());
    });
    print(usersList);
  }

  CollectionReference userRef8 = FirebaseFirestore.instance.collection("users");
  addDataToFireBase()async
  {
     userRef8.add({
      "name":"bahr",
      "isAdmin":true,
      "postsnum":5,
    });
  }

  DocumentReference userRef9 = FirebaseFirestore.instance.collection("users").doc("2Gp568jVUGWXbbwwpRZn");
  updateDataToFireBase()async
  {
    userRef9.update({
      "name":"bahrbahr",

    });
  }


}