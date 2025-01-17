import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageCalc extends StatefulWidget {
  const HomePageCalc({super.key});

  @override
  State<HomePageCalc> createState() => _HomePageCalc();
}

class _HomePageCalc extends State<HomePageCalc> {
  double? result;
  TextEditingController heightEditingController = TextEditingController();
  TextEditingController weightEditingController = TextEditingController();

  void calculateBMI() {
    final height = double.tryParse(heightEditingController.text);
    final weight = double.tryParse(weightEditingController.text);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid height and weight!")),
      );
      return;
    }

    setState(() {
      result = weight / (height * height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 120, 232),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 187, 120, 232),
          elevation: 0,
          title: const Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result == null
                      ? "Enter height and weight to calculate BMI"
                      : "Your BMI: ${result!.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: heightEditingController,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 154, 31, 236)),
                  decoration: const InputDecoration(
                    hintText: 'Enter Height (m)',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 154, 31, 236)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color.fromARGB(255, 187, 120, 232),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color.fromARGB(255, 187, 120, 232),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: weightEditingController,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 154, 31, 236)),
                  decoration: const InputDecoration(
                    hintText: 'Enter Weight (kg)',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 154, 31, 236)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color.fromARGB(255, 187, 120, 232),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color.fromARGB(255, 187, 120, 232),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 154, 31, 236),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
