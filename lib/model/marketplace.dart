import 'dart:ffi';

class Marketplace {
  static final String TABLE_NAME = 'marketplace';
  String? buyer;
  String? chain;
  bool? isSold;
  int? itemId;
  String? nftAddress;
  String? price;
  String? seller;
  int? tokenId;
  String? marketplaceId;


  Marketplace({
    this.buyer,
    required this.chain,
    required this.isSold,
    this.itemId,
    required this.nftAddress,
    required this.price,
    required this.seller,
    required this.tokenId,
    required this.marketplaceId
  });

  // Constructor to create a Marketplace instance from a JSON object
  Marketplace.fromJson(Map<String, Object?> json)
      : this(
          buyer: json['buyer'] as String?,
          chain: json['chain'] as String?,
          isSold: json['isSold'] as bool?,
          itemId: json['itemId'] as int?,
          nftAddress: json['nftAddress']! as String,
          price: json['price']! as String,
          seller: json['seller']! as String,
          tokenId: json['tokenId']! as int,
          marketplaceId: json['marketplaceId'] as String
        );

  // Method to convert a Marketplace instance to a JSON object
  Map<String, Object?> toJson() {
    return {
      'buyer': buyer,
      'chain': chain,
      'isSold': isSold,
      'itemId': itemId,
      'nftAddress': nftAddress,
      'price': price,
      'seller': seller,
      'tokenId': tokenId,
      'marketplaceId': marketplaceId,
    };
  }
}
