import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dronetech/dimensions.dart';
import 'package:dronetech/widgets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //firebase
  late final CollectionReference _details =
      FirebaseFirestore.instance.collection('details');
  late final CollectionReference _Classifications =
      FirebaseFirestore.instance.collection('Classifications');

  //firebase operations
  //await _details.add({'});
  //await _details.update({'});
  //await _details.doc({'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Drone Tech',
          style: TextStyle(
              fontSize: Dimensions.font20 * 2,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.sizedBoxHeight10),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.sizedBoxHeight20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(Dimensions.sizedBoxHeight10),
                  topLeft: Radius.circular(Dimensions.sizedBoxHeight10),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: Dimensions.sizedBoxHeight30,
              alignment: Alignment.center,
              child: Text(
                'Major Types of Drones',
                style: TextStyle(
                    fontSize: Dimensions.font25,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Dimensions.sizedBoxHeight10,
            ),
            //the major types of drones in the vertical scroll view
            Expanded(
              flex: 2,
              child: StreamBuilder(
                  stream: _Classifications.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return Types(
                              name: documentSnapshot['name'],
                              link: documentSnapshot['image']);
                        },
                        // children: [
                        //   Types(
                        //     name: 'Fixed-Wing Hybrid VTOL.',
                        //     link:
                        //         'https://i0.wp.com/www.droneassemble.com/wp-content/uploads/2019/11/1-7.jpg?resize=1000%2C1000&ssl=1',
                        //   ),
                        //   Types(
                        //     name: 'Single-Rotor Drones',
                        //     link:
                        //         'https://image.made-in-china.com/2f0j00OgvUPQBzYebp/12kg-Load-Full-Autonomous-Single-Rotor-Oil-Power-Plant-Protection-Drone.jpg',
                        //   ),
                        //   Types(
                        //     name: 'Fixed-Wing Drones',
                        //     link:
                        //         'https://geo-matching.com/uploads/default/d/s/dsc07909.png',
                        //   ),
                        //   Types(
                        //     name: 'Multi-Rotor Drones.',
                        //     link:
                        //         'https://www.researchgate.net/publication/337948739/figure/fig1/AS:844877071929344@1578445799169/Multi-rotor-UAV-6.ppm',
                        //   ),
                        // ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(
              height: Dimensions.sizedBoxHeight40,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(Dimensions.sizedBoxHeight20),
                  topLeft: Radius.circular(Dimensions.sizedBoxHeight20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: Dimensions.sizedBoxHeight30,
              alignment: Alignment.center,
              child: Text(
                'Drones',
                style: TextStyle(
                    fontSize: Dimensions.font26,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Dimensions.sizedBoxHeight20,
            ),
            //drones and its properties
            Expanded(
              flex: 5,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                      stream: _details.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return
                              // return
                              GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisExtent: 300),
                                  itemCount: streamSnapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot documentSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey),
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 20,
                                          right: 10,
                                          left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //image
                                          Container(
                                            height: 150,
                                            width: 150,
                                            color: Colors.grey,
                                            child: Image(
                                                image: NetworkImage(
                                                    documentSnapshot[
                                                        'imageLink']),
                                                fit: BoxFit.fill),
                                          ),

                                          //details
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('ID:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(documentSnapshot['tag']),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('Weight:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(documentSnapshot[
                                                      'weight']),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('Manufacturer:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(documentSnapshot[
                                                      'manufacturer']),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('Condition:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(documentSnapshot[
                                                      'health']),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('D O A:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                    documentSnapshot['date'],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  });
                        }
                        //for loading
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
