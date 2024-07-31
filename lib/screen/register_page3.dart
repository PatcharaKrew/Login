import 'package:final_login/constants/color.dart';
import 'package:final_login/screen/register_page2.dart';
import 'package:final_login/screen/register_page4.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({super.key});

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _waistController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double? _bmi;
  double? _waistToHeightRatio;

  void _calculateMetrics() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);
    final waist = double.tryParse(_waistController.text);

    if (weight != null && height != null) {
      setState(() {
        _bmi = weight / ((height / 100) * (height / 100));
      });
    }

    if (waist != null && height != null) {
      setState(() {
        _waistToHeightRatio = waist / height;
      });
    }
  }

  void _skipToNext() {
    _calculateMetrics(); // Optionally calculate metrics before skipping
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage4()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  'ข้อมูลสุขภาพ',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: textMainColor,
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    labelText: 'น้ำหนัก (กิโลกรัม)',
                    labelStyle: TextStyle(color: textMainColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: borderColor, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'กรุณากรอกน้ำหนัก'
                      : null,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: 'ส่วนสูง (เซนติเมตร)',
                    labelStyle: TextStyle(color: textMainColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: borderColor, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'กรุณากรอกส่วนสูง'
                      : null,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _waistController,
                  decoration: InputDecoration(
                    labelText: 'รอบเอว (เซนติเมตร)',
                    labelStyle: TextStyle(color: textMainColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: borderColor, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'กรุณากรอกรอบเอว' : null,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage2()),
                    );
                  },
                  child: Text(
                    'กลับไปก่อนหน้า',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: borderColor2,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _skipToNext,
                  child: Text(
                    'ข้าม',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: borderColor,
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
