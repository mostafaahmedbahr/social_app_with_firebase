
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container buildNoContent(BuildContext context)
{
  final Orientation orientation = MediaQuery.of(context).orientation;
  return Container(
    child: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          SvgPicture.asset("assets/images/search.svg",
          height: orientation == Orientation.portrait? 300 : 200,
          ),
          const Text("Find Users",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 50,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    ),
  );
}