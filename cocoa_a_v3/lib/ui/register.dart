import 'package:cocoa_a_v3/ui/authentication.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cocoa_a_v3/net/flutterfire.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _fNameField = TextEditingController();
  TextEditingController _lNameField = TextEditingController();
  TextEditingController _phoneField = TextEditingController();
  String _genderField = 'Prefer not to answer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EBD39E"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Image(
                  image: AssetImage('assets/logo3.png'),
                  height: 150,
                ),
              ),
            ),

            // FIRST NAME
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: HexColor('#735240')),
                controller: _fNameField,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: HexColor('#735240')),
                ),
              ),
            ),

            // LAST NAME
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: HexColor('#735240')),
                controller: _lNameField,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: HexColor('#735240')),
                ),
              ),
            ),

            // PHONE NUMBER
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: HexColor('#735240')),
                controller: _phoneField,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: HexColor('#735240')),
                ),
              ),
            ),

            // GENDER
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: DropdownButton<String>(
                value: _genderField,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: HexColor('#735240')),
                underline: Container(
                  height: 2,
                  color: HexColor('#8547FF'),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    _genderField = newValue;
                  });
                },
                items: <String>[
                  'Female',
                  'Male',
                  'Non-Binary',
                  'Prefer not to answer'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            // EMAIL
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: HexColor('#735240')),
                controller: _emailField,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  hintText: 'YourEmail@Example.com',
                  hintStyle: TextStyle(color: HexColor('#735240')),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: HexColor('#735240')),
                ),
              ),
            ),

            //PASSWORD
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: HexColor('#735240')),
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#8547FF')),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: HexColor('#735240')),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: HexColor('#735240')),
                ),
              ),
            ),

            // REGISTER BUTTON
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: HexColor('#8547FF'),
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate = await register(
                      _emailField.text,
                      _passwordField.text,
                      _fNameField.text,
                      _lNameField.text,
                      _phoneField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Authentication(),
                      ),
                    );
                  }
                },
                child: Text(
                  "register",
                  style: new TextStyle(
                    fontSize: 28,
                    fontFamily: 'brightSunshineCap',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
