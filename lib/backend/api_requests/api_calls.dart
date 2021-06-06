import 'api_manager.dart';

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
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Get User Info',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$name.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

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
  String username = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Update QR Code',
      apiDomain:
          'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app',
      apiEndpoint: 'users/$username.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> updateUserCartCall({
  String username = '',
  String name = 'updateName',
  double price = 66.6,
  double weight = 99.9,
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Update User Cart',
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
