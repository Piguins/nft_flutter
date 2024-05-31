import 'package:application/presentation/wallet_page/screens/import_phrase_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'generate_phrase_page.dart';
import 'verify_phrase_page.dart';

class NoWalletPage extends StatelessWidget {
  const NoWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                // Icon with ! in circle
                Icons.error_outline,
                size: 100,
                color: Color(0xFFDA7BBB),
              ),
              Text(
                'No Wallet Found',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Please create a wallet to continue',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneratePhrasePage()));
                    },
                    // Padding
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 35),
                      // Border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(
                        color: Color(0xFFDA7BBB),
                      ),
                    ),
                    child: const Text("Create a new wallet",
                        style: TextStyle(color: Colors.white, fontSize: 16))),
              ),
              SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 0.9, 
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImportPharsePage()));
                  },
                  child: Text(
                    'Import a wallet using Seed Phrase',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
