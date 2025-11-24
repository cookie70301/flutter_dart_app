import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:Color(0xFF00CACA),
          brightness: Brightness.light
        ),
      )
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HistoryInfo()
                  )
                );
              },
              child: Text(
                "History",style: TextStyle(fontSize: 25)
              ,)
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => About()
                    )
                  );
                },
                child: Text(
                  "About",style: TextStyle(fontSize: 25)
                  ,)
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(fontSize: 30)),
      ),
      body: HomeBody()
    );
  }
}
class HomeBody extends StatefulWidget{
  const HomeBody({super.key});
  @override
  State<HomeBody> createState() => _MyHomeBodyState();
}
class _MyHomeBodyState extends State<HomeBody>{
  double position = 0;
  bool isFlipped = false;
  bool isStart = false;

  @override
  void initState(){
    super.initState();
    Timer.periodic(
    Duration(milliseconds: 8),
    (timer){
      setState(() {
        if(isStart){
          if(isFlipped==false){
            position -= 1;
            if(position<=-800){
              isFlipped = true;
            }
          }
          else {
            position += 1;
            if(position>=-20){
              isFlipped = false;
            }
          }
        }
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          top: 0,
          left: position,
          height: 700,
          duration: Duration(microseconds: 200),
          child: Image.asset("assets/img/back.png")
        ),
        Positioned(
          top: 400,
          left: 100,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:isFlipped==true?AssetImage("assets/img/flippadoru.png"):AssetImage("assets/img/padoru.png"),
                fit: BoxFit.fill
              )
            ),
          )
        ),
        Positioned(
          top: 700,
          left: MediaQuery.of(context).size.width/2-85,
          child: IconButton(
            icon: Icon(Icons.card_giftcard),
            onPressed: (){
              setState(() {
                if(isStart==false){
                  isStart = true;
                }
              });
            },
          )
        ),
        Positioned(
            top: 700,
            left: MediaQuery.of(context).size.width/2+35,
            child: IconButton(
              icon: Icon(Icons.stop_circle),
              onPressed: (){
                setState(() {
                  if(isStart==true) {
                    isStart = false;
                  }
                });
              },
            )
        )
      ],
    );
  }
}


class HistoryInfo extends StatelessWidget {
  const HistoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History',style: TextStyle(fontSize: 30),)),
      body: const Center(
        child: Text('歷史紀類的1', style: TextStyle(
            fontSize: 24)),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  int daysUntilChristmas() {
    final today = DateTime.now();
    final currentYear = today.year;

    DateTime christmas = DateTime(currentYear, 12, 25);

    if (today.isAfter(christmas)) {
      christmas = DateTime(currentYear + 1, 12, 25);
    }

    return christmas.difference(today).inDays;
  }

  @override
  Widget build(BuildContext context) {
    final daysLeft = daysUntilChristmas();

    return Scaffold(
      appBar: AppBar(title: Text("聖誕節倒數 🎄")),
      body: Center(
        child: Text(
          "距離聖誕節還有 $daysLeft 天！✨",
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
