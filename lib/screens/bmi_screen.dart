import 'package:flutter/material.dart';
import 'package:flutter_app1/shared/menu_bottom.dart';


class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  String heighMessage = '';
  String weighMessage = '';
  bool isMetric = true;
  bool isImperial = false;
  double?
      height; //To tell Flutter that I want these to be null at the beginning
  double? weight;
  late List<bool>
      isSelected; // I tell Flutter that I want to initialize it later
  // State less Widgets have only a build method
  // Statefull Widgets have several lifecycles methods that are called in a specific order
  // initState: once, when the Widget is called, similar to a constructor, not access to BuildComplex
  // build: after initState and when we call setState
  // dispose: to cleanup any resource, before the Widget is removed

  @override
  void initState() {
    isSelected = [isMetric, isImperial];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heighMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    weighMessage =
        'Please insert your height in ' + ((isMetric) ? 'kilos' : 'pounds ');
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      bottomNavigationBar: const MenuBottom(),
      body: SingleChildScrollView(
        child: Column(children: [
          ToggleButtons(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Metric', style: TextStyle(fontSize: fontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Imperial', style: TextStyle(fontSize: fontSize)),
            ),
          ], isSelected: isSelected, onPressed: toggleMeasure),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: txtHeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: heighMessage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: txtWeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: weighMessage),
            ),
          ),
          ElevatedButton(
              child: Text('Calculate BMI', style: TextStyle(fontSize: fontSize)),
              onPressed: findBMI),
          Text(result, style: TextStyle(fontSize: fontSize))
        ]),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    double prod = (height * height);

    if (isMetric) {
      bmi = weight / prod;
    } else {
      bmi = weight * 703 / prod;
    }

    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }
}
