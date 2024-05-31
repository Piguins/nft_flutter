import 'package:application/provider/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'verify_phrase_page.dart';

class GeneratePhrasePage extends StatefulWidget {
  const GeneratePhrasePage({Key? key}) : super(key: key);

  @override
  State<GeneratePhrasePage> createState() => _GeneratePhrasePageState();
}

class _GeneratePhrasePageState extends State<GeneratePhrasePage> {
  List<String>? seedPhrase;
  

  Future<List<String>> _generateSeedPhrase() async {
    return seedPhrase!;
  }
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final mnemonic = walletProvider.generateMnemonic();
    seedPhrase = mnemonic.split(' ');
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Wallet', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<String>>(
          future: _generateSeedPhrase(),
          builder: (context, snapshot) {
            seedPhrase = snapshot.data;
            return Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 38),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 38),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C3147),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Don’t risk losing your funds. Protect your Wallet by saving your Seed Phrase in a place you trust.',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'It’s the only way to recover your Wallet if you get locked out of the App or change to a new device.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      seedPhrase == null
                          ? const CircularProgressIndicator()
                          : Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(12, (index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3A3E5C),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '${index + 1}. ${seedPhrase![index]}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                );
                              }),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: seedPhrase != null,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        if (seedPhrase != null) {
                          Clipboard.setData(
                              ClipboardData(text: seedPhrase!.join(' ')));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Seed Phrase copied to clipboard')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyPhrasePage(correctSeedPhrase: seedPhrase!)));
                        }
                      },
                      child: const Text(
                        'Copy to clipboard',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
