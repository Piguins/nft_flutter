import 'dart:convert';

import 'package:application/core/network/RequestAPI.dart';
import 'package:http/http.dart' as http;
class NFTService{
  Future<dynamic> getNFTInMarketplacce() async{
    try{
      var respone = await http.get(Uri.parse(API_URL+"/api/nft/get-balance")
      , headers: {'Content-Type': 'application/json'});
      if(respone.statusCode == 200){
          final jsonDataRes = jsonDecode(respone.body);
          return jsonDataRes; 
      }
      else{
        throw Exception("Get item in marketplace failed");
      }
    }
    catch(e){
      throw Exception(e);
    }
  }
  Future<dynamic> postTestHello() async{
    try{
      Map<String, dynamic> data = Map();
      data["name"] = "world";
      data["age"] = 15;
      var jsonData = jsonEncode(data);
      await http.post(Uri.parse(API_URL+'/api/nft/hello'), headers: {'Content-Type': 'application/json'},body: jsonData);
      return "success";
    }
    catch(e){
      throw Exception(e);
    }
  }
}