import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../wallet_page.dart';

class PasscodePage extends StatefulWidget {
  const PasscodePage({Key? key}) : super(key: key);

  @override
  _PasscodePageState createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  final TextEditingController _phraseController = TextEditingController();
  String? errorMessage;

  Color accentPurpleColor = Color(0xFFDA7BBB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Wallet', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your 6-digit passcode',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2C3147),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(bottom: 20),
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: accentPurpleColor,
                focusedBorderColor: accentPurpleColor,
                showFieldAsBox: false,
                borderWidth: 4.0,
                textStyle: const TextStyle(fontSize: 24, color: Colors.white),
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here if necessary
                },
                obscureText: true,
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WalletPage(
                                isWalletEmpty: false,
                              )));
                },
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                child: Text('Forgot passcode?',
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
