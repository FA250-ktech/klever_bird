import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome',
            style: TextStyle(fontSize: 20),
          ),
          // Text(
          //   'To Kleverbird Sample Page',
          //   style: TextStyle(fontSize: 20),
          // )
        ],
      ),
    );
  }
}
