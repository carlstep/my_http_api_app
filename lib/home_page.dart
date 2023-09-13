import 'package:flutter/material.dart';
import 'package:my_http_api_app/currency_page.dart';
import 'package:my_http_api_app/currency_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key) {
    // loadCountry();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Country>> futureCountry;

  @override
  void initState() {
    super.initState();
    futureCountry = CountryDataService().getCountryDataService();
  }

  // final items = List.generate(50, (i) => i);

  // loadCountry() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies'),
      ),
      body: Center(
        child: FutureBuilder<List<Country>>(
          future: futureCountry,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  Country country = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        onTap: () => openPage(context, country),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('${country.flags!.png}'),
                        ),
                        title: Text('${country.name!.common}'),
                        subtitle: const Text('currency name...'),
                        trailing: const Icon(
                          Icons.check_box_outline_blank,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 4,
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else if (snapshot.hasError) {
              return Text('data failed to load');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

openPage(context, Country country) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CurrencyDetail(
        country: country,
      ),
    ),
  );
}
