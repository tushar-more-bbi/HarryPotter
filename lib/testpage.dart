import 'package:flutter/material.dart';

import 'categories.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  createState() {
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(context) {
    final item = ModalRoute.of(context)!.settings.arguments as Wizard;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          // ignore: avoid_unnecessary_containers
          body: Container(
              //  color: Colors.black,
              child: Column(
        children: [
          Container(
            height: 500,
            width: 500,
            color: const Color(0xffDFB06F),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    height: 50,
                    width: 400,
                    child: ListTile(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 35),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      trailing: const Icon(Icons.bookmark_outline,
                          color: Colors.white, size: 35),
                    )
                    //
                    ),
                Container(
                  height: 200,
                  width: 150,
                 
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(item.image.toString()))),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 18, bottom: 15),
                  height: 80,
                  width: 350,
                  child: Column(
                    children: [
                      Text(
                        item.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30.0),
                      ),
                      Text(
                        'by ${item.actor.toString()}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 80,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      rowText('species', item.species.toString()),
                      rowText('Ancestry', item.ancestry.toString()),
                      rowText('Gender', item.gender.toString()),
                      rowText('BirthYear', item.dateOfBirth.toString())
                    ],
                  ),
                )
              ],
            ),
          ),

          // ignore: sized_box_for_whitespace
          Container(
            height: 260,
            width: 500,
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 20, top: 20, left: 25, right: 25),
              height: 250,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      height: 180,
                      margin: const EdgeInsets.only(top: 10),
                      child: Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                item.description.toString(),
                                style: const TextStyle(color: Colors.grey),
                              ))))
                ],
              ),
            ),
          ),
        ],
      ))),
    );
  }
}

//Widget of row text
Widget rowText(String text1, String text2) {
  return Column(children: [
    Text(text1,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    Text(text2,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17))
  ]);
}

//
