import 'package:flutter/material.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sans-serif'),
      home: const WelcomeScreen(),
    );
  }
}

// ==================== WELCOME SCREEN ====================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EFF5),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Illustration
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E6F5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.monitor_weight_outlined,
                        size: 120,
                        color: Color(0xFF7B6FD0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom Card
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF7B6FD0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'It takes just 30 seconds – and your health is worth it!',
                  style: TextStyle(color: Color(0xFFE0DEFF), fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.white30),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const BmiInputScreen()),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D3580),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== BMI INPUT SCREEN ====================
class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({super.key});

  @override
  State<BmiInputScreen> createState() => _BmiInputScreenState();
}

class _BmiInputScreenState extends State<BmiInputScreen> {
  final nameController = TextEditingController();
  final birthdateController = TextEditingController();
  String selectedGender = 'male';
  int height = 170;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EFF5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 8),

              // Title
              const Center(
                child: Text(
                  'B M I',
                  style: TextStyle(
                    color: Color(0xFF1B5E3B),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Name
              const Text('Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  filled: true,
                  fillColor: const Color(0xFFE8E6F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Birthdate
              const Text('Birthdate',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextField(
                controller: birthdateController,
                decoration: InputDecoration(
                  hintText: 'YYYY-MM-DD',
                  filled: true,
                  fillColor: const Color(0xFFE8E6F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Gender
              const Text('Choose Gender',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                children: [
                  // Male
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedGender = 'male'),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E6F5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedGender == 'male'
                                ? const Color(0xFF1B5E3B)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person, size: 60, color: Color(0xFF5C4DB1)),
                            Text('Male', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Female
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedGender = 'female'),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E6F5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedGender == 'female'
                                ? const Color(0xFF1B5E3B)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_2, size: 60, color: Color(0xFFE8845A)),
                            Text('Female', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Height
              const Text('Height (cm)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E6F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(() { if (height > 100) height--; }),
                      icon: const Icon(Icons.remove, color: Color(0xFF7B6FD0)),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('$height',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() { if (height < 250) height++; }),
                      icon: const Icon(Icons.add, color: Color(0xFF7B6FD0)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Weight
              const Text('Weight (kg)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E6F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(() { if (weight > 30) weight--; }),
                      icon: const Icon(Icons.remove, color: Color(0xFF7B6FD0)),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('$weight',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() { if (weight < 300) weight++; }),
                      icon: const Icon(Icons.add, color: Color(0xFF7B6FD0)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Calculate Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty || birthdateController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }
                    final bmi = weight / ((height / 100) * (height / 100));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BmiResultScreen(
                          name: nameController.text,
                          birthdate: birthdateController.text,
                          bmi: bmi,
                          height: height,
                          weight: weight,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C4DB1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Calculated BMI',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== BMI RESULT SCREEN ====================
class BmiResultScreen extends StatelessWidget {
  final String name;
  final String birthdate;
  final double bmi;
  final int height;
  final int weight;

  const BmiResultScreen({
    super.key,
    required this.name,
    required this.birthdate,
    required this.bmi,
    required this.height,
    required this.weight,
  });

  Map<String, String> getBmiInfo() {
    if (bmi < 18.5) {
      return {
        'category': 'Under Weight',
        'desc': 'Your BMI is less than 18.5. Being underweight can be a concern. Consider consulting a healthcare provider for a balanced diet plan to reach a healthy weight.',
      };
    } else if (bmi < 25) {
      return {
        'category': 'Normal Weight',
        'desc': 'Your BMI is between 18.5 and 24.9. Great job! You have a healthy body weight. Keep up the good work and stay consistent with healthy habits.',
      };
    } else if (bmi < 30) {
      return {
        'category': 'Over Weight',
        'desc': 'Your BMI is between 25.0 and 29.9. Consider adopting a healthier diet and increasing physical activity. Consult a healthcare provider for personalized advice.',
      };
    } else {
      return {
        'category': 'Obese',
        'desc': 'Your BMI is 30.0 or higher. It is strongly recommended to consult a healthcare professional for a comprehensive weight management plan.',
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = getBmiInfo();
    return Scaffold(
      backgroundColor: const Color(0xFFF0EFF5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Back
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  padding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 8),

              // Result Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF7B6FD0),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(birthdate,
                              style: const TextStyle(
                                  color: Color(0xFFE0DEFF), fontSize: 13)),
                          const SizedBox(height: 20),
                          Text(bmi.toStringAsFixed(2),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold)),
                          const Text('BMI Calc',
                              style: TextStyle(
                                  color: Color(0xFFE0DEFF), fontSize: 13)),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$height cm',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const Text('Height',
                                      style: TextStyle(
                                          color: Color(0xFFE0DEFF), fontSize: 12)),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.white38,
                                margin: const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$weight kg',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const Text('Weight',
                                      style: TextStyle(
                                          color: Color(0xFFE0DEFF), fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.accessibility_new,
                        size: 100, color: Color(0xFF3D3580)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Category Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5E3B),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(info['category']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(info['desc']!,
                        style: const TextStyle(
                            color: Color(0xFFE0FFE0),
                            fontSize: 14,
                            height: 1.5)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Calculate Again
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C4DB1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Calculate BMI Again',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
