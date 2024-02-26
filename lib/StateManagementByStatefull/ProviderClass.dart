import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_practise/Provider/ThemeProvider.dart';
import 'package:state_management_practise/Provider/TimeProvider.dart';
import '../Provider/Counter_provider.dart';

class ProviderClass extends StatefulWidget {
  const ProviderClass({super.key});

  @override
  State<ProviderClass> createState() => _ProviderClassState();
}

class _ProviderClassState extends State<ProviderClass> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TimeProvider>(context, listen: false).setTime();
  }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    final themeChanged = Provider.of<ThemeProvider>(context);
    Provider.of<TimeProvider>(context, listen: false);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text('Provider Statemanagement ')),
      //   backgroundColor: Colors.blueAccent,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<TimeProvider>(builder: (context, value, chile) {
            return Text(
               '${value.timeNow.hour.toString()}:${value.timeNow.minute.toString()}:${value.timeNow.second.toString()}',
              style: const TextStyle(fontSize: 26),
            );
          })),
          Center(
            child: Consumer<CountProvider>(builder: (context, value, child) {
              return Text(
                value.counter.toString(),
                style: const TextStyle(fontSize: 26),
              );
            }),
          ),
          Center(
            child: RadioListTile<ThemeMode>(
              title: const Text("Light theme"),
                value: ThemeMode.light,
                groupValue: themeChanged.theme,
                onChanged: themeChanged.setTheme
            ),
          ),
          Center(
            child: RadioListTile<ThemeMode>(
              title: const Text('Dark Theme'),
                value: ThemeMode.dark,
                groupValue: themeChanged.theme,
                onChanged: themeChanged.setTheme
            ),
          ),
        ],
      ),
    );
  }
}
