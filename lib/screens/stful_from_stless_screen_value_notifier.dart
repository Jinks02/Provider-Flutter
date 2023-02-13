import 'package:flutter/material.dart';

class StfulFromStless extends StatelessWidget {
  StfulFromStless({Key? key}) : super(key: key);

  ValueNotifier<int> _counter =
      ValueNotifier<int>(0); // giving initial value as 0

  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  // cant dispose them as no init and dispose in stless widgets

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful from Stateless'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: value,
                  decoration: InputDecoration(
                    hintText: 'password',
                    suffix: InkWell(
                      onTap: () {
                        _toggle.value = !_toggle.value;
                      },
                      child:
                          Icon(_toggle.value ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                );
              }),
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                value.toString(),
                style: TextStyle(fontSize: 50),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          debugPrint(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
