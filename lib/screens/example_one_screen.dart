import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/provider/example_one_provider_multi_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {

  @override
  Widget build(BuildContext context) {
    // final egOneProvider = Provider.of<ExampleOneProvider>(context,listen: false); // when listen is true,then whole widget tree rebuilds
    print("entire tree called");
    return Scaffold(
      appBar: AppBar(
        title: Text('Eg 1 Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Slider(min: 0, max: 1, value: value.getValue, onChanged: (newValue) {
                print('only consumer of slider called');
                value.changeSliderValue(newValue);
              });
            },

          ),
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            print('only consumer of row called');
            return Row( // adding consumer widget wherever the state changes
              // ie. here the slider and row widgets change their states
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:
                    BoxDecoration(color: Colors.green.withOpacity(value.getValue)),
                    child: Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:
                    BoxDecoration(color: Colors.red.withOpacity(value.getValue)),
                    child: Center(
                      child: Text('Container 2'),
                    ),
                  ),
                )
              ],
            );
          })

        ],
      ),
    );
  }
}
