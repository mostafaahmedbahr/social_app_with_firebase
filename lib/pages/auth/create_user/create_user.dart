import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app_with_firebase/pages/auth/create_user/bloc/cubit.dart';
import 'package:social_app_with_firebase/pages/auth/create_user/bloc/states.dart';
import 'package:social_app_with_firebase/widgets/header_appbar.dart';
class CreateUserPage extends StatefulWidget {
    CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {

  String? userName;
  var formKey = GlobalKey<FormState>();
  final DateTime timeStamp = DateTime.now();


  submitData(BuildContext conext)
  {
    formKey.currentState?.save();
    Navigator.pop(conext,userName);
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit,CreateUserStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = CreateUserCubit.get(context);
        return Scaffold(
          appBar: header(
              context,
              title: "Create User",
              centerTitle: true,
              color: Theme.of(context).primaryColor,
          ),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text("Create User Name",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Form(
                      key:cubit.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "UserName",
                              hintText: "must be at least 3 char",
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (val)
                            {
                              cubit.userName = val;
                            },
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                              onPressed: (){
                                cubit.submitData(context);
                              },
                                child: const Text("Submit",
                                style: TextStyle(
                                  fontFamily: "Signatra",
                                  fontSize: 35,
                                ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}
