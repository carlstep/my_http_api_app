// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

// Data Source API - https://restcountries.com/v3.1/all
// data source fields - https://restcountries.com/v3.1/all?fields=name,currencies,capital,borders,flags
// website - https://restcountries.com/

class Country {
  Flags? flags;
  Name? name;

  Country({
    this.flags,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flags: Flags.fromJson(json['flags']),
      name: Name.fromJson(json['name']),
    );
  }
}

class Flags {
  String? png;
  String? alt;

  Flags({
    this.png,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      png: json['png'],
      alt: json['alt'],
    );
  }
}

class Name {
  String? common;
  String? official;
  // NativeName? nativeName;

  Name({
    this.common,
    this.official,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'],
      official: json['official'],
    );
  }
}

class CountryDataService {
  Future<List<Country>> getCountryDataService() async {
    final response = await http.get(Uri.parse(
        'https://restcountries.com/v3.1/all?fields=name,currencies,capital,borders,flags'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<Country> countryList = [];

      for (var i = 0; i < data.length; i++) {
        final entry = data[i];
        countryList.add(Country.fromJson(entry));
      }
      return countryList;
    } else {
      throw Exception('error with data');
    }
  }
}
