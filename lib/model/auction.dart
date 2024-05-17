class Auction {
  String sellerAddress;
  double price;
  String buyerAddress;
  String nftAddress;
  int tokenId;
  String nameNFT;
  String NFTUrl;

  Auction({
    required this.sellerAddress,
    required this.price,
    required this.buyerAddress,
    required this.nftAddress,
    required this.tokenId,
    required this.nameNFT,
    required this.NFTUrl,
  });

  // Constructor to create an Auction instance from a JSON object
  Auction.fromJson(Map<String, Object?> json)
      : this(
          sellerAddress: json['sellerAddress']! as String,
          price: json['price']! as double,
          buyerAddress: json['buyerAddress']! as String,
          nftAddress: json['nftAddress']! as String,
          tokenId: json['tokenId']! as int,
          nameNFT: json['nameNFT']! as String,
          NFTUrl: json['NFTUrl']! as String,
        );

  // Method to convert an Auction instance to a JSON object
  Map<String, Object?> toJson() {
    return {
      'sellerAddress': sellerAddress,
      'price': price,
      'buyerAddress': buyerAddress,
      'nftAddress': nftAddress,
      'tokenId': tokenId,
      'nameNFT': nameNFT,
      'NFTUrl': NFTUrl,
    };
  }
}
