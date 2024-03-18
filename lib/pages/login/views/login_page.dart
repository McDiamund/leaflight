import 'package:flutter/material.dart';
import 'package:leaflite/authentication/domain/service/user_service.dart';
import 'package:leaflite/authentication/providers/auth_provider.dart';
import 'package:leaflite/authentication/providers/user_provider.dart';
import 'package:leaflite/components/primary_button.dart';
import 'package:leaflite/components/primary_textfield.dart';
import 'package:leaflite/pages/signup/signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    
    void submitForm() async {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        if (email.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please Enter Email'),
          ));

          return;
        }

        if (password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please Enter Password'),
          ));

          return;
        }

        try {
          setState(() {
            isLoading = true;
          });

          final user = await UserService.signin(email, password);

          if (user.id != null) {
            await userProvider.setUser(user);

            // // Login successful, update the UI
            await authProvider.loginUser();
          }

          setState(() {
            isLoading = false;
          });

          return;
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(e.toString()),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );

          setState(() {
            isLoading = false;
          });
        }
      }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const Text('Welcome to Leaflite', style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 20),
                  PrimaryTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  PrimaryTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  PrimaryButton(
                    onTap: submitForm,
                    buttonText: "LOGIN",
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage())
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.green[400], fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isLoading) ...[
                Center(
                  child: 
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Color.fromRGBO(72, 72, 72, 0.498),
                    child: Center(child: CircularProgressIndicator())

                  )
                )
              ]
      ],
    );
  }
}
