
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot/home.dart';
import 'package:iot/utils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
 bool enable=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset("assets/logo.png",height: 250,width: 250,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24,bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color:kWhite,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: kWhite,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextField(
                                    autofocus: false,
                                    cursorColor: kBlack,
                                    style:TextStyle(color: kBlack,fontWeight: FontWeight.bold),
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: mobileController,
                                    onSubmitted: null,
                                    onChanged: (val){
                                      setState(() {
                                        if(val.trim().length>=10&&val.trim().length<=13)
                                          enable=true;
                                        else
                                          enable=false;
                                      });
                                    },

                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your mobile number',
                                      hintStyle: TextStyle(color: kBlack,fontWeight: FontWeight.bold),
                                      contentPadding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                  ),
                  child: Container(
                    height: 56.0,
                    width: double.infinity,
                    child: RaisedButton(
                      disabledColor: kWhite.withOpacity(0.6),
                      color: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Enter".toUpperCase(),style:TextStyle(color:kBlack,fontSize: 20,fontWeight: FontWeight.bold,)
                          ),
                        ],
                      ),
                      onPressed:enable?next:null,
                    ),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }

  void next() {
     Navigator.push(context,MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }
}


