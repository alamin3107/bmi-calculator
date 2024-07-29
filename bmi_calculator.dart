import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BMICalculator(),
  )
  );
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 160; // Initial height in cm
  double weight = 60; // Initial weight in kg
  double bmi = 0;

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Enter your height (in cm) and weight (in kg):',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Height: '),
              Slider(
                value: height,
                min: 100,
                max: 250,
                onChanged: (newValue) {
                  setState(() {
                    height = newValue;
                  });
                },
              ),
              Text('${height.toStringAsFixed(0)} cm'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Weight: '),
              Slider(
                value: weight,
                min: 30,
                max: 200,
                onChanged: (newValue) {
                  setState(() {
                    weight = newValue;
                  });
                },
              ),
              Text('${weight.toStringAsFixed(0)} kg'),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              calculateBMI();
            },
            child: const Text('Calculate BMI'),
          ),
          const SizedBox(height: 20),
          Text(
            'Your BMI is: ${bmi.toStringAsFixed(1)}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
