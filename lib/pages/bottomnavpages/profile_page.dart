import 'package:flutter/material.dart';
import 'package:social_app_with_firebase/widgets/progress.dart';

import '../../widgets/header_appbar.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        context,
        title: 'ProfilePage',
        color: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: circularPro(),
    );
  }
}
