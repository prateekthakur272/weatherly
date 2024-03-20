import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
										shape: BoxShape.circle,
										color: Colors.deepPurple
									),
								),
							),
							Align(
								alignment: const AlignmentDirectional(-3, -0.3),
								child: Container(
									height: 300 ,
									width: 300, 
									decoration: const BoxDecoration(
										shape: BoxShape.circle,
										color: Color(0xFF673AB7)
									),
								),
							),
							Align(
								alignment: const AlignmentDirectional(0, -1.2),
								child: Container(
									height: 300,
									width: 600,
									decoration: const BoxDecoration(
										color: Color(0xFFFFAB40)
									),
								),
							),
							BackdropFilter(
								filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
								child: Container(
									decoration: const BoxDecoration(color: Colors.transparent),
								),
							),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('📍 Khandwa, India', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                    const Text('Good Morning', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    Image.asset('assets/1.png'),
                    const Text('32°C', style: TextStyle(fontSize: 56, fontWeight:FontWeight.w600,)),
                    const Text('Thunderstorm', style: TextStyle(fontSize: 32, fontWeight:FontWeight.w500,)),
                    const Text('Wednesday 20 • 03.37pm', style: TextStyle(fontSize: 16, fontWeight:FontWeight.w300,)),
                    space24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/11.png', scale: 8,),
                            space4,
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunrise', style: TextStyle(fontWeight: FontWeight.w300),),
                                Text('5.46am', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/12.png', scale: 8,),
                            space4,
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunset', style: TextStyle(fontWeight: FontWeight.w300),),
                                Text('7.31pm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/13.png', scale: 8,),
                            space4,
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Temp Max', style: TextStyle(fontWeight: FontWeight.w300),),
                                Text('38°C', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/14.png', scale: 8,),
                            space4,
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Temp Min', style: TextStyle(fontWeight: FontWeight.w300),),
                                Text('30°C', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
						],
					),
				),
			),
		);
  }
}