import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('stateless to stateful'))),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toogle,
              builder: ((context, value, child) {
                return TextFormField(
                  obscureText: toogle.value,
                  //enabled: toogle.value,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffix: InkWell(
                      onTap: () {
                        toogle.value = !toogle.value;
                      },
                      child: Icon(toogle.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    ),
                  ),
                );
              })),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: ((context, value, child) {
                  return Text(
                    _counter.value.toString(),
                    style: const TextStyle(fontSize: 25),
                  );
                })),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
