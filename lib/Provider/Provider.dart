import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shipment/Model/Client/clientLoginModel.dart';
import 'package:shipment/Model/Client/clientRegisterModel.dart';
import 'package:shipment/Model/Client/getClientProfile.dart';
import 'package:shipment/Model/Client/updateClientProfile.dart';
import 'package:shipment/Model/Shipment/ShipmentgetProfileModel.dart';
import 'package:shipment/Model/Shipment/shipmentLoginModal.dart';
import 'package:shipment/Model/Shipment/shipmentRegisterModel.dart';

class Providers {
  var authToken, shipmentauthToken;
  String baseUrl = 'http://13.233.199.47/api/';

  Future<ClientRegisterModel> registrationClient(signupData) async {
    final client = new http.Client();
    final response = await client.post(
      Uri.parse(baseUrl + 'registerClient'),
      body: signupData,
    );
    print(response.body);
    return ClientRegisterModel.fromJson(json.decode(response.body));
  }

  Future<ClientLoginModel> loginClient(loginData) async {
    print("Login $loginData");
    final client = new http.Client();
    final response = await client.post(
      Uri.parse(baseUrl + 'login'),
      body: loginData,
    );
    print(response.body);

    return ClientLoginModel.fromJson(json.decode(response.body));
  }

  Future<ShipmentRegisterModel> registrationShipment(shipmentData) async {
    final client = new http.Client();
    final response = await client.post(
      Uri.parse(baseUrl + 'registerShipment'),
      body: shipmentData,
    );
    print(response.body);
    return ShipmentRegisterModel.fromJson(json.decode(response.body));
  }

  Future<ShipmentLoginModal> loginShipment(loginData) async {
    print("Login $loginData");
    final client = new http.Client();
    final response = await client.post(
      Uri.parse(baseUrl + 'loginShipment'),
      body: loginData,
    );
    print(response.body);

    return ShipmentLoginModal.fromJson(json.decode(response.body));
  }

  Future<GetClientProfile> getClientProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('auth_token');
    print("Token $authToken");
    final String url = 'http://13.233.199.47/api/clientProfile';
    final client = new http.Client();
    final response = await client.get(
      Uri.parse('http://13.233.199.47/api/clientProfile'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "token": authToken
      },
    );

    print(response.body);
    return GetClientProfile.fromJson(json.decode(response.body));
  }

  Future<UpdateClientProfile> updateClient(udpateData) async {
    print("Login $udpateData");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('auth_token');
    print("Token $authToken");
    final client = new http.Client();
    final response = await client.post(
      Uri.parse(baseUrl + 'updateClientProfile'),
      headers: {
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
        "token":
            "d9cc787996868059f5e53af96ad627f9e8d26fc4f4deaa5aec0e4b43250c4c4e"
      },
      body: udpateData,
    );
    print(response.body);

    return UpdateClientProfile.fromJson(json.decode(response.body));
  }

  Future<ShipmentgetProfileModel> getshipmentProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    shipmentauthToken = prefs.getString('Shipemnt_auth_token');
    print("Token $shipmentauthToken");
    final String url = 'http://13.233.199.47/api/shipmentProfile';
    final client = new http.Client();
    final response = await client.get(
      Uri.parse('http://13.233.199.47/api/shipmentProfile'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "token": shipmentauthToken
      },
    );

    print(response.body);
    return ShipmentgetProfileModel.fromJson(json.decode(response.body));
  }
}
