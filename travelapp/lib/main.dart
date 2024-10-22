import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp/tt.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> cities = [
    {"image": "assets/m.jpg", "quote": "Explore the magic of Madrid"},
    {"image": "assets/c.jpg", "quote": "Discover the charm of Cairo"},
    {"image": "assets/pp.jpg", "quote": "Paris The city of lights and love"},
    {"image": "assets/v.jpg", "quote": "Venice Where time stands still"},
    {"image": "assets/jpg.webp", "quote": "Journey through the beauty of Japan"},
    {"image": "assets/tt.jpg", "quote": "Touch the history of Turkey"},
    {"image": "assets/uu.jpg", "quote": "Unveil the secrets of Ulaanbaatar"},
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return buildPage(cities[index]["image"]!, cities[index]["quote"]!);
            },
          ),
          Positioned(
            top: 20, // Positioning the Skip button at the top
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  onPressed: () {
                    // Skip to the next page
                    if (_pageController.page!.toInt() < cities.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(height: 10),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: cities.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: const Color.fromARGB(255, 247, 247, 248),
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigate to the new screen when tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Secon(),
                                ),
                              );
                            },
                            child: Container(
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Let's Get Started",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              // Handle login tap
                            },
                            child: Text(
                              "Already have an account? Login",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(String imagePath, String text) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 20, // Adjust this value to move the text further to the left
          top: 100, // Adjust this to control how high the text starts
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6, // Limit text width
            child: Text(
              text,
              style: TextStyle(
                fontSize: 40, // Increased font size
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(186, 0, 0, 0),
                    blurRadius: 5,
                  )
                ],
              ),
              textAlign: TextAlign.left, // Align text to the left
            ),
          ),
        ),
      ],
    );
  }
}
