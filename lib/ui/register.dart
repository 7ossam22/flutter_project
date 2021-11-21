import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_cloud/viewmodel/register_viewmodel.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterViewModel viewModel = RegisterViewModel();
  String username = '';
  String emailtxt = '';
  String passwordtxt = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(86, 190, 190, 1),
          Color.fromRGBO(43, 95, 90, 1)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                  child: SafeArea(
                    child: Center(
                      child: Form(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            const Image(
                              image: AssetImage(
                                'assets/Group 1458.png',
                              ),
                              width: 150,
                              height: 150,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Welcome!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    username = val;
                                  });
                                },
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Username',
                                    hintStyle: TextStyle(color: Colors.white))),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    emailtxt = val;
                                  });
                                },
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.white))),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    passwordtxt = val;
                                  });
                                },
                                obscureText: true,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.white))),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50),
                                ),
                                StreamBuilder<bool>(
                                    stream: viewModel.loadingIndicator,
                                    initialData: false,
                                    builder: (context, snapshot) {
                                      // ignore: dead_code
                                      if (snapshot.data == false) {
                                        return FloatingActionButton(
                                            onPressed: () => viewModel
                                                .registerWithEmailAndPassword(
                                                    username,
                                                    emailtxt,
                                                    passwordtxt,
                                                    context),
                                            backgroundColor: Colors.greenAccent,
                                            child: const Icon(
                                                Icons.arrow_forward));
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.all(11.0),
                                          child: CircularProgressIndicator(
                                            color: Colors.cyan,
                                          ),
                                        );
                                      }
                                    }),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.popAndPushNamed(context, '/');
                                  },
                                  child: const Text(
                                    'Already have account ! ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            )));
  }
}
