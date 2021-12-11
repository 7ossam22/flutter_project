import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_cloud/api/firebase_iauth.dart';
import 'package:get_cloud/viewmodel/home_viewmodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeViewModel _viewModel = HomeViewModel();
    _viewModel.onGettingUserData();
    print('UserModel Printed to be ----> ${_viewModel.userModel}');
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
                      StreamBuilder<String>(
                          stream: _viewModel.profilePic,
                          builder: (context, snapshot) {
                            if (snapshot.data!.isNotEmpty) {
                              return CircleAvatar(
                                backgroundImage:
                                    NetworkImage(snapshot.data.toString()),
                                backgroundColor:
                                    const Color.fromRGBO(86, 190, 227, 1),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          })
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
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Storage',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        StreamBuilder<double>(
                            stream: _viewModel.usage,
                            builder: (context, snapshot) {
                              if (snapshot.data!.toString().isNotEmpty) {
                                return Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                      '${snapshot.data!.toString()} / 5 GB used',
                                      style: const TextStyle(
                                          color: Colors.cyan, fontSize: 15)),
                                );
                              } else {
                                return const Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text('500 MB / 5 GB used',
                                      style: TextStyle(
                                          color: Colors.cyan, fontSize: 15)),
                                );
                              }
                            }),
                        const SizedBox(
                          height: 8,
                        ),
                        StreamBuilder<double>(
                            stream: _viewModel.usage,
                            builder: (context, snapshot) {
                              return LinearProgressIndicator(
                                minHeight: 10,
                                color: Colors.cyan,
                                value: (snapshot.data! / 5242880).toDouble(),
                              );
                            })
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Flexible(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: ListView(),
                          ),
                          Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.cyan,
                                child: const Icon(Icons.add),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
