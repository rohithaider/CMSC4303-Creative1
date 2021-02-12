import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation page'),
      ),
      body: Text('Thank you for your purchase with us!'),
    );
  }
}
