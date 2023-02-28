import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tap_game/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return Scaffold(
          body: Column(children: [
            InkWell(
              onTap: () {
                homeProvider.onRedGamerTap();
                if (homeProvider.isRedGamerWin) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text("Red Gamer Wins"),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                  children: [Image.asset("assets/winner.gif")]),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  homeProvider.restartGame();
                                  Navigator.pop(context);
                                },
                                child: Text("Restart"),
                              )
                            ]);
                      });
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height *
                    homeProvider.redGamerHeight,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://banner2.cleanpng.com/20180324/rlq/kisspng-street-fighter-v-cartoon-clip-art-soldiers-5ab5f9512e2b50.8970136315218752811891.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                homeProvider.onBlueGamerTap();
                if (homeProvider.isBlueGamerWin) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text("Blue Gamer Wins"),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                  children: [Image.asset("assets/winner.gif")]),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  homeProvider.restartGame();
                                  Navigator.pop(context);
                                },
                                child: Text("Restart"),
                              )
                            ]);
                      });
                }
              },
              child: Container(
                  height: MediaQuery.of(context).size.height *
                      homeProvider.blueGamerHeight,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/premium-vector/muay-thai-fighter-with-fight-pose-cartoon-vector-illustration-isolated-premium-vector_476839-2.jpg?w=740"),
                          fit: BoxFit.cover))),
            )
          ]),
        );
      },
    );
  }
}
