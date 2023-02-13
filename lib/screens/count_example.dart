import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    print("build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.incrementCount();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Count Eg screen"),
      ),
      body: Center(
        child: Consumer<CountProvider>( // builds only the text widget for change when listen property of countProvider obj is false
          builder: (BuildContext context, value, Widget? child) {
            print('building only reqd widget');
            return Text(
              value.getCount.toString(),
              style: TextStyle(fontSize: 60),
            );
          },
        ),
      ),
    );
  }
}
