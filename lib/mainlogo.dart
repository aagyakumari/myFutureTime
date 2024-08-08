import 'package:flutter/material.dart';
import 'package:flutter_application_1/Askquestion.dart';
import 'auspicious_page.dart';
import 'compatibility_page.dart';
import 'dashboard_page.dart';
import 'horoscope_page.dart';
import 'inboxpage.dart'; // Import the InboxPage

class MainLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DashboardPage()),
                            );
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Inter',
                              color: Color(0xFFFF9933),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'My FutureTime',
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Inter',
                                color: Color(0xFFFF9933),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InboxPage()),
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.12,
                            height: screenWidth * 0.12,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFFF9933)),
                              borderRadius: BorderRadius.circular(screenWidth * 0.06),
                            ),
                            child: Icon(
                              Icons.inbox,
                              color: Color(0xFFFF9933),
                              size: screenWidth * 0.08,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.6, // Maximum width for the logo
                      maxHeight: screenHeight * 0.3, // Maximum height for the logo
                    ),
                    child: AspectRatio(
                      aspectRatio: 1, // Aspect ratio to maintain
                      child: Image.asset(
                        'assets/images/flogo.png',
                        fit: BoxFit.contain, // Ensures the image scales properly
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Text(
                    'Thank You for Your Details!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontFamily: 'Inter',
                      color: Color(0xFFFF9933),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Text(
                    'Please hold on while our astrology gurus work on crafting your personalized birth-chart. '
                    'This process takes approximately 1-2 hours to ensure accuracy and proper depth.\n\n'
                    'A well-curated birth-chart can help us figure out almost everything for you!',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: screenWidth * 0.040,
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Text(
                    'We\'ll update you as soon as birth charts are ready.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontFamily: 'Inter',
                      color: Color(0xFFFF9933),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.12), // Space to ensure button does not overlap content
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.02),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AskQuestion()),
                  );
                },
                child: Text(
                  'Ask a Question',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFFF9933),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(),
                  fixedSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  shadowColor: Colors.black,
                  elevation: 10,
                ),
              ),
            ),
          ),
        ],
      ),
     bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFFF9933))),
        ),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025, horizontal: screenWidth * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompatibilityPage()),
                );
              },
              child: Image.asset(
                'assets/images/compatibility2.png',
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HoroscopePage()),
                );
              },
              child: Image.asset(
                'assets/images/horoscope2.png',
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                 // Change the color to orange
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuspiciousTimePage()),
                );
              },
              child: Image.asset(
                'assets/images/auspicious2.png',
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
