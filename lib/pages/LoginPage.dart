import 'package:basics/utils/routes_pages.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool btnPrs = false;

  final _formKey = GlobalKey<FormState>();

  navToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        btnPrs = true;
      });

      await Future.delayed(const Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        btnPrs = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(
              height: 60.0,
            ),
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 34),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter username", labelText: "Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      } else if (value.length <= 6) {
                        return "Username should be of length 6 and above";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length <= 6) {
                          return "Password should be of length 8 and above";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(btnPrs ? 50 : 100),
                      child: InkWell(
                          onTap: navToHome,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: btnPrs ? 50 : 100,
                            height: 40,
                            alignment: Alignment.center,
                            child: btnPrs
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ))),
                ],
              ),
            ),
          ]),
        )));
  }
}
