import 'dart:async';
import 'package:logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as dev;
import 'audio/audio_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Flutter code sample for [AppBar].

void main() async {
  // The `flutter_soloud` package logs everything
  // (from severe warnings to fine debug messages)
  // using the standard `package:logging`.
  // You can listen to the logs as shown below.
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });

  WidgetsFlutterBinding.ensureInitialized();

  final audioController = AudioController();
  await audioController.initialize();

  runApp(AppBarApp(audioController: audioController));
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({required this.audioController, super.key});
  final AudioController audioController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(audioController: audioController),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:Color(0xFF00CACA),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor:Color(0xFF00CACA),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(0xFFCAFFFF)
        ),
        scaffoldBackgroundColor: Color(0xFF84C1FF),
        textTheme: TextTheme(
          titleLarge:GoogleFonts.amarante(
            fontSize: 30,
          ),
          displayMedium: GoogleFonts.notoSans(
            fontSize: 25,
          ),
          bodyMedium: GoogleFonts.notoSans(
            fontSize: 30,
          ),
        )
      )
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.audioController,super.key});
  final AudioController audioController;

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
                    builder: (BuildContext context) => WebViewApp()
                  )
                );
              },
              child: Text(
                "Padoru Wiki",style: TextTheme.of(context).displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary)
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
                  "解凍倒數",style: TextTheme.of(context).displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary)
                  ,)
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Padoru Padoru~~~',style: TextTheme.of(context).titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),),
      ),
      body: HomeBody(audioController: audioController)
    );
  }
}
class HomeBody extends StatefulWidget{
  const HomeBody({super.key, required this.audioController});
  final AudioController audioController;

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
              widget.audioController.startMusic();
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
                widget.audioController.fadeOutMusic();
              },
            )
        )
      ],
    );
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://padoru.wiki/zh'),
      );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Padoru Wiki',style: TextTheme.of(context).titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),),
      ),
      body: WebViewWidget(
        controller: controller,
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
      appBar: AppBar(title: Text("解凍倒數",style: TextTheme.of(context).titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),)),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Image.asset("assets/img/back.png")
          ),
          Positioned(
            top: 500,
            left: 50,
            height: 50,
            child: Text(
              "距離聖誕節還有 $daysLeft 天！",
              style: TextTheme.of(context).bodyMedium!.copyWith(color: Theme.of(context).colorScheme.error),
              ),
          ),
          Positioned(
              top: 300,
              left: 100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:daysLeft<10?AssetImage("assets/img/redeyes.png"):daysLeft<20?AssetImage("assets/img/padoru.png"):AssetImage("assets/img/freaze.png"),
                        fit: BoxFit.fill
                    )
                ),
              )
          ),
        ]
      )
    );
  }
}
