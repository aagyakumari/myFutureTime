import 'package:flutter/material.dart';
import 'auspicious_page.dart';
import 'compatibility_page.dart';
import 'horoscope_page.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final List<Message> messages = [
    Message('Customer Support', 'We are here to help you!', Colors.blue),
    Message('Payment Details', 'Your payment was successful.', Colors.green),
    Message('From Astrologers', 'Your astrological reading is ready.', Colors.orange),
    Message('About Offers', 'Special discount just for you!', Colors.red),
    Message('Customer Support', 'How can we assist you?', Colors.blue),
    Message('Payment Details', 'Invoice for your last transaction.', Colors.green),
    Message('From Astrologers', 'New insights for you!', Colors.orange),
    Message('About Offers', 'Limited time offer!', Colors.red),
  ];

  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _openChatBox(Message message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatBoxPage(message: message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Message> filteredMessages = messages.where((message) {
      return message.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             message.content.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Navigate back to previous screen
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter',
                          color: Color(0xFFFF9933),
                        ),
                      ),
                    ),
                    Text(
                      'Inbox',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                        color:  Color(0xFFFF9933),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.12,
                      height: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4DFC8),
                        borderRadius: BorderRadius.circular(screenWidth * 0.06),
                      ),
                      child: Icon(
                        Icons.inbox,
                        color:  Color(0xFFFF9933),
                        size: screenWidth*0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Color(0xFFC06500)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredMessages.length,
              itemBuilder: (context, index) {
                final message = filteredMessages[index];
                return ListTile(
                  leading: Container(
                    width: screenWidth * 0.04,
                    height: screenWidth * 0.04,
                    decoration: BoxDecoration(
                      color: message.categoryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: Text(
                    message.title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  subtitle: Text(
                    message.content,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  onTap: () => _openChatBox(message),
                );
              },
            ),
            SizedBox(height: screenWidth * 0.05),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFFF9933))), // Top border color
        ),
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02, horizontal: screenWidth * 0.02),
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

class Message {
  final String title;
  final String content;
  final Color categoryColor;

  Message(this.title, this.content, this.categoryColor);
}

class ChatBoxPage extends StatelessWidget {
  final Message message;

  const ChatBoxPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          message.title,
          style: TextStyle(
            color: Color(0xFFFF9933),
            fontFamily: 'Inter',
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFFFF9933)),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          message.content,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
