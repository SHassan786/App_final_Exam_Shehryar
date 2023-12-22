import 'package:flutter/material.dart';

class EarPodsUI extends StatelessWidget {
  const EarPodsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Assuming a dark theme background
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Recommended for\nyour devices",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white, // Add this line to set the text color to white
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () {
                // Define what you want to happen when the button is tapped
                print('See All pressed');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Text color
              ),
              child: const Text(
                "See All",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/airpods-max-silver.png"),
                          fit: BoxFit.contain,
                          height: 300,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Free Engraving",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 173, 41),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "AirPods Max — Silver",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "At 899.00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 247, 255, 2),
                                    Color.fromARGB(255, 255, 245, 171)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 0, 0),
                                    Color.fromARGB(255, 255, 134, 134)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 0, 0, 0),
                                    Color.fromARGB(255, 172, 171, 170)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 223, 223, 223),
                                    Color.fromARGB(255, 130, 130, 130)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "+1 more",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.bookmark_border,
                      color: Colors.blue,
                      size: 28, // Adjust the size to match your design
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
