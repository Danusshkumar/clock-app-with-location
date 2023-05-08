import 'package:flutter/material.dart';
import 'package:dummy_app/packages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{
  late String? currentTime = 'loading';
   Future<void> displayTime () async {
    var berlinTime= WorldTime(location:"Berlin",flag:"Germany",urlGl:"europe/berlin/");
    await berlinTime.getData();
    Navigator.pushReplacementNamed(context,"home",arguments:{
      'location':berlinTime.location,
      'flag':berlinTime.flag,
      'time':berlinTime.time,
    }
    );
  }//future is a promise which is not currently required for this. This can run without future.
  @override
  void initState() {
    super.initState();
    displayTime();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.grey,
      child: const Center(
        child:SpinKitRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
