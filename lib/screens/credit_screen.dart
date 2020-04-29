import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:corona_virus/screens/loading_screen.dart';


class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  PackageInfo packageInfo;
  bool gotInfo = false;

  @override
  void initState() {
    super.initState();
    info();
  }

  void gitHub() async {
    const url = 'https://github.com/Viraj-Bhartiya/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false,);
    } else {
      throw 'Could not launch $url';
    }
  }

  void info() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      gotInfo=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(gotInfo==false){
      return LoadingScreen();
    }
    return  Container(
      padding: EdgeInsets.fromLTRB(30,50,30,30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/logo.png',height: 110,),
              SizedBox(height: 15,),
              Text(
                "Covid Stats",
                style: TextStyle(
                  color: Color(0xff057163),
                  fontWeight: FontWeight.w600,
                  fontSize: 24
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: gitHub,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/github.png',height: 25,),
                      SizedBox(width: 10,),
                      Text("Project on GitHub",style: TextStyle(fontSize: 20),),
                      SizedBox(width: 5,),
                      Icon(Icons.link)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Made with "),
                  Icon(Icons.favorite,color: Colors.red,size: 16,),
                  Text(" by "),
                  Text("Viraj Bhartiya",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}