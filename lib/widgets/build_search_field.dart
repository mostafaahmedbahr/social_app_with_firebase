import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CollectionReference userRef9 = FirebaseFirestore.instance.collection("users");
handleSearch(value)
{
  var users = userRef9.where("displayName",isGreaterThanOrEqualTo: value).get();
}
AppBar buildSearchField()
{
  return AppBar(
    backgroundColor: Colors.white,
    title: TextFormField(
      onFieldSubmitted: (value)
      {
        handleSearch(value);
      },
      decoration: InputDecoration(
        filled: true,
        border:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: "Search For User",
        prefixIcon:const Icon(Icons.account_box,
          color: Colors.black,),
        suffixIcon: IconButton(
          onPressed: (){},
          icon:const Icon(Icons.clear,
          color: Colors.black,),
        ),
      ),
    ),
  );
}