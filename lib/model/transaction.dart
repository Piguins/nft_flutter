import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionHistory {
  String? auctionId;
  String? lastBuyer;
  double? lastPrice;
  String? newBuyer;
  double? newPrice;
  Timestamp? transactionOn;
  static final String TABLE_NAME = 'transaction_history';

  TransactionHistory({
     this.auctionId,
     this.lastBuyer,
     this.lastPrice,
     this.newBuyer,
     this.newPrice,
     this.transactionOn,
  });

  // Constructor to create a TransactionHistory instance from a JSON object
  TransactionHistory.fromJson(Map<String, Object?> json)
      : this(
          auctionId: json['auctionId']! as String,
          lastBuyer: json['lastBuyer']! as String,
          lastPrice: json['lastPrice']! as double,
          newBuyer: json['newBuyer']! as String,
          newPrice: json['newPrice']! as double,
          transactionOn: (json['transactionOn']! as Timestamp),
        );

  // Method to convert a TransactionHistory instance to a JSON object
  Map<String, Object?> toJson() {
    return {
      'auctionId': auctionId,
      'lastBuyer': lastBuyer,
      'lastPrice': lastPrice,
      'newBuyer': newBuyer,
      'newPrice': newPrice,
      'transactionOn': transactionOn,
    };
  }
}
