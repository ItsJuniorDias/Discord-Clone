import 'package:flutter/material.dart';
import 'package:student_book/widgets/FormComponent.dart';


class SignIn extends StatelessWidget {
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
                ],)
              ),
              Container(
                width: 600,
                height: 200,
                margin: EdgeInsets.fromLTRB(14, 50, 14, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FormComponent(),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonTheme(
                        height: 50.0,
                        minWidth: 200,
                        child: RaisedButton(
                          onPressed: () => {
                            Navigator.pushNamed(context, '/lib/pages/Catalogo')
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Metropolis-Normal",
                                fontWeight: FontWeight.w600),
                          ),
                          color: Color(0xFFff6b61),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Or login with social account",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Metropolis-Normal",
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
             
            ],
          ),
        ));
  }
}