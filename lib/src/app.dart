import 'package:flutter/material.dart';
import 'package:verdad_reto_app/src/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'mode': (_) => const ModeScreen(),
        'como-jugar': (_) => const ComoJugarScreen(),
      },
    );
  }
}
