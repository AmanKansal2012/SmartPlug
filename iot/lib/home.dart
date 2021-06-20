
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  void updateData(int data) {
    databaseRef.update({'S1': data});
  }

  void printFirebase(){
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
  TextEditingController mobileController = TextEditingController();
  bool on=false;
  Timer timer;
  String onTime;
  String offTime;
  String currentTime;

  @override
  void initState() {
    super.initState();
   // timer = Timer.periodic(Duration(seconds: 1), (Timer t) => schedule());
  }

  @override
  void dispose() {
    //timer?.cancel();
    super.dispose();
  }
  //schedule(){
  //   print("running");
  //    onTime =
  //       "6" + ':' + "0" + ':00';
  //    offTime =
  //       "22" + ':' + "59" + ':00';
  //    currentTime="${TimeOfDay.now().hour.toString()}" + ':' + "${TimeOfDay.now().minute.toString()}" + ':00';
  //   setState(() {
  //     if(currentTime==onTime)
  //     {
  //       on=true;
  //       updateData(1);
  //       print("onn");
  //     }
  //     else if(currentTime==offTime){
  //       on=false;
  //       print("offf");
  //       updateData(0);
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // print(DateTime.now().add(Duration(hours: 0)));
    // print(currentTime==onTime);
    //schedule();
    return SafeArea(
      child: Scaffold(
        backgroundColor: on?Color(0xffF1B31C):kBlack,
        appBar: AppBar(backgroundColor: kWhite,automaticallyImplyLeading: false,leading: Icon(Icons.arrow_back_rounded,color: kBlack,size: 32,),
        centerTitle: true,
          title: Text(!on?"Device plugged out":"Device plugged in",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: kBlack),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:24.0),
              child: Image.asset("assets/mini.png",height: 30,width: 30,),
            ),
          ],
        ),
          body:FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Stack(
                      children: [
                        GestureDetector(
                            onTap: (){
                              setState(() {
                                on=!on;
                              });
                              updateData(on?1:0);
                            },
                            child: Image.asset(on?"assets/on.png":"assets/off.png",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,)),
                      ],
                    ),
                  );
                }
              }
          ),
      ),
    );
  }

  void next() {
    Navigator.push(context,MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }
}


