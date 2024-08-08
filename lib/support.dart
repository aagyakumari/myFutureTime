import 'package:flutter/material.dart';

import 'auspicious_page.dart';
import 'compatibility_page.dart';
import 'horoscope_page.dart';
import 'inboxpage.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    // Handle Submit button press
    String feedback = _feedbackController.text;

    // Navigate to SupportSubmit page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SupportSubmit(feedback: feedback)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Navigate back to previous screen
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
                          Text(
                            'Support',
                            style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Inter',
                              color: Color(0xFFFF9933),
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
                                borderRadius: BorderRadius.circular(screenWidth * 0.06), // Matching radius
                              ),
                              child: Icon(Icons.inbox, color: Color(0xFFFF9933),size: screenWidth*0.06,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.05), // Adjust size relative to screen height
                Center(
                  child: Image.asset(
                    'assets/images/support.png',
                    width: screenWidth * 0.9, // Adjust width relative to screen width
                    height: screenHeight * 0.3, // Adjust height relative to screen height
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Adjust size relative to screen height
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: TextField(
                    controller: _feedbackController,
                    maxLines: null, // Allows for multiline input
                    decoration: InputDecoration(
                      hintText: 'Enter your feedback or issues here...',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.15), // Adjust size relative to screen height
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              color: Colors.white,
              child: Center(
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFFF9933),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    fixedSize: Size(screenWidth * 0.8, 56), // Adjust width relative to screen width
                    shadowColor: Colors.black,
                    elevation: 10,
                  ),
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
                  MaterialPageRoute(builder: (context) => HoroscopePage()),
                );
              },
              child: Image.asset(
                'assets/images/horoscope2.png',
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
              ),
            ),
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


class SupportSubmit extends StatelessWidget {
  final String feedback;

  const SupportSubmit({Key? key, required this.feedback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 315,
              height: 241,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    top: 174,
                    child: SizedBox(
                      width: 253,
                      height: 42,
                      child: Text(
                        'Your feedback has been submitted for review!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFC06500),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 67,
                    top: 6,
                    child: Container(
                      width: 180,
                      height: 153,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/submit.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 283,
                    top: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Navigate back to previous screen (SupportPage)
                      },
                      child: Container(
                        width: 22,
                        height: 32,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Next.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
