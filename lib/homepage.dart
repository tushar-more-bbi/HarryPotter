import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: unused_import, library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:harrypotter/testpage.dart';
import 'categories.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          // ignore: avoid_unnecessary_containers
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar(
                backgroundColor: Colors.yellow,
              ))
        ],
      ),
      body: Center(
          child: FutureBuilder(
              future: readJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<Wizard>;
                  // ignore: avoid_unnecessary_containers
                  return Container(
                      child: Column(
                    children: [
                      Searchbar(),

                      //Container-Categories
                      Container(
                          margin: const EdgeInsets.only(
                              left: 18, top: 20, bottom: 10),
                          height: 195,
                          width: 380,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Categories',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21)),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: 150,
                                  child: Expanded(
                                      child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Containers(150, 'House & House'),
                                            Containers(110, 'Student'),
                                            Containers(100, 'Student'),
                                            Containers(110, 'Student')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Containers(100, 'Staff'),
                                            Containers(100, 'Species'),
                                            Containers(150, 'Student'),
                                            Containers(120, 'Student')
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Containers(120, 'Still alive'),
                                            Containers(110, 'Student'),
                                            Containers(110, 'Student'),
                                            Containers(130, 'Student')
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                                )
                              ])),

                      //Container-Trending wizards
                      Container(
                          // height: 250,
                          margin: const EdgeInsets.only(
                              left: 18, top: 5, bottom: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Trending Wizard',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21)),
                                CarouselSlider.builder(
                                    itemCount: items.length,
                                    options: CarouselOptions(
                                        aspectRatio: 1.742,
                                        viewportFraction: 0.33),
                                    itemBuilder: (context, index, realIndex) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // ignore: avoid_print
                                              print(
                                                  items[index].name.toString());
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TestPage(),
                                                    settings: RouteSettings(
                                                      arguments: items[index],
                                                    )),
                                              );
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 23.0),
                                                height: 155,
                                                width: 105,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          items[index]
                                                              .image
                                                              .toString()),
                                                      fit: BoxFit.cover),
                                                )),
                                          ),
                                          Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                  items[index].name.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)))
                                        ],
                                      );
                                    }),
                              ])),

                      //Container-actors
                      Container(
                          margin: const EdgeInsets.only(
                              left: 18, top: 20, bottom: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 9),
                                    child: const Text('Top Actors',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21))),
                                CarouselSlider.builder(
                                  itemCount: items.length,
                                  options: CarouselOptions(
                                      aspectRatio: 4.0,
                                      viewportFraction: 0.235),
                                  itemBuilder: (context, index, realindex) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 9.5,
                                          left: 9.5,
                                          right: 9.5),
                                      height: 50,
                                      width: 80,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            items[index].image.toString()),
                                      ),
                                    );
                                  },
                                )
                              ]))
                    ],
                  ));

                  //
                } else {
                  return const CircularProgressIndicator();
                }
              })),
    );
  }
}

//Fetching data from local json file
// Future<List<Wizard>> readJsonData() async {
//   final jsondata =
//       await rootBundle.loadString('assets/harry_potter_content.json');
//   final list = json.decode(jsondata) as List<dynamic>;
//   return list.map((e) => Wizard.fromJson(e)).toList();
// }

//fetching data from Api
Future<List<Wizard>> readJsonData() async {
  final jsondata = await http.get(Uri.parse(
      'https://s3.amazonaws.com/bb.english.applications/APP-SERVER-UPDATE-TRAINING/Test/harry_potter_content.json'));
  //decode jsondata as list
  final list = json.decode(jsondata.body) as List<dynamic>;
  //map json and initialize using Datamodel
  return list.map((e) => Wizard.fromJson(e)).toList();
}

// Container Searchbar
// ignore: non_constant_identifier_names
Widget Searchbar() {
  return Container(
      height: 50,
      margin: const EdgeInsets.only(right: 18, left: 18, top: 10, bottom: 5),
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 222, 216, 216), width: 2),
        color: const Color.fromARGB(136, 240, 236, 236),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 22,
            ),
            hintText: 'Wizard name or Actor name',
            hintStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            )),
      ));
}

//Widget of container fields in categories
// ignore: non_constant_identifier_names
Widget Containers(double x, String text) {
  return Container(
    margin: const EdgeInsets.all(4),
    height: 40,
    width: x,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Color.fromARGB(136, 240, 236, 236),
    ),
    child: Row(
      children: [
        Container(
            margin: const EdgeInsets.all(5),
            child: const SizedBox(
              width: 30,
              height: 25,
              child: Icon(
                Icons.house,
                color: Colors.pink,
              ),
            )),
        Container(
            margin: const EdgeInsets.all(5),
            child: Text(text, style: const TextStyle(fontSize: 13)))
      ],
    ),
  );
}
