import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'D28269E3-AD1A-4743-9206-133C6C30F947';

class CoinData {
  //CoinData({this.selectedCurrency});
  // final String url;
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      Response response = await get(requestURL);
      if (response.statusCode == 200) {
        var coinData = jsonDecode(response.body);
        double rate = coinData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        print('error');
      }
    }
    return cryptoPrices;
  }
}
