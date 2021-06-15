import 'api_manager.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

Future<dynamic> getAllItemsCall() async {
  // get all items in i-Cart
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';
  String apiEndpoint = 'productsAll.json';
  bool returnResponse = true;

  final uri = Uri.https(apiDomain, apiEndpoint);
  final response = await http.get(uri);

  return returnResponse ? json.decode(response.body) : null;
}

Future<dynamic> getProductsCall() => ApiManager.instance.makeApiCall(
      callName: 'Get Products',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'products.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> getUsersCall() => ApiManager.instance.makeApiCall(
      callName: 'Get Users',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> getUserInfoCall({
  String name = '',
}) async {
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';
  String apiEndpoint = 'users/$name.json';
  bool returnResponse = true;

  updateUserCartProductsCall(username: name);
  final uri = Uri.https(apiDomain, apiEndpoint);
  final http.Response response = await http.get(uri);

  if (response.statusCode == 200) {
    return returnResponse ? json.decode(response.body) : null;
  } else {
    throw Exception('Failed to load products');
  }
}

Future<dynamic> getProductInfoCall({
  int id,
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Get Product Info',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'products/$id.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> getUserCartInfoCall({
  String name = '',
  int itemnum,
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Get User Cart Info',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$name/cart_products/$itemnum.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> createUserTotalCall({
  String username = '',
  double totalPrice = 0.00,
  double totalWeight = 0.00,
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Create User Total',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$username/total.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'totalPrice': totalPrice,
        'totalWeight': totalWeight,
      },
      returnResponse: true,
    );

Future<dynamic> getUserTotalCall({
  String username = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Get User Total',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$username/total.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> createUserCartCall({
  String username = 'user0',
  String name = 'item0',
  double price = 0.0,
  double weight = 0.0,
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Create User Cart',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$username/cart_products/0.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'price': price,
        'weight': weight,
      },
      returnResponse: true,
    );

Future<dynamic> createUserCall({
  String nickname = '',
  String email = '',
  String photoUrl = '',
  int cartId = 0,
  String qrScanned = 'qrRegistered',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Create User',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$nickname.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'nickname': nickname,
        'email': email,
        'photo_url': photoUrl,
        'cart_id': cartId,
        'qr_scanned': qrScanned,
      },
      returnResponse: true,
    );

Future<dynamic> updateQRCodeCall({
  String qrCode = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Update QR Code',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/currentQR.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {'currentQR': qrCode},
      returnResponse: true,
    );

Future<dynamic> updateUserCartTotalCall({
  String username = '',
  double totalPrice = 0.0,
  double totalWeight = 0.0,
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Update User Cart',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$username/total.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'totalPrice': totalPrice,
        'totalWeight': totalWeight,
      },
      returnResponse: true,
    );

Future<dynamic> getUserCartCall(
    {String name = '', double price = 0.0, double weight = 0.0}) async {
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';
  String apiEndpoint = 'users/$name/cart_products.json';
  bool returnResponse = true;

  final uri = Uri.https(apiDomain, apiEndpoint);
  final http.Response response = await http.get(uri);

  double totalPrice = 0.0;
  double totalWeight = 0.0;

  final items = (json.decode(response.body) as List);
  print(items);
  print(items.length);
  for (var i = 0; i < items.length; i++) {
    // Sum all values
    totalPrice += items[i]['price'];
    totalWeight += items[i]['weight'];
  }

  updateUserCartTotalCall(
    // Update the sum to database
    username: name,
    totalPrice: totalPrice,
    totalWeight: totalWeight,
  );

  if (response.statusCode == 200) {
    return returnResponse ? json.decode(response.body) : null;
  } else {
    throw Exception('Failed to load products');
  }
}

Future<dynamic> updateUserCartProductsCall({
  String username = '',
}) async {
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';

  String apiEndpointCartItems = 'i-Cart.json';
  String apiEndpointAllItems = 'productsAll.json';
  final uriCartItems = Uri.https(apiDomain, apiEndpointCartItems);
  final uriAllItems = Uri.https(apiDomain, apiEndpointAllItems);
  final responseCartItems = await http.get(uriCartItems);
  final responseAllItems = await http.get(uriAllItems);

  final allItems = (json.decode(responseAllItems.body) as List);
  final cartItems = (json.decode(responseCartItems.body) as List);
  int iterationCall = 0;
  String outputEndpoint;

  for (int i = 1; i <= cartItems.length; i++) {
    // iterate for total of items in carts
    print('checking 1 item from usercart');
    for (int j = 0; j < allItems.length; j++) {
      // iterate for all products to find matching barcode
      if ((cartItems[i]['Barcode']).toString() ==
          (allItems[j]['barcode'].toString())) {
        outputEndpoint = 'users/$username/cart_products/$iterationCall.json';
        await http.put(Uri.https(apiDomain, outputEndpoint),
            body: json.encode({
              'name': allItems[j]['name'],
              'price': allItems[j]['price'],
              'weight': allItems[j]['weight']
            }));
        iterationCall = iterationCall + 1;
        print('added 1 item in usercart');
      } else {
        print('no barcode found');
      }
    }
  }
}
//}

Future<dynamic> getiCartProductsCall() async {
  // get all items in i-Cart
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';
  String apiEndpoint = 'i-Cart.json';
  bool returnResponse = true;

  final uri = Uri.https(apiDomain, apiEndpoint);
  final response = await http.get(uri);

  return returnResponse ? json.decode(response.body) : null;
}

Future<dynamic> checkWeightDiffCall({String username: ''}) async {
  /*
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';
  String apiEndpointProducts = 'products.json';
  String apiEndpointiCart = 'i-Cart.json';

  final uriProducts = Uri.https(apiDomain, apiEndpointProducts);
  final uriCartItems = Uri.https(apiDomain, apiEndpointiCart);

  final responseCartItems = await http.get(uriCartItems);
  final responseProducts = await http.get(uriProducts);

  final userTotal = (getUserTotalCall(username: username));
  final supposedPrice = (json.decode(responseProducts.body) as List);
  final useriCart = (json.decode(responseCartItems.body) as List);

  var supposedTotal = 0.0;
  double userTotalWeight = getJsonField(userTotal, r'$.totalWeight');

  for (var i = 0; i < useriCart.length; i++) {
    // Sum all values
    print('checking item weight');
    for (var j = 0; j < supposedPrice.length; j++) {
      if (useriCart[i]['Barcode'] == supposedPrice[j]['barcode']) {
        supposedTotal += supposedPrice[j]['price'];
        j = 0;
        print('added item weight');
      }
    }
  }
  print('Calculating weight difference');
  double weightDifference = 100 * userTotalWeight / supposedTotal;
*/
  return 0.33;
}

Future<dynamic> clearUserCartCall({
  String username = '',
  String name = '',
  double price = 0.0,
  double weight = 0.0,
}) async {
  Map<String, dynamic> params = {
    'name': 'cart cleared',
    'price': 0.0,
    'weight': 0.0,
    'Barcode': '000'
  };
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';

  String cartLengthApiEndpoint = 'i-Cart.json';
  final cartlengthUri = Uri.https(apiDomain, cartLengthApiEndpoint);
  final cartLengthResponse = await http.get(cartlengthUri);
  int cartlength = (json.decode(cartLengthResponse.body).length);

  for (int i = 0; i <= cartlength; i++) {
    String cartApiEndpoint = 'users/$username/cart_products/$i.json';
    String icartApiEndpoint = 'i-Cart/$i.json';
    final cartUri = Uri.https(apiDomain, cartApiEndpoint);
    final icartUri = Uri.https(apiDomain, icartApiEndpoint);
    if (i == 0) {
      await http.put(cartUri, body: json.encode(params));
      await http.put(icartUri, body: json.encode(params));
    } else {
      await http.delete(cartUri);
      await http.delete(icartUri);
    }
  }
}
