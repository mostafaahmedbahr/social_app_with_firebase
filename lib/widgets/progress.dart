import 'package:flutter/material.dart';

Center circularPro()
{
  return  Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blue[400]),
    ),
  );
}

LinearProgressIndicator linearPro()
{
  return LinearProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Colors.blue[400]),
  );
}