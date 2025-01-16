import 'package:flutter/material.dart';

class PaymentIntegrationScreen extends StatefulWidget {
  @override
  _PaymentIntegrationScreenState createState() =>
      _PaymentIntegrationScreenState();
}

class _PaymentIntegrationScreenState extends State<PaymentIntegrationScreen> {
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Payment Method')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a payment method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Credit/Debit Card Option
            RadioListTile(
              title: Text('Credit/Debit Card'),
              value: 'Card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            // UPI Option
            RadioListTile(
              title: Text('UPI'),
              value: 'UPI',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            // Wallet Option
            RadioListTile(
              title: Text('Wallet (Paytm, Google Pay)'),
              value: 'Wallet',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            // Cash on Delivery Option
            RadioListTile(
              title: Text('Cash on Delivery'),
              value: 'COD',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            SizedBox(height: 30),
            // Proceed Button
            ElevatedButton(
              onPressed: selectedPaymentMethod.isNotEmpty
                  ? () {
                // Perform action based on the selected payment method
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'You selected: $selectedPaymentMethod',
                    ),
                  ),
                );
              }
                  : null,
              child: Text('Proceed to Pay'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
