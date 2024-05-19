import 'dart:collection';
import 'dart:convert';

import 'package:application/core/network/RequestAPI.dart';
import 'package:application/model/auction.dart';
import 'package:application/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AuctionService{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference _auctionRef;
  
  AuctionService(){
    _auctionRef = db.collection(Auction.TABLE_NAME);
  }
  Stream<QuerySnapshot> getStreamAuction(){
    return _auctionRef.snapshots();
  }
  Future<Auction?> getAuctionById(String auctionId)async {
    if(AuthService.user!=null)
    {
    try {
      var result = await _auctionRef.doc(auctionId).get();
      if (result.exists) {
        var data = result.data() as Map<String, dynamic>;
        data['id'] = result.id;
        Auction auction = Auction.fromJson(data);
        return auction;
      } else {
        return null; // Hoặc ném ngoại lệ nếu bạn muốn xử lý khi không tìm thấy dữ liệu
      }
    } catch (e) {
      print('Error getting auction by ID: $e');
      rethrow; // Ném lại ngoại lệ để có thể xử lý bên ngoài hàm nếu cần
    }
    }
  }
  Future<dynamic> addAuction(Auction auction) async{
    if(AuthService.user!=null){
      try{
        String jsonData = jsonEncode(auction.toJson());
        final respone = await http.post(Uri.parse(API_URL + '/api/auction/create')
        ,headers: {'Content-Type': 'application/json'}, body: jsonData);
        if(respone.statusCode == 200){
          final jsonDataRes = jsonDecode(respone.body);
          return jsonDataRes;
        }
        else{
          throw Exception("Failed to create auction");
        }
          }
      catch(e){
        throw Exception(e);
      }
    }
  }
  Future<dynamic> endAuction(String auctionId, String code)async{
    if(AuthService.user!=null){
    try{
      HashMap<String, dynamic> data = HashMap();
      data['auctionId'] = auctionId;
      data['codePassword'] = code;
      data['owner'] = AuthService.user!.uid;
      var jsonData = jsonEncode(data);
      final respone = await http.post(Uri.parse(API_URL + '/api/auction/end') 
      ,headers: {'Content-Type': 'application/json'}, body: jsonData);
      if(respone.statusCode == 200){
        var jsonDataRes = jsonDecode(respone.body);
        return jsonDataRes; 
      }
      else{
        throw Exception("Failed to cancel auction");
      }
      }
      catch(e)
      {
        throw Exception(e);
      }
    }
  }
  Future<dynamic> cancelAuction(String auctionId, String code)async{
    if(AuthService.user!=null){
    try{
      HashMap<String, dynamic> data = HashMap();
      data['auctionId'] = auctionId;
      data['codePassword'] = code;
      data['owner'] = AuthService.user!.uid;
      var jsonData = jsonEncode(data);
      final respone = await http.post(Uri.parse(API_URL + '/api/auction/cancel') 
      ,headers: {'Content-Type': 'application/json'}, body: jsonData);
      if(respone.statusCode == 200){
        var jsonDataRes = jsonDecode(respone.body);
        return jsonDataRes; 
      }
      else{
        throw Exception("Failed to cancel auction");
      }
      }
      catch(e)
      {
        throw Exception(e);
      }
    }
  }
  Future<dynamic> bidAuction(String auctionId, double newPrice) async{
    if(AuthService.user!=null){
        try{
        HashMap<String, dynamic> data = HashMap();
        data['buyer'] = AuthService.user!.uid;
        data['auctionId'] = auctionId;
        data['newPrice'] = newPrice;
        var jsonData = jsonEncode(data);
        final respone = await http.post(Uri.parse(API_URL + '/api/auction/bidAuction') 
        ,headers: {'Content-Type': 'application/json'}, body: jsonData);
          if(respone.statusCode == 200){
          var jsonDataRes = jsonDecode(respone.body);
          return jsonDataRes; 
        }
        else{
          throw Exception("Failed to cancel auction");
        }
      }
      catch(e)
      {
        throw Exception(e);
      }
    }
  }
}
