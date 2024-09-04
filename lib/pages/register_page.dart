import 'package:bbmobile/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:bbmobile/config/environment.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _apiService = ApiService();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final dio = Dio();
    final url = '${Environment.baseUrl}/users';

    try {
      final response = await _apiService.register(_usernameController.text, _passwordController.text);

      if (response != null && response.isSuccess) {
        // Registration successful
        print('Registration successful');
        // Navigate to another page or show a success message
      } else {
        setState(() {
          _errorMessage = 'Registration failed: ${response?.data}';
        });
      }
    } on DioException catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.response?.data ?? e.message}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
