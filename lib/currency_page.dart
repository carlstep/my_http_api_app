import 'package:flutter/material.dart';
import 'package:my_http_api_app/currency_service.dart';

class CurrencyDetail extends StatelessWidget {
  final Country country;

  const CurrencyDetail({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Currency Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 200,
              child: Image.network(
                country.flags!.png.toString(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              '${country.name!.common}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text('Official Name : ${country.name!.official}'),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 4, 30, 4),
              child: Text('${country.flags!.alt}'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => goBack(context),
              child: const Text('Press to go back'),
            ),
          ],
        ),
      ),
    );
  }
}

goBack(context) {
  Navigator.pop(context);
}
