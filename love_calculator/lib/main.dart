import 'package:flutter/material.dart';

void main() {
  runApp(const LoveCalculatorApp());
}

class LoveCalculatorApp extends StatelessWidget {
  const LoveCalculatorApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Love Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoveCalculatorScreen(),
    );
  }
}

class LoveCalculatorScreen extends StatefulWidget {
  const LoveCalculatorScreen({Key? key}) : super(key: key);

  @override
  _LoveCalculatorScreenState createState() => _LoveCalculatorScreenState();
}

class _LoveCalculatorScreenState extends State<LoveCalculatorScreen> {
  final TextEditingController _yourNameController = TextEditingController();
  final TextEditingController _partnerNameController = TextEditingController();
  String _lovePercentage = '';

  void _calculateLove() {
    String name1 = _yourNameController.text.toLowerCase();
    String name2 = _partnerNameController.text.toLowerCase();

    if (name1.isNotEmpty && name2.isNotEmpty) {
      Set<String> commonLetters =
          name1.split('').toSet().intersection(name2.split('').toSet());
      Set<String> allLetters =
          name1.split('').toSet().union(name2.split('').toSet());

      // Calculate love percentage based on common letters
      int lovePercentage =
          ((commonLetters.length / allLetters.length) * 100).toInt();
      setState(() {
        _lovePercentage =
            'Love Percentage between both of You: $lovePercentage%';
      });
    } else {
      setState(() {
        _lovePercentage = 'Please enter both names!';
      });
    }
  }

  @override
  void dispose() {
    _yourNameController.dispose();
    _partnerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Love Calculator',
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Love Calculator - How much is he/she into you?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter Your Name:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _yourNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your Name',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Enter Your Partner's Name:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _partnerNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Partner\'s Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLove,
              child: const Text(
                'Calculate',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                backgroundColor: Colors.pink,
                textStyle: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _lovePercentage,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
          ],
        ),
      ),
    );
  }
}
