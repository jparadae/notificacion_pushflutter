import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ??
        'No viene nada de data bb';
    return Scaffold(
      appBar: AppBar(
        title: Text('MessageScreen'),
      ),
      body: Center(
        child: Text('$args', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
