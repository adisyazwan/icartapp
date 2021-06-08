import 'api_manager.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

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
  Map<String, String> toStringMap(Map<String, dynamic> map) =>
      map.map((key, value) => MapEntry(key, value.toString()));
  //callName: 'Get User Info';
  String apiDomain =
      'icartdb-ad2b1-default-rtdb.asia-southeast1.firebasedatabase.app';
  String apiEndpoint = 'users/$name.json';
  //callType:ApiCallType.GET;
  Map<String, dynamic> headers = {};
  Map<String, dynamic> params = {};
  bool returnResponse = true;

  final uri = Uri.https(apiDomain, apiEndpoint, toStringMap(params));
  final http.Response response =
      await http.get(uri, headers: toStringMap(headers));

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

Future<dynamic> updateUserCartCall({
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

Future<dynamic> getUserCartCall({
  String name = '',
}) async {
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
    totalPrice += items[i]['price'];
    totalWeight += items[i]['weight'];
  }

  updateUserCartCall(
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
