import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_cloud/api/firebase_iauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  firebaseIAuth auth = firebaseIAuth().Singelton();
  String emailtxt = '';
  String passwordtxt = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(86, 190, 227, 1),
          Color.fromRGBO(43, 95, 114, 1)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                  child: Center(
                    child: Form(
                      child: Column(
                        children: [
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
                            'Hey!',
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
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password ?",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50),
                              ),
                              FloatingActionButton(
                                  onPressed: () {
                                    auth.signin(emailtxt, passwordtxt);
                                  },
                                  backgroundColor: Colors.cyan,
                                  child: const Icon(Icons.arrow_forward)),
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
                                onPressed: () {},
                                child: const Text(
                                  'Create new account ! ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ),
                  )),
            )));
  }
}
