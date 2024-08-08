import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'horoscope_page.dart';
import 'compatibility_page.dart';
import 'auspicious_page.dart';
import 'askquestion.dart';
import 'inboxpage.dart'; // Import the InboxPage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController(text: 'Ram Bahadur Singh');
  final TextEditingController dobController = TextEditingController(text: 'August 27, 1983');
  final TextEditingController pobController = TextEditingController(text: 'Kathmandu, Nepal');
  final TextEditingController tobController = TextEditingController(text: '14:15');

  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                      'My profile',
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
                          MaterialPageRoute(builder: (context) => InboxPage()), // Navigate to InboxPage
                        );
                      },
                      child: Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFF9933)),
                          borderRadius: BorderRadius.circular(screenWidth * 0.06), // Matching radius
                        ),
                        child: Icon(Icons.inbox, color: Color(0xFFFF9933)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.0),
              Center(
                child: Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4DFC8).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 6,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: CircleAvatar(
                              radius: screenWidth * 0.1,
                              backgroundImage: _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : AssetImage("assets/images/default_profile.png") as ImageProvider,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: 'Name',
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                _buildTextFieldWithIcon(dobController, Icons.calendar_today, 'Date of Birth', screenWidth, screenHeight),
                                SizedBox(height: screenHeight * 0.01),
                                _buildTextFieldWithIcon(pobController, Icons.place, 'Place of Birth', screenWidth, screenHeight),
                                SizedBox(height: screenHeight * 0.01),
                                _buildTextFieldWithIcon(tobController, Icons.access_time, 'Time of Birth', screenWidth, screenHeight),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4DFC8).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 6,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'WHO YOU ARE?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFC06500),
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Smart, sophisticated, and kind, Virgo gets the job done without complaining. Virgos are amazing friends, always there to lend a hand and also lend advice.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        width: screenWidth * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 215, 168, 114),
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          border: Border.all(color: Color(0xFFFF9933), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 6,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            LuckyInfoRow(title: 'Lucky Colour', value: '', color: Color(0xFF3564BE), screenWidth: screenWidth),
                            LuckyInfoRow(title: 'Lucky Number', value: '7', screenWidth: screenWidth),
                            LuckyInfoRow(title: 'Lucky Day', value: 'Tuesday', screenWidth: screenWidth),
                            LuckyInfoRow(
                              title: 'Gem',
                              value: '',
                              assetPath: "assets/images/gem.png",
                              screenWidth: screenWidth,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             SizedBox(height: screenHeight * 0.03),
Center(
  child: Container(
    width: screenWidth * 0.8,
    height: screenHeight * 0.07,
    decoration: BoxDecoration(
      color: Color(0xFFFF9933),
      borderRadius: BorderRadius.circular(0), // Match the button's corner radius
      boxShadow: [
        BoxShadow(
          color: Color(0x3F000000), // Shadow color
          blurRadius: 6, // Shadow blur radius
          offset: Offset(0, 4), // Shadow offset
        ),
      ],
    ),
    child: Center(
      child: TextButton(
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
      ),
    ),
  ),
),

              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
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

  Widget _buildTextFieldWithIcon(
      TextEditingController controller, IconData icon, String hintText, double screenWidth, double screenHeight) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFFFF9933)),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.04,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class LuckyInfoRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;
  final String? assetPath;
  final double screenWidth;

  LuckyInfoRow({
    required this.title,
    required this.value,
    this.color,
    this.assetPath,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.04,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
        Spacer(),
        assetPath != null
            ? Image.asset(
                assetPath!,
                width: screenWidth * 0.07,
                height: screenWidth * 0.07,
              )
            : color != null
                ? Container(
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: color,
                  )
                : Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
      ],
    );
  }
}
