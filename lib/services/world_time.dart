import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;//Location in Name
  String time; //Time at the location
  String flag;//URL to an asset of flag
  String url; //Location URl
  bool isDayTime; //Is it Day or Night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async
  {
    try{
        //Making Request
        Response  response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data= jsonDecode(response.body);

        //Getting properties from the response
        String dateTime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);

        //Creating DateTime object
        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(hours: int.parse(offset)));

        isDayTime = now.hour>=6 && now.hour<20? true:false;
        //Setting time
        time = DateFormat.jm().format(now);
    }
    catch(e){
      time= e.toString();
    }
  }
}