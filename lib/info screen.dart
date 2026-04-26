import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  int _genderSelection = 0;

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose(); // مهم علشان الميموري
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'B M I',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D5B),
                    letterSpacing: 4,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Name',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Birthdate',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _selectedDate == null
                        ? 'YYYY-MM-DD'
                        : '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}',
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Choose Gender',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: () => setState(() => _genderSelection = 1),
                    child: _genderBox("Male", Icons.person, 1),
                  ),

                  GestureDetector(
                    onTap: () => setState(() => _genderSelection = 2),
                    child: _genderBox("Female", Icons.person_2, 2),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () async {
                    var res = await fetchBmi();
                    print(res.data);
                  },
                  child: const Text('Get Started'),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderBox(String text, IconData icon, int value) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _genderSelection == value
              ? const Color(0xFF2E7D5B)
              : Colors.transparent,
          width: 2.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 70,
            color: _genderSelection == value
                ? const Color(0xFF2E7D5B)
                : Colors.grey,
          ),
          const SizedBox(height: 6),
          Text(text),
        ],
      ),
    );
  }
}

Future<Response> fetchBmi() async {
  Dio dio = Dio();

  final response = await dio.get(
    "https://api.apiverve.com/v1/bmicalculator?weight=70&height=170&unit=metric",
    options: Options(
      headers: {
        "x-api-key": "ff870e7d-5d78-4309-82bc-0b5e0347db0f"
      },
    ),
  );

  return response;
}