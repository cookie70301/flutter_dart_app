import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AppBarExample());
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

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
                        appBar: AppBar(title: const Text('Next page',style: TextStyle(fontSize: 30),)),
                        body: const Center(
                        child: Text('這是分頁', style: TextStyle(
                        fontSize: 24)),
                        ),
                      );
                    },
                  )
                );
              },
              child: Text("test",style: TextStyle(fontSize: 25),))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      body: const Center(
          child: Text('This is the home page', style: TextStyle(fontSize: 24))),
    );
  }
}