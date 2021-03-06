import 'package:flutter/material.dart';
import 'package:login_app/pagetwo.dart';
import 'bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _txtEmail = TextEditingController();
  final _txtPassword = TextEditingController();

  final _controller = TextEditingController();
  changeThePage(BuildContext context, String email, String password) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PageTwo(
              email: email.trim(),
              password: password.trim(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("login bloc"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                  stream: bloc.email,
                  builder: (context, snapshot) => TextField(
                      controller: _txtEmail,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: bloc.emailChanged,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Email",
                        labelText: "Email",
                        errorText: snapshot.error,
                      ))),
              SizedBox(height: 10),
              StreamBuilder<String>(
                  stream: bloc.password,
                  builder: (context, snapshot) => TextField(
                        controller: _txtPassword,
                        onChanged: bloc.passwordChanged,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Password",
                            errorText: snapshot.error,
                            labelText: "Password"),
                      )),
              SizedBox(height: 20),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                  color: Colors.tealAccent,
                  onPressed: snapshot.hasData
                      ? () => changeThePage(context, _txtEmail.text.trim(),
                          _txtPassword.text.trim())
                      : null,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
