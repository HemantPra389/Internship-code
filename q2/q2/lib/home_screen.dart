import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 180, 
          child: Stack(children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 275,
                width: 180,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(235, 130, 132, 1),
                      Color.fromRGBO(246, 180, 155, 1)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                        topRight: Radius.circular(82))),
                child: Center(
                  child: SizedBox(
                    height: 225,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 36,
                        ),
                        const Text(
                          "Breakfast",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Bread,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "Peanut butter,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "Apple",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: "525 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 36),
                          ),
                          TextSpan(
                            text: "kcal",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ]))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: -5,
                child: Opacity(
                    opacity: .7,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 42,
                      child: Image.asset(
                        'assets/bread.png',
                        height: 42,
                      ),
                    )))
          ]),
        ),
      ),
    );
  }
}
