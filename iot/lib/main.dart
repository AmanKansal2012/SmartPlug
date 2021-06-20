// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(MyApp());
//
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   final FirebaseFirestore _db=FirebaseFirestore.instance;
//
//   Future<void> _incrementCounter() async {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//
//     // await _db.collection("counter").doc().set({"S1":_counter}).catchError((e){
//     //   print(e);
//     // });
//     await _db.collection("counter").doc("023pz8uFQjRDVaivDTQk").update({"S1":_counter}).catchError((e){
//       print(e);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //_db.collection("counter").doc().snapshots().forEach((element) {print(element["S1"]);});
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body:  _getTasks(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   Widget _getTasks() {
//     return StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('counter')
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               padding: const EdgeInsets.all(10.0),
//               itemBuilder: (BuildContext context, int index) =>
//                   Text(snapshot.data.docs[index]['S1'].toString()),
//               itemCount: snapshot.data.docs.length,
//             );
//           } else {
//             return Container();
//           }
//         });
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/landing_page.dart';
import 'package:iot/utils.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:kBlack,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'connect.io',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         scaffoldBackgroundColor: kBlack,
        // primarySwatch: Colors.black,
      ),

      home: LandingPage(),
    );
  }
}
