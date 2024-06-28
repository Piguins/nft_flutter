import 'dart:convert';

import 'package:application/core/network/RequestAPI.dart';
import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/model/marketplace.dart';
import 'package:application/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MarketplaceService{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference _marketplaceRef;
    MarketplaceService(){
    _marketplaceRef = db.collection(Marketplace.TABLE_NAME);
  }
  Future<dynamic> MakeAnItemInMarketplace(Marketplace marketplace) async{
    if(AuthService.user!=null)
    {
      SharedPreferences preference = await SharedPreferences.getInstance();
      Map<String, dynamic> data = marketplace.toJson();
      data["accountId"] = AuthService.user!.uid;
      data["walletAddress"] = preference.getString("walletAddress");
      data["chain"] = preference.getString("chain");
      var jsonData = jsonEncode(data);
      var respone = await http.post(Uri.parse(API_URL+"/api/marketplace/make-item")
      , headers: {'Content-Type': 'application/json'}, body: jsonData);
      if(respone.statusCode == 200){
          final jsonDataRes = jsonDecode(respone.body);
          return jsonDataRes; 
      }
      else{
        final jsonDataRes = jsonDecode(respone.body);
        if(jsonDataRes["error"] == "not have enough coin")
        {
          throw Exception("Not have enough coin");
        }
        else{
          throw Exception("Make item in marketplace failed");
        }
      }
    }
    else{
          throw Exception("Not login yet");
    }
  }
  Future<dynamic> PurchaseItem(Marketplace marketplace) async{
    if(AuthService.user!=null)
    {
      SharedPreferences preference = await SharedPreferences.getInstance();
      Map<String, dynamic> data = marketplace.toJson();
      data["accountId"] = AuthService.user!.uid;
      print("walletAddres: ${preference.getString(PreferenceVariable.WALLET_ADDRESS)}");
      data["walletAddress"] = preference.getString(PreferenceVariable.WALLET_ADDRESS);
      data["chain"] = preference.getString("chain");
      var jsonData = jsonEncode(data);
      var respone = await http.post(Uri.parse(API_URL+"/api/marketplace/purchase-item")
      , headers: {'Content-Type': 'application/json'}, body: jsonData);
      if(respone.statusCode == 200){
          final jsonDataRes = jsonDecode(respone.body);
          return jsonDataRes; 
      }
      else{
        throw Exception("Purchase item in marketplace failed");
      }
    }
    else{
          throw Exception("Not login yet");
    }
  }
}