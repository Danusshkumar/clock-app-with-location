import 'package:flutter/material.dart';
import 'dart:convert';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;//This will assign var to argument inside the settings of ModalRoute class of this context (ModalRoute controls the routing)
    return Scaffold(
      
      body:Container(
        padding: const EdgeInsets.all(3),
        color:Colors.redAccent,
        child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height:120),
                      TextButton.icon(
                        onPressed:() async {
                          var result;
                          result = await Navigator.pushNamed(context,"choose_location");
                          setState(
                              (){
                                data = {
                                  'location':result["location"],
                                  'flag':result["flag"],
                                'time':result['time'],
                                };
                              }
                          );
                        },
                        icon:const Icon(
                          Icons.location_on_sharp,
                          color:Colors.black,
                        ),
                        label:const Text(
                            "Edit Location",
                          style:TextStyle(
                            color:Colors.black,
                            fontSize:10,
                          ),
                        ),
                      ),
                      const SizedBox(height:20),
                      Text(
                          data["location"],
                        style:const TextStyle(
                          fontSize:28,
                          letterSpacing: 2,
                          color:Colors.black,

                        ),
                      ),
                      const SizedBox(height:20),
                      Text(
                         data["time"],
                        style:const TextStyle(
                          fontSize:66,
                          color:Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
