import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/exampleoneprovider.dart';

import '../provider/count_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  double value = 1.0;
  Widget build(BuildContext context) {
    //final provider = Provider.of<exampleoneprovider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("provider example")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Consumer<exampleoneprovider>(builder: (context, value, child) {
                  return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                value.setValue(val);
                //value = val;
                setState(() {
                  
                });
              });
           }),
          // Slider(
          //     min: 0,
          //     max: 1,
          //     value: provider.value,
          //     onChanged: (val) {
          //       provider.setValue(val);
          //       //value = val;
          //       setState(() {
                  
          //       });
          //     }),
          Consumer<exampleoneprovider>(builder: (context, value, child) {
            return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration:
                      BoxDecoration(color: Colors.green.withOpacity(value.value)),
                  child: const Center(
                    child: Text("container 1"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration:
                      BoxDecoration(color: Colors.red.withOpacity(value.value)),
                  child: const Center(
                    child: Text("container 2"),
                  ),
                ),
              )
            ],
          );
          })
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 100,
          //         decoration:
          //             BoxDecoration(color: Colors.green.withOpacity(provider.value)),
          //         child: const Center(
          //           child: Text("container 1"),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         height: 100,
          //         decoration:
          //             BoxDecoration(color: Colors.red.withOpacity(provider.value)),
          //         child: const Center(
          //           child: Text("container 2"),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
