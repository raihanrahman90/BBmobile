import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'address_page.dart'; // Import your AddressPage
import 'transaction_page.dart'; // Import your TransactionPage
import 'cart_page.dart'; // Import your CartPage
import 'login_page.dart'; // Import your LoginPage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      // Decode the JWT token
      final decodedToken = JwtDecoder.decode(token);

      // Extract the user's name from the JWT payload
      setState(() {
        userName = decodedToken['username'] ?? 'Guest';
      });
    }
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Remove the token
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display user name
            Text(
              'Hello, $userName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // List of menu options
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('Address'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddressPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Transaction'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TransactionPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Cart'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    _logout();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
