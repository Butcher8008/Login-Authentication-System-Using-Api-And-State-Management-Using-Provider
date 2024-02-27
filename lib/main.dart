import 'package:flutter/material.dart';
import 'package:state_management_practise/Provider/Counter_provider.dart';
import 'package:state_management_practise/Provider/LoginProvider.dart';
import 'package:state_management_practise/StateManagementByStatefull/LoginScreen.dart';
import 'package:state_management_practise/StateManagementByStatefull/ProviderClass.dart';
import 'package:state_management_practise/Provider/ThemeProvider.dart';
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
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_)=> ThemeProvider()),
        ChangeNotifierProvider(create: (_)=> AuthProvider())
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanged= Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanged.themeChange,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: Colors.greenAccent
            )
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              color: Colors.white70
            ),
            primaryColorDark: Colors.grey
          ),
          home: const LoginScreen(),
        );
      })
    );
  }
}
