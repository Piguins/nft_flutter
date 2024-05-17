class PrivateKey {
  String privateKey;
  String? passcode;
  String? accountId;

  PrivateKey({
    required this.privateKey,
    this.passcode,
    this.accountId,
  });

  // Constructor to create a PrivateKey instance from a JSON object
  PrivateKey.fromJson(Map<String, Object?> json)
      : this(
          privateKey: json['privateKey']! as String,
          passcode: json['passcode'] as String?,
          accountId: json['accountId'] as String?,
        );

  // Method to convert a PrivateKey instance to a JSON object
  Map<String, Object?> toJson() {
    return {
      'privateKey': privateKey,
      'passcode': passcode,
      'accountId': accountId,
    };
  }
}
