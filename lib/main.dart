import 'package:bloc_example/Bloc.dart';
import 'package:bloc_example/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bloc = new Bloc();

  submit(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageTwo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login page'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Bloc example',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                StreamBuilder<String>(
                  stream: bloc.checkEmail,
                  builder:(context, snapshot) => Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: bloc.emailchanged,
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        errorText: snapshot.error,
                      ),
                    ),
                  ),
                ),
                StreamBuilder<String>(
                  stream:  bloc.CheckPass,
                  builder:(context, snapshot) => Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      onChanged: bloc.passchanged,

                      controller: passwordController,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        errorText: snapshot.error,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                StreamBuilder<bool>(
                  stream: bloc.submitcheck,
                  builder: (context,snapshot)=> Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Login'),
                        onPressed : snapshot.hasData?submit(context) :null ,
                      ),),
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}