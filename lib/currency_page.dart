import 'package:flutter/material.dart';

class CurrencyDetail extends StatelessWidget {
  const CurrencyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Currency Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => goBack(context),
          child: const Text('Press to go back'),
        ),
      ),
    );
  }
}

goBack(context) {
  Navigator.pop(context);
}
