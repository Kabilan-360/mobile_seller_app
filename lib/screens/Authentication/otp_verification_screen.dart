import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phone;

  OTPVerificationScreen({required this.phone});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  bool isResendAvailable = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 30), () {
      setState(() {
        isResendAvailable = true;
      });
    });
  }

  void verifyOTP() {
    // Add your OTP verification logic here
    Navigator.pushNamed(context, '/home');
  }

  void resendOTP() {
    // Simulate resending OTP
    setState(() {
      isResendAvailable = false;
    });
    Future.delayed(Duration(seconds: 30), () {
      setState(() {
        isResendAvailable = true;
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP resent successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'OTP Verification',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Enter the OTP sent to',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.phone,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'OTP',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.teal.withOpacity(0.05),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: verifyOTP,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.teal,
                    ),
                    child: Text('Verify', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 16),
                  if (!isResendAvailable)
                    Text(
                      'Resend available in 30 seconds',
                      style: TextStyle(color: Colors.grey),
                    )
                  else
                    TextButton(
                      onPressed: resendOTP,
                      child: Text('Resend OTP', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
