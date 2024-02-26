import 'package:flutter/material.dart';
import 'package:state_management_practise/Provider/Counter_provider.dart';
import 'package:state_management_practise/Provider/ProviderClass.dart';
import 'package:state_management_practise/Provider/TimeProvider.dart';
import 'StateManagementByStatefull/CounterPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> TimeProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProviderClass(),
      ),
    );
  }
}
