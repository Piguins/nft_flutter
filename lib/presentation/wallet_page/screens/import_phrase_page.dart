import 'package:application/core/utils/prefrence_variable.dart';
import 'package:application/presentation/wallet_page/screens/passcode_page.dart';
import 'package:application/presentation/wallet_page/wallet_page.dart';
import 'package:application/provider/wallet_provider.dart';
import 'package:application/service/auth_service.dart';
import 'package:application/service/private_key.dart';
import 'package:application/service/wallet_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class ImportPharsePage extends StatefulWidget {
  const ImportPharsePage({Key? key}) : super(key: key);
  @override
  _ImportPharsePageState createState() => _ImportPharsePageState();
}

class _ImportPharsePageState extends State<ImportPharsePage> {
  final TextEditingController _phraseController = TextEditingController();
  String? errorMessage;
  final WalletService walletService = WalletService();
  final PrivateKeyService privateKeyService = PrivateKeyService();

  void _verifyPhrase() async {
      final walletProvider =
      Provider.of<WalletProvider>(context, listen: false);
      // Call the getPrivateKey function from the WalletProvider
      final privateKey = await walletProvider.getPrivateKey(_phraseController.text.trim());
      EthereumAddress address = await walletProvider.getPublicKey(privateKey);
      await walletService.createNewWallet(address.hex, AuthService.user!.uid, 'bsc');
      await privateKeyService.addNewPrivateKey(privateKey, address.hex);
      if(privateKey!=null && address!=null)
      setState(() {
        errorMessage = null;
      });
      SharedPreferences preference = await SharedPreferences.getInstance();
      preference.setString(PreferenceVariable.WALLET_ADDRESS, address.hex);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seed phrase verified successfully!')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WalletPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Seed Phrase',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter your seed phrase to verify.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phraseController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Enter seed phrase',
                errorText: errorMessage,
                filled: true,
                fillColor: const Color(0xFF2C3147),
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              style: const TextStyle(color: Colors.white),
              maxLines: 2,
              minLines: 1,
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.75,
              child: ElevatedButton(
                onPressed: _verifyPhrase,
                child: const Text('Verify',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 35),
                  // Border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: BorderSide(
                    color: Color(0xFFDA7BBB),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
