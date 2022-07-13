 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:social_app_with_firebase/bloc/states.dart';

import '../../bloc/cubit.dart';
import '../../widgets/header_appbar.dart';

  class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: header(
              context,
              title: 'HomePage',
              color: Theme.of(context).primaryColor,
              centerTitle: true,
            ),
             body: null,
          );
        },
      ),

    );
  }
}
