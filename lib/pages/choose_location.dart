import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url: 'Africa/Abidjan',location: 'Abidjan',flag: 'africa.png'),
    WorldTime(url: 'Africa/Accra',location: 'Accra',flag: 'africa.png'),
    WorldTime(url: 'America/Adak',location: 'Adak',flag: 'america.png'),
    WorldTime(url: 'America/Chicago',location: 'Chicago',flag: 'america.png'),
    WorldTime(url: 'America/Guyana',location: 'Guyana',flag: 'america.png'),
    WorldTime(url: 'America/Los_Angeles',location: 'Los_Angeles',flag: 'america.png'),
    WorldTime(url: 'America/Mexico_City',location: 'Mexico_City',flag: 'america.png'),
    WorldTime(url: 'America/New_York',location: 'New_York',flag: 'america.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'egypt.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'egypt.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'egypt.png'),
  ];

  void updateTime(index) async{
    WorldTime instance= locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      )
    );
  }
}
