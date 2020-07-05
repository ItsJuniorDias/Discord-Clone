import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_book/pages/Home.dart';

class SignUp extends StatelessWidget {
  String _name;
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
                margin: EdgeInsets.fromLTRB(14, 50, 14, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(labelText: 'Name'),
                                onSaved: (value) => _name = value,
                                validator: (value) {
                                  if (value.isEmpty)
                                    return "Campo nome obrigatório";
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(labelText: 'Email'),
                                onSaved: (value) => _email = value,
                                validator: (value) {
                                  if (value.isEmpty)
                                    return "Campo e-mail obrigatório";
                                  return null;
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration:
                                    InputDecoration(labelText: 'Password'),
                                onSaved: (value) => _password = value,
                                validator: (value) {
                                  if (value.isEmpty || value.length < 6)
                                    return "Campo password deve conter 6 caracteres";
                                  return null;
                                },
                              ),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          var response = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password);

                          var userUpdate = UserUpdateInfo()
                            ..displayName = _name;

                          response.user.updateProfile(userUpdate);

                          // conexão com Firestore e armazenar numa collection "users", por exemplo.

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => Home()));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
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
                            "SIGN UP",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
