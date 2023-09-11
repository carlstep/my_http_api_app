import 'package:flutter/material.dart';
import 'package:my_http_api_app/currency_page.dart';

class HomePage extends StatelessWidget {
  final items = List.generate(50, (i) => i);

  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: Card(
              child: ListTile(
                onTap: () => openPage(context),
                leading: const CircleAvatar(
                    child: Icon(
                  Icons.abc,
                  size: 40,
                )),
                title: Text('currency code... ${item + 1}'),
                subtitle: Text('currency name... ${item + 1}'),
                trailing: const Icon(
                  Icons.check_box_outline_blank,
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

openPage(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const CurrencyDetail(),
    ),
  );
}
