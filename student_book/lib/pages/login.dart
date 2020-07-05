import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_book/pages/Home.dart';
import 'package:student_book/pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatelessWidget {
  String _email;
  String _password;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'lib/assets/logo2.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ],
                  )),
              Container(
                width: 600,
                height: 215,
                margin: EdgeInsets.fromLTRB(14, 50, 14, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(labelText: 'Email'),
                              onSaved: (value) => _email = value,
                              validator: (value) {
                                if (value.isEmpty)
                                  return "Campo e-mail obrigatório";
                                return null;
                              }),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(labelText: 'Password'),
                            onSaved: (value) => _password = value,
                            validator: (value) {
                              if (value.isEmpty || value.length < 6)
                                return "Campo password deve conter 6 caracteres";
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 16, 14, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            child: Text("Forgot your password?",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Metropolis-Normal",
                                    fontWeight: FontWeight.w400)),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Icon(Icons.subdirectory_arrow_right,
                                size: 24, color: Color(0xFFff6b61)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonTheme(
                        height: 50.0,
                        minWidth: 200,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  var response = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _email, password: _password);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                }
                              },
                              child: Container(
                                height: 48,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color(0xFFff6b61),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 8,
                                      color: Color.fromRGBO(211, 38, 38, 0.25),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "Metropolis-Normal",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        heightFactor: 1.7,
                        child: ButtonTheme(
                          height: 50,
                          minWidth: 200,
                          child: OutlineButton(
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Color(0xFFff6b61),
                                  fontSize: 18,
                                  fontFamily: "Metropolis-Normal",
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
