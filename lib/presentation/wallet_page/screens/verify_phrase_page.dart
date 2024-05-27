import 'package:application/presentation/wallet_page/screens/passcode_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyPhrasePage extends StatefulWidget {
  const VerifyPhrasePage({Key? key}) : super(key: key);

  @override
  _VerifyPhrasePageState createState() => _VerifyPhrasePageState();
}

class _VerifyPhrasePageState extends State<VerifyPhrasePage> {
  final TextEditingController _phraseController = TextEditingController();
  String? errorMessage;

  void _verifyPhrase() {
    List correctSeedPhrase = [
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten',
      'eleven',
      'twelve'
    ];
    List<String> inputPhrase = _phraseController.text.trim().split(' ');

    if (inputPhrase.length != correctSeedPhrase.length) {
      setState(() {
        errorMessage =
            'Seed phrase must contain ${correctSeedPhrase.length} words.';
      });
    } else if (inputPhrase.join(' ') == correctSeedPhrase.join(' ')) {
      setState(() {
        errorMessage = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seed phrase verified successfully!')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PasscodePage()));
    } else {
      setState(() {
        errorMessage = 'The seed phrase is incorrect. Please try again.';
      });
    }
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
