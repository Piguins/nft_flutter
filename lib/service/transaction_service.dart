import 'dart:convert';

import 'package:application/core/network/RequestAPI.dart';
import 'package:application/model/transaction.dart';
import 'package:application/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
class TransactionService{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference _transactionRef;
  
  TransactionService(){
    _transactionRef = db.collection(TransactionHistory.TABLE_NAME);
  }
  Stream<QuerySnapshot> getStreamAuction(){
    return _transactionRef.snapshots();
  }
  Stream<QuerySnapshot> getStreamAuctionById(String auctionId){
    return _transactionRef.where('auctionId', isEqualTo: auctionId).snapshots();
  }
    Future<dynamic> addAuction(TransactionHistory transaction) async{
    if(AuthService.user!=null){
      try{
        String jsonData = jsonEncode(transaction.toJson());
        final respone = await http.post(Uri.parse(API_URL + '/api/transaction-history/add')
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
}