import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// Main App Widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App', // Browser tab title
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: Center(
          child: Container(
            width: 300,
            height: 150,
            color: Colors.blue[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                OrderItemDisplay(5, 'Footlong'),
                OrderItemDisplay(3, 'Mini'),
                OrderItemDisplay(7, 'Club'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom StatelessWidget to display sandwich orders
class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$quantity $itemType sandwich(es): ${'🥪' * quantity}',
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
