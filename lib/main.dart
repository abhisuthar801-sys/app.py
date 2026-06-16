import 'package:flutter/material.dart';

void main() {
  runApp(const MathMasterApp());
}

class MathMasterApp extends StatelessWidget {
  const MathMasterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Master PRO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHindi = false;
  String? selectedAnswer;
  bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡ Math Master PRO', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E3A8A),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.language, color: Colors.white),
            label: Text(isHindi ? "English" : "Hindi", style: const TextStyle(color: Colors.white)),
            onPressed: () {
              setState(() {
                isHindi = !isHindi;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // WELCOME BANNER
            Text(
              isHindi ? "नमस्ते, राहुल! 👋 आज क्या सीखेंगे?" : "Hello, Rahul! 👋 What to learn today?",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // SECTION 1: DAILY GK
            _buildSectionCard(
              title: isHindi ? "🗓️ रोज़ाना जीके और राय" : "🗓️ Daily GK & Opinion",
              color: const Color(0xFFE0F2FE),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isHindi 
                      ? "1. भारत ने नया मौसम उपग्रह लॉन्च किया।\n2. RBI रेपो रेट 6.5% पर बरकरार।" 
                      : "1. India launched a new weather satellite.\n2. RBI keeps repo rate at 6.5%.",
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // SECTION 2: JOB ALERTS
            _buildSectionCard(
              title: isHindi ? "🔔 नयी सरकारी नौकरियां" : "🔔 Latest Job Alerts",
              color: const Color(0xFFFEF3C7),
              child: Text(
                isHindi 
                  ? "🆕 रेलवे RRB तकनीशियन भर्ती 2026\nकुल पद: 6,565 | अंतिम तिथि: 30 जून 2026" 
                  : "🆕 Railway RRB Technician Recruitment 2026\nTotal Posts: 6,565 | Last Date: 30 June 2026",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 15),

            // SECTION 3: MATHS QUIZ
            _buildSectionCard(
              title: isHindi ? "🔢 गणित अभ्यास (Percentage)" : "🔢 Math Quiz (Percentage)",
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isHindi 
                      ? "Q. 120 का 25% क्या होगा?" 
                      : "Q. What is 25% of 120?",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...["20", "30", "40", "50"].map((opt) => RadioListTile<String>(
                    title: Text(opt),
                    value: opt,
                    groupValue: selectedAnswer,
                    onChanged: (val) {
                      setState(() {
                        selectedAnswer = val;
                        isCorrect = (val == "30");
                      });
                    },
                  )),
                  if (isCorrect != null)
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.top(10),
                      color: isCorrect! ? Colors.green[100] : Colors.red[100],
                      width: double.infinity,
                      child: Text(
                        isCorrect! 
                          ? (isHindi ? "🟢 बिल्कुल सही उत्तर!" : "🟢 Correct Answer!") 
                          : (isHindi ? "🔴 गलत उत्तर! फिर कोशिश करें।" : "🔴 Incorrect! Try again."),
                        style: TextStyle(color: isCorrect! ? Colors.green[900] : Colors.red[900], fontWeight: FontWeight.bold),
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(height: 30),

            // BRANDING FOOTER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFBAE6FD)),
              ),
              child: Text(
                isHindi ? "🐾 पाowered बाय बिल्लू 🐾" : "🐾 POWERED BY BILLU 🐾",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child, required Color color}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
          const Divider(height: 20, color: Colors.black26),
          child,
        ],
      ),
    );
  }
}
