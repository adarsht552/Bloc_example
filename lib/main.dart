import 'package:bloctest/api/api_calls.dart';
import 'package:bloctest/bloc/EventsandStates/Bloc.dart';
import 'package:bloctest/bloc/EventsandStates/Event.dart';
import 'package:bloctest/bloc/counter.dart';
import 'package:bloctest/pages/api_data_page.dart';
import 'package:bloctest/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  final client = http.Client();
  final repository = PostRepository(client);
  runApp(
    MultiBlocProvider(
      providers: [
        // List of all your providers
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<Postbloc>(
          create: (context) => Postbloc(repository),
        ),
        // Add more Blocs here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ApiDataPage(),
      //  const Homepage(),
    );
  }
}
