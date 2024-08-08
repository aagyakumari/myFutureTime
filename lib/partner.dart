import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Askquestion.dart'; // Import the AskQuestion page

class PartnerDetailsPage extends StatefulWidget {
  @override
  _PartnerDetailsPageState createState() => _PartnerDetailsPageState();
}

class _PartnerDetailsPageState extends State<PartnerDetailsPage> {
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _birthTimeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _questionController = TextEditingController(); // Added for the question

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text = DateFormat.yMMMd().format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _birthTimeController.text = picked.format(context);
      });
    }
  }

  void _navigateToAskQuestion(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AskQuestion()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SizedBox to push content down from the top
                  SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                  // Title Text
                  Text(
                    'Enter your partner\'s details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300, // Light weight
                      color: Color(0xFFFF9933),
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 10),
                  // Detail Sections
                  _buildDetailSection('Name', 'Enter their name', TextInputType.text, null, _nameController),
                  _buildDetailSection('From', 'Enter their location', TextInputType.text, null, _locationController),
                  _buildDetailSection('Born on', 'Enter their birth date', TextInputType.datetime, _selectDate, _birthDateController),
                  _buildDetailSection('At', 'Enter their birth time', TextInputType.datetime, _selectTime, _birthTimeController),
                  SizedBox(height: 10),
                  // Question Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: _questionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                          ),
                          hintText: 'Enter your question',
                          hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Inter'),
                        ),
                        style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // "IDEAS WHAT TO ASK" Section
                  GestureDetector(
                    onTap: () => _navigateToAskQuestion(context),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      color: Color(0xFFFF9933),
                      child: Text(
                        'IDEAS WHAT TO ASK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String label, String hintText, TextInputType keyboardType, Function? onTap, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              child: Text(
                label,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400, // Regular weight
                  color: Color(0xFFFF9933),
                  fontFamily: 'Inter',
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 50,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Inter'),
                  ),
                  keyboardType: keyboardType,
                  style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
                  readOnly: onTap != null,
                  onTap: onTap != null ? () => onTap(context) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
