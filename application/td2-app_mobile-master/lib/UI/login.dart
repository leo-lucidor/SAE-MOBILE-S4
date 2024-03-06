import 'package:flutter/material.dart';
import 'package:supabase_quickstart/UI/home.dart';


class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Logique de connexion à implémenter ici
                String email = _emailController.text;
                String password = _passwordController.text;
                // Vous pouvez ajouter la logique de connexion ici
                print('Email: $email');
                print('Password: $password');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget(Colors.teal, 40.0)),
                );
              },
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Page de connexion',
    home: LoginPage(),
  ));
}
