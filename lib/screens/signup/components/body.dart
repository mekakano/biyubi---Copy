import 'package:biyubi/Mapper/base_response.dart';
import 'package:biyubi/components/already_have_an_account.dart';
import 'package:biyubi/components/rounded_button.dart';
import 'package:biyubi/components/rounded_input_field.dart';
import 'package:biyubi/components/rounded_password_field.dart';
import 'package:biyubi/constants.dart';
import 'package:biyubi/Mapper/headers.dart';
import 'package:biyubi/loginscreen.dart';
import 'package:biyubi/screens/login/login_screen.dart';
import 'package:biyubi/screens/signup/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }
enum Answer { yes, no }

class Body extends StatefulWidget {
  final Widget child;
  Body({Key? key, required this.child}) : super(key: key);

  @override
  _BodySignUpPageState createState() => _BodySignUpPageState();
}

class _BodySignUpPageState extends State<Body> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  Header? headereike;
  bool switchValue = false;
  bool isVisible = true;
  bool isValidEmail = false;
  bool isVisibleChildForm = false;
  var passwordSignUp = TextEditingController();
  var confirmationPasswordSignUp = TextEditingController();
  var usernameSignUp = TextEditingController();
  var fullnameSignUp = TextEditingController();
  var alamatSignUp = TextEditingController();
  var hapeSignUp = TextEditingController();
  var emailSignUp = TextEditingController();
  var birthDateinput = TextEditingController();
  //birthdate
  DateTime? _birthDate;
  String? time;
  //
  int _value = 1;
  String selectedValue = "USA";
  Map<int, Answer?> answerVal = {};
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  //child
  var fullnameAnak = TextEditingController();

  @override
  void initState() {
    birthDateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "SIGN UP HEH",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              "assets/icons/dadv1.svg",
              height: size.height * 0.35,
            ),
            Visibility(
              visible: isVisible,
              child: RoundedInputField(
                  controller: usernameSignUp,
                  icon2: Icons.account_circle,
                  validatorwoi: (value) {
                    if (value == null) {
                      return "salah";
                    }
                    return null;
                  },
                  hintText: "Username",
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: isVisible,
              child: RoundedPasswordField(
                  hintText: "Password",
                  controller: passwordSignUp,
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: isVisible,
              child: RoundedPasswordField(
                  hintText: "Confirmation Password",
                  controller: passwordSignUp,
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: switchValue,
              child: RoundedInputField(
                  controller: fullnameSignUp,
                  icon2: Icons.border_color,
                  validatorwoi: (value) {
                    if (value == null) {
                      return "salah";
                    }
                    return null;
                  },
                  hintText: "Nama Lengkap",
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: switchValue,
              child: RoundedInputField(
                  controller: emailSignUp,
                  icon2: Icons.email,
                  validatorwoi: (value) {
                    isValidEmail = EmailValidator.validate(emailSignUp.text);
                    if (!isValidEmail) {
                      return "format email salah";
                    }
                    return null;
                  },
                  hintText: "Email",
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: switchValue,
              child: RoundedInputField(
                  controller: hapeSignUp,
                  icon2: Icons.phone,
                  validatorwoi: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  hintText: "Nomor HP",
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: switchValue,
              child: RoundedInputField(
                  controller: alamatSignUp,
                  icon2: Icons.location_city,
                  validatorwoi: (value) {
                    if (value == null) {
                      return "salah";
                    }
                    return null;
                  },
                  hintText: "Alamat",
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: isVisibleChildForm,
              child: RoundedInputField(
                  controller: fullnameAnak,
                  icon2: Icons.phone,
                  validatorwoi: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter nama anak';
                    }
                    return null;
                  },
                  hintText: "Nama Anak",
                  onChanged: (value) {}),
            ),
            Visibility(
              visible: isVisibleChildForm,
              child: ListTile(
                tileColor: kPrimaryColor,
                selectedTileColor: kPrimaryColor,
                iconColor: kPrimaryColor,
                selectedColor: kPrimaryColor,
                hoverColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

                focusColor:
                    MaterialStateColor.resolveWith((states) => kPrimaryColor),
// End copy
                title: const Text('www.javatpoint.com'),
                leading: Radio(
                  value: BestTutorSite.javatpoint,
                  groupValue: _site,
                  onChanged: (BestTutorSite? value) {
                    setState(() {
                      _site = value!;
                    });
                  },
                ),
              ),
            ),
            Visibility(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Jenis Kelamin: ',
                    style: TextStyle(
                        fontSize: 19,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29)),
                  child: Row(
                    children: <Widget>[
                      Radio(
                          value: 1,
                          groupValue: id,
                          activeColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Laki-laki';
                              id = 1;
                            });
                          }),
                      Text(
                        'Laki-laki',
                        style:
                            new TextStyle(fontSize: 17.0, color: kPrimaryColor),
                      ),
                      Radio(
                        value: 2,
                        focusColor: kPrimaryColor,
                        activeColor: kPrimaryColor,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Perempuan';
                            id = 2;
                          });
                        },
                      ),
                      Text(
                        'Perempuan',
                        style:
                            new TextStyle(fontSize: 17.0, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            Visibility(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: TextField(
                  controller: birthDateinput,
                  readOnly: true,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Tanggal Lahir Bayi',
                      border: InputBorder.none),
                  onTap: () async {
                    _birthDate = await showDatePicker(
                      context: context,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDate: _birthDate ?? DateTime.now(),
                      firstDate: DateTime(2006),
                      lastDate: DateTime(2025),
                    );

                    setState(() {
                      final now = DateTime.now();

                      time = DateFormat('dd-MM-yyyy').format(now);
                      print(time);
                    });
                    if (_birthDate != null) {
                      print(
                          _birthDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(_birthDate!);
                      print(formattedDate);
                      //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement
                      print('isi check: ' + radioButtonItem.toString());
                      setState(() {
                        birthDateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ),
            )),
            Visibility(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29)),
              child: DropdownButton(
                hint: Text("Jenis Kelamin"),
                icon: Icon(Icons.flag),
                value: selectedValue,
                items: dropdownItems,
                style: TextStyle(color: kPrimaryColor),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            )),
            Visibility(
              visible: isVisible,
              child: RoundedButton(
                text: "NEXT",
                press: () {
                  isVisible = false;
                  switchValue = true;
                  setState(() {});
                },
                color: kPrimaryColor,
              ),
            ),
            Visibility(
              visible: switchValue,
              child: RoundedButton(
                text: "SIGN UP",
                press: () {
                  isVisible = false;
                  switchValue = false;
                  isVisibleChildForm = true;
                  signup();
                  setState(() {});
                },
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }

  Future<void> signup() async {
    print("hai signup");
    isValidEmail = EmailValidator.validate(emailSignUp.text);
    print('Email is valid? ' + (isValidEmail ? 'yes' : 'no'));
    if (emailSignUp.text.isNotEmpty && hapeSignUp.text.isNotEmpty) {
      var payload = {
        "payload": {
          "username": usernameSignUp.text,
          "password": passwordSignUp.text,
          "fullname": fullnameSignUp.text,
          "phone_no": hapeSignUp.text,
          "address": alamatSignUp.text,
          "email": emailSignUp.text
        }
      };

      var responseLogin = await http.post(
          Uri.parse(
              "https://biyubi-clinic-backend.herokuapp.com/clinic/user/userRegistration"),
          body: jsonEncode({
            "payload": {
              "username": usernameSignUp.text,
              "password": passwordSignUp.text,
              "fullname": fullnameSignUp.text,
              "phone_no": hapeSignUp.text,
              "address": alamatSignUp.text,
              "email": emailSignUp.text
            }
          }));

      if (responseLogin.statusCode == 200) {
        var decoded = jsonDecode(responseLogin.body);
        var usernamee = decoded['header'];
        //Headers headersss;
        print("hasilnya 1 " + responseLogin.body);
        print("hasilnya 1 1 " + responseLogin.body.toString());
        print("hasil printout " + usernamee['responseCode']);
        if (usernamee['responseCode'] == '00') {
          isVisibleChildForm = true;
        }
      }
    }
  }
}
