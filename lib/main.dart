import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
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
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('History',style: TextStyle(fontSize: 30),)),
                        body: const Center(
                        child: Text('歷史紀錄之類的', style: TextStyle(
                        fontSize: 24)),
                        ),
                      );
                    },
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
                        builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(title: const Text('About',style: TextStyle(fontSize: 30),)),
                            body: const Center(
                              child: Text('詳情之類的', style: TextStyle(
                                  fontSize: 24)),
                            ),
                          );
                        },
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
      body: const Center(
          child: Text('大概是遊戲', style: TextStyle(fontSize: 24))),
    );
  }
}