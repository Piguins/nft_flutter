class Wallet{
  String? id;
  String address;
  int numOfCoin;
  String chain;
  static final String TABLE_NAME = 'wallet';

  Wallet({
    required this.address,
    required this.numOfCoin,
    required this.chain
  });
  Wallet.fromJson(Map<String, Object?> json)
      : this(
          numOfCoin: json['numOfCoin']! as int,
          chain: json['chain']! as String,
          address: json['address']! as String,
        );
  Map<String,Object?> toJson(){
    return{
      'numOfCoin': numOfCoin,
      'chain': chain,
      'address':address
    };
  }
}