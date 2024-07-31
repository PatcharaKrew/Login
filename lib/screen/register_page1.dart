import 'package:final_login/constants/color.dart';
import 'package:final_login/screen/register_page2.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({super.key});

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String selectedTitle = 'นาย';
  String selectedGender = 'ชาย';
  final _formKey = GlobalKey<FormState>();

  void _next() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterPage2()),
      );
    }
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
                  'เข้าสู่ระบบ',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: textMainColor),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        value: selectedTitle, // กำหนดค่าเริ่มต้น
                        items: ['นาย', 'นาง', 'นางสาว'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTitle = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'คำนำหน้า',
                          labelStyle: TextStyle(color: textMainColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: borderColor, width: 1),
                          ),
                        ),
                        validator: (value) =>
                            value == null ? 'กรุณาเลือกคำนำหน้า' : null,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'ชื่อ',
                          labelStyle: TextStyle(color: textMainColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: borderColor, width: 1),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'กรุณากรอกชื่อ'
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'นามสกุล',
                    labelStyle: TextStyle(color: textMainColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: borderColor, width: 1),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'กรุณากรอกนามสกุล'
                      : null,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _idCardController,
                  decoration: InputDecoration(
                    labelText: 'เลขบัตรประชาชน',
                    labelStyle: TextStyle(color: textMainColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: borderColor, width: 1),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'กรุณากรอกเลขบัตรประชาชน'
                      : null,
                ),
                SizedBox(height: 20),
                Row(children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'เบอร์โทร',
                        labelStyle: TextStyle(color: textMainColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: borderColor, width: 1),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'กรุณากรอกเบอร์โทร'
                          : null,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      value: selectedGender, // กำหนดค่าเริ่มต้น
                      items: ['ชาย', 'หญิง', 'อื่นๆ'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'เพศ',
                        labelStyle: TextStyle(color: textMainColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: borderColor, width: 1),
                        ),
                      ),
                      validator: (value) =>
                          value == null ? 'กรุณาเลือกเพศ' : null,
                    ),
                  ),
                ]),
                SizedBox(height: 40),
                ElevatedButton(
                      onPressed: _next,
                      child: Text(
                        'ถัดไป',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: borderColor,
                      ),
                    ),
              ],
            )),
      )),
    );
  }
}
