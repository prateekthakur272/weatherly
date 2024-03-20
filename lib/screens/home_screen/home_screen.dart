import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/blocs/weather_bloc.dart';
import 'package:weatherly/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF673AB7)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              FutureBuilder(
                future: determinePosition(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ));
                  }
                  if (snapshot.hasData) {
                    context.read<WeatherBloc>().add(GetWeather(snapshot.data!));
                    return BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherStateFailed) {
                          return Center(
                              child: Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ));
                        }
                        if (state is WeatherStateLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is WeatherStateSuccess) {
                          final weather = state.weather;
                          log(weather.toString());
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '📍${weather.areaName??'Not determined'}, ${weather.country}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                                const Text(
                                  'Good Morning',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                getWeatherIcon(state.weather.weatherConditionCode!),
                                Text('${weather.temperature!.celsius!.round()}°C',
                                    style: const TextStyle(
                                      fontSize: 56,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Text(weather.weatherMain?.toUpperCase()??'UNKNOWN',
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(DateFormat('EEEE dd •').add_jm().format(weather.date??DateTime.now()),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    )),
                                space24,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/11.png',
                                          scale: 8,
                                        ),
                                        space4,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sunrise',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              DateFormat('').add_jm().format(weather.sunrise??DateTime.now()),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/12.png',
                                          scale: 8,
                                        ),
                                        space4,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sunset',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              DateFormat('').add_jm().format(weather.sunset??DateTime.now()),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                space4,
                                const Divider(),
                                space4,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/13.png',
                                          scale: 8,
                                        ),
                                        space4,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Temp Max',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              '${weather.tempMax?.celsius?.round()??0}°C',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/14.png',
                                          scale: 8,
                                        ),
                                        space4,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Temp Min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              '${weather.tempMin?.celsius?.round()??0}°C',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                        return const Center(
                            child: Text(
                          'Some error occured',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ));
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
