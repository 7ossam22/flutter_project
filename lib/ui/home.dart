import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.white,
                          )),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://p7.hiclipart.com/preview/252/195/771/screaming-souls-levi-manga-x-ray-dog-anime-anime-couple-images.jpg'),
                      )
                    ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text(
                          'Storage',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
