import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String? flag;
  String? time;
  String? urlGl;
  WorldTime({this.location,this.flag,this.urlGl});
  Future<void> getData () async {//Represents a Uniform Resource Identifier (URI) reference . URI is a predefined class in Flutter
    var url = ('https://worldtimeapi.org/api/timezone/$urlGl');//resolve (a sentence) into its component parts and describe their syntactic roles.
    //by parse we can convert the string into our data type int.parse(), double.parse() uri.parse().
    Response response = await get(Uri.parse(url));//converting string into uri and save it in Response object (variable), we can also use var so that it actually converted into Response
    Map data = jsonDecode(response.body);//here we are changing the json ( a file format ) to map ( a data type )
    DateTime dateTime = DateTime.parse(data["datetime"]);//datetime (an object ) = converting string into DateTime data type
    int offset = int.parse(data["utc_offset"].substring(1,3));//int offset = converting string into integer (string is +1:00 so eliminating the + by extracting the substring .substring(startIndex,endIndex-1))
    dateTime = dateTime.add(Duration(hours:offset/*,minutes:5*/));//add is a property where we can add date or time (if time seconds, minute, second ).
    //duration is a widget used to store duration values here minute is commented
    time = DateFormat.jm().format(dateTime);//jm method include AM PM whereas hm method 24 hours format
    //format() formats the var dateTime into DateFormat format.

  }
}