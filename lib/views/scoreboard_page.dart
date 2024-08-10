import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:live_activities/live_activities.dart';
import 'package:live_activities/models/live_activity_image.dart';
import 'package:sunset_widget/models/team.dart';
import 'package:workmanager/workmanager.dart';
 
import '../models/team_response.dart';
import 'widgets/scoreboard_widget.dart';

// @pragma(
//     'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     String activityId = inputData!["activityId"];
//     final _liveActivitiesPlugin = LiveActivities();
//     get(Uri.parse("https://prod-public-api.livescore.com/v1/api/app/date/soccer/20230922/5.30?countryCode=IN&locale=en&MD=1")).then((response) async {
//       final teamResponse = TeamResponse.fromJson(jsonDecode(response.body)['Stages'][0]);
//       _liveActivitiesPlugin.updateActivity(activityId, teamResponse.toJson());
//     });
//     return Future.value(true);
//   });
// }


class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  TeamResponse? teamResponse;
  final _liveActivitiesPlugin = LiveActivities();
  late Timer timer;
  String? activityId;

  @override
  void initState()   {
    startData();
    
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade400,
      body: Center(
        child: teamResponse == null
            ? const CircularProgressIndicator()
            : ScoreboardWidget(teamResponse: teamResponse!),
      ),
    );
  }
  
  void startData() async {
    _liveActivitiesPlugin.init(appGroupId: 'group.sunset11.liveactivity'
    // ,
    //  urlScheme: "sus"
    );//group.sunset11.liveactivity
    //timer = Timer.periodic(const Duration(seconds: 10), (timer) {
     // get(Uri.parse("https://prod-public-api.livescore.com/v1/api/app/date/soccer/20230922/5.30?countryCode=IN&locale=en&MD=1")).then((response) async {
       
      //  print("Response Status: ${response.statusCode}");
      //  print("Response Is : ${response.body}");
teamResponse = TeamResponse(team1:Team(name: "USA", id: "123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqsfceTlDHXwovr6OijQY4riGiMSaq3JpUDA&s", abr: "abr", score: "12"), 
team2: Team(name: "AUS", id: "321", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqsfceTlDHXwovr6OijQY4riGiMSaq3JpUDA&s", abr: "abr2", score: "24"), heading: "Heading",
 subHeading: "subheading detail");
       // teamResponse = TeamResponse.fromJson(jsonDecode(response.body)['Stages'][0]);
       final img = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqsfceTlDHXwovr6OijQY4riGiMSaq3JpUDA&s";
       final lv = LiveActivityImageFromUrl(img,resizeFactor: 1);
       final Map<String, dynamic> activityModel = {
  'nameA': 'USA',
  'scoreA': '123',
  'imageA': lv,
   'nameB': 'USA',
  'scoreB': '123',
  'imageB': lv,
  "heading":"myheading",
  "subheading":"subheading"
};

_liveActivitiesPlugin.createActivity(activityModel);
        try {
          if(activityId == null) {
          print("ACTIVITY ID EMPTY ${teamResponse?.heading ?? "No heading found"}");
          //await
          activityId =  await  _liveActivitiesPlugin.createActivity(teamResponse!.toJson());
          print(activityId);
        } else {
              print("ACTIVITY ID ALREADY FOUND");
          _liveActivitiesPlugin.updateActivity(activityId!, teamResponse!.toJson());
        }
        } catch (e) {
          print("Exception $e");
        }
        
        setState(() {});
     // });
   // });
  }
}