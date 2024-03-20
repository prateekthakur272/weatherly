import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/blocs/weather_bloc.dart';
import 'package:weatherly/constants/themes.dart';
import 'package:weatherly/screens/home_screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        theme: appTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
