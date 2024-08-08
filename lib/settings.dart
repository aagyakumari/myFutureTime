import 'package:flutter/material.dart';
import 'support.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 32, 47),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFFCF9D66), Color(0x1E695034)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02), // Adjust as needed
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Color(0xFF1F1101),
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Adjust as needed
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/Group 10.png",
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.075,
                      fit: BoxFit.contain,
                    ),
                    title: Text(
                      'Customer Support',
                      style: TextStyle(
                        color: Color(0xFF1F1101),
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SupportPage()), // Replace SupportPage with your actual support page widget
                      );
                    },
                  ),
                ),
                Divider(color: Color(0xFF1F1101)),
                SizedBox(height: screenHeight * 0.02), // Adjust as needed
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/policies.png",
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.075,
                      fit: BoxFit.contain,
                    ),
                    title: Text(
                      'Terms & Privacy',
                      style: TextStyle(
                        color: Color(0xFF1F1101),
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      // Handle terms and privacy action
                    },
                  ),
                ),
                Divider(color: Color(0xFF1F1101)),
                SizedBox(height: screenHeight * 0.02), // Adjust as needed
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: ListTile(
                    title: Text(
                      'Appearance',
                      style: TextStyle(
                        color: Color(0xFF1F1101),
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      // Handle appearance action
                    },
                  ),
                ),
                Divider(color: Color(0xFF1F1101)),
                SizedBox(height: screenHeight * 0.02), // Adjust as needed
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.2,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: screenWidth * 0.02,
                                top: screenHeight * 0.01,
                                child: Container(
                                  width: screenWidth * 0.16,
                                  height: screenHeight * 0.02,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFCF9D66),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Light',
                                style: TextStyle(
                                  color: Color(0xFF110606),
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Image.asset(
                                "assets/images/Checkbox Circle.png",
                                width: screenWidth * 0.1,
                                height: screenHeight * 0.03,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.2,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF282727),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: screenWidth * 0.02,
                                top: screenHeight * 0.01,
                                child: Container(
                                  width: screenWidth * 0.16,
                                  height: screenHeight * 0.02,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF4DFC8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dark',
                                style: TextStyle(
                                  color: Color(0xFF110606),
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Image.asset(
                                "assets/images/Circle (1).png",
                                width: screenWidth * 0.1,
                                height: screenHeight * 0.03,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Adjust as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
