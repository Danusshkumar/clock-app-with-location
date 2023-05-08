import 'package:flutter/material.dart';
import 'package:dummy_app/packages/loading.dart';
import 'package:dummy_app/packages/home.dart';
import 'package:dummy_app/packages/choose_location.dart';
void main() =>{
  runApp(
      MaterialApp(
  debugShowCheckedModeBanner: false,
     home:const Loading(),
       routes:{
        'home':(context) => const Home(),//context is basically an object
        'loading':(context) => const Loading(),
         'choose_location': (context) => const ChooseLocation(),
  },
))
};