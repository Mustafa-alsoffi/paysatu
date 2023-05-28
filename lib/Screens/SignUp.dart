import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'HomeScreen.dart';

class StartSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF0D47A1), // DarkBlue
      ),
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter your phone number'),
    MinLengthValidator(10,
        errorText: 'Phone number must be at least 10 digits long'),
    MaxLengthValidator(10,
        errorText: 'Phone number must not be more than 10 digits long'),
    PatternValidator(r'^[0-9]+$',
        errorText: 'Phone number must contain only digits')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your phone number to sign up',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: phoneValidator,
                decoration: InputDecoration(
                  prefixIcon: Icon(MaterialCommunityIcons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(_phoneController.text),
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPScreen extends StatefulWidget {
  final String phone;

  OTPScreen(this.phone);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  final otpValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter the OTP'),
    MinLengthValidator(6, errorText: 'OTP must be exactly 6 digits long'),
    MaxLengthValidator(6, errorText: 'OTP must be exactly 6 digits long'),
    PatternValidator(r'^[0-9]+$', errorText: 'OTP must contain only digits')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter the OTP sent to ${widget.phone}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                validator: otpValidator,
                decoration: InputDecoration(
                  prefixIcon: Icon(MaterialCommunityIcons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BankScreen(),
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BankScreen extends StatefulWidget {
  @override
  _BankScreenState createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  String? selectedBank;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Bank'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Choose a bank account',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.account_balance, color: Colors.blue),
                  title: Text('Bank account ${index + 1}'),
                  subtitle: Text('Balance \$${(index + 1) * 100}.00'),
                  trailing: selectedIndex == index
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.radio_button_off_outlined),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedBank = 'Bank account ${index + 1}';
                    });
                  },
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: selectedBank == null
                  ? null
                  : () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PinScreen(selectedBank!),
                        ),
                      ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class PinScreen extends StatefulWidget {
  final String bank;

  PinScreen(this.bank);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();

  final pinValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter your PIN'),
    MinLengthValidator(4, errorText: 'PIN must be exactly 4 digits long'),
    MaxLengthValidator(4, errorText: 'PIN must be exactly 4 digits long'),
    PatternValidator(r'^[0-9]+$', errorText: 'PIN must contain only digits')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter PIN'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your PIN for your ${widget.bank} account',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                validator: pinValidator,
                decoration: InputDecoration(
                  prefixIcon: Icon(MaterialCommunityIcons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Setup Complete'),
                        content: Text(
                            'You have successfully completed the setup process.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
