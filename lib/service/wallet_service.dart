import 'dart:collection';
import 'dart:convert';

import 'package:application/core/network/RequestAPI.dart';
import 'package:application/model/wallet.dart' as model;
import 'package:application/provider/wallet_provider.dart';
import 'package:application/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
class WalletService{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference _walletRef;
  
  WalletService(){
    _walletRef = db.collection(model.Wallet.TABLE_NAME);
  }
  Stream<QuerySnapshot> getStreamAuction(){
    return _walletRef.snapshots();
  }
  Stream<QuerySnapshot> getStreamAuctionById(String accountId, String chain){
    return _walletRef.where('accountId', isEqualTo: accountId).where('chain', isEqualTo: chain).snapshots();
  }
  Future<dynamic> createNewWallet(String mnemonic, String accountId, String chain) async{
    if(AuthService.user!=null)
    {
      HashMap<String, dynamic> data = HashMap();
      String? private = await WalletProvider().getPrivateKey(mnemonic);
      EthereumAddress public = await WalletProvider().getPublicKey(private);
      private = null;
      data['address'] = public.hex;
      data['accountId'] = AuthService.user!.uid;
      data['chain'] = chain;
      final jsonData = jsonEncode(data);
      final respone = await http.post(Uri.parse(API_URL+ '/api/wallet/create-wallet')
      ,headers: {'Content-Type': 'application/json'}, body: jsonData);
      if(respone.statusCode == 200){
        final jsonDataRes = jsonDecode(respone.body);
        return jsonDataRes;
      }
      else{
        throw Exception("Failed to create auction");
      }
    }
  }
}