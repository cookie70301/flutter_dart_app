import 'package:flutter/material.dart';


/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00CACA),
          brightness: Brightness.dark
        ),
      ),
      themeMode: ThemeMode.system,
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
      body: Text('data')
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
