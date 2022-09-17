import 'package:bukit_vista_flutter_assessment/pages/main_menu/main_menu_page.dart';
import 'package:bukit_vista_flutter_assessment/repositories/guest_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GuestRepository>(
          create: (_) => GuestRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'Bukit Vista Assessment',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: MainMenuPage.route,
        routes: {
          MainMenuPage.route: (context) => const MainMenuPage(),
        },
      ),
    );
  }
}
