import 'dart:collection';
import 'dart:convert';

import 'package:application/core/network/RequestAPI.dart';
import 'package:application/model/private_key.dart';
import 'package:application/provider/wallet_provider.dart';
import 'package:application/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class PrivateKeyService{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference _privateKeyRef;
  
  PrivateKeyService(){
    _privateKeyRef = db.collection(PrivateKey.TABLE_NAME);
  }
  Future<dynamic> addNewPrivateKey(String privateKey, String walletAddress) async{
    if(AuthService.user!=null)
    {
      try{
        HashMap<String, dynamic> data = HashMap();
        data['accountId'] = AuthService.user!.uid;
        data['privateKey'] = privateKey;
        data['walletAddress'] = walletAddress;
        var jsonData = jsonEncode(data);
        final respone = await http.post(Uri.parse(API_URL + '/api/private-key/  ')
        , headers: {'Content-Type': 'application/json'}, body: jsonData);
        if(respone.statusCode == 200)
        {
          final jsonDataRes = jsonDecode(respone.body);
          return jsonDataRes;  
        }
        else{
          throw Exception("Failed to add private key");
        }
      }
      catch(e){
        throw Exception(e);
      }
    }
  }
  static String generateMnemonic(BuildContext context){
    final walletProvider = Provider.of<WalletProvider>(context);
    final mnemonic = walletProvider.generateMnemonic();
    final mnemonicWords = mnemonic.split(' ');
    return mnemonic;
  }
}