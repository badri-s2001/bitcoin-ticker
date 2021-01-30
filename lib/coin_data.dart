import 'package:bitcoin_ticker/services/networking.dart';

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

const apiKey = "your_api_key";

class CoinData {
  Future<String> getCoinData(bitcoin, currency) async {
    NetworkHelper networkHelper = NetworkHelper(
        "https://rest.coinapi.io/v1/exchangerate/$bitcoin/$currency?apikey=$apiKey");
    var coinData = await networkHelper.getData();

    int pricee;
    String price;

    if (coinData == null) {
      price = "?";
    }

    pricee = coinData["rate"].toInt();
    price = pricee.toString();

    return price;
  }
}
