import 'package:flutter/material.dart';
import 'package:dummy_app/packages/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List locations = [
    WorldTime(urlGl:"Europe/London",location:"London",flag:"uk.png"),
    WorldTime(urlGl:"Europe/Berlin",location:"Athens",flag:"greece.png"),
    WorldTime(urlGl:"Africa/Cairo",location:"Cairo",flag:"egypt.png"),
    WorldTime(urlGl:"Africa/Nairobi",location:"Nairobi",flag:"kenya.png"),
    WorldTime(urlGl:"America/Chicago",location:"Chicago",flag:"usa.png"),
    WorldTime(urlGl:"America/New_York",location:"New York",flag:"usa.png"),
    WorldTime(urlGl:"Asia/Seoul",location:"Seoul",flag:"south_korea.png"),
    WorldTime(urlGl:"Asia/Jakarta",location:"Jakarta",flag:"indonesia.png"),
  ];
  void updateTime(index) async {
    var instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {'location':instance.location, 'flag':instance.flag, 'time':instance.time,});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Center(child: Text("Choose a Location")),
        backgroundColor: Colors.redAccent,
      ),
      body:ListView.builder(
        itemCount:locations.length,
        itemBuilder:(context,index){//second param is used defined
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:4,horizontal:8),
            child: Card(
              child:ListTile(
                onTap:(){
                  updateTime(index);
                },
                title:Text(locations[index].location),
                leading:CircleAvatar(
                  backgroundImage:AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
