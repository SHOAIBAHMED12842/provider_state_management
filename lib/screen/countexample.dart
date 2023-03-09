
import 'dart:async';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider_screen.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     final countProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 1), (timer){
    countProvider.setcount();
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Provider")),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) { //consumer is used to rebuild that widget only
          return Text(countProvider.count.toString(),style: const TextStyle(fontSize: 20),);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setcount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
