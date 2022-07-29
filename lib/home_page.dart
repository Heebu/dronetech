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

  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _healthController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _manufacturerController = TextEditingController();

  //update
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _tagController.text = documentSnapshot['tag'];
      _manufacturerController.text = documentSnapshot['manufacturer'];
      _healthController.text = documentSnapshot['health'];
      _weightController.text = documentSnapshot['weight'];
      _dateController.text = documentSnapshot['date'];
      _imageController.text = documentSnapshot['imageLink'];
    }
    //show bottom sheet
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _tagController,
                  decoration: const InputDecoration(labelText: 'Tag'),
                ),
                TextField(
                  controller: _manufacturerController,
                  decoration: const InputDecoration(labelText: 'Manufacturer'),
                ),
                TextField(
                  controller: _weightController,
                  decoration: const InputDecoration(labelText: 'Weight'),
                ),
                TextField(
                  controller: _healthController,
                  decoration: const InputDecoration(labelText: 'Condition'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'Image Link'),
                ),
                SizedBox(
                  height: Dimensions.sizedBoxHeight20,
                ),

                //edit button
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String tag = _tagController.text;
                    final String manufacturer = _manufacturerController.text;
                    final String weight = _weightController.text;
                    final String condition = _healthController.text;
                    final String date = _dateController.text;
                    final String image = _imageController.text;

                    if (image != null) {
                      await _details.doc(documentSnapshot!.id).update({
                        'tag': tag,
                        'manufacturer': manufacturer,
                        'weight': weight,
                        'health': condition,
                        'date': date,
                        'imageLink': image,
                      });
                      _tagController.text = '';
                      _manufacturerController.text = '';
                      _weightController.text = '';
                      _healthController.text = '';
                      _dateController.text = '';
                      _imageController.text = '';
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  //create
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _tagController.text = documentSnapshot['tag'];
      _manufacturerController.text = documentSnapshot['manufacturer'];
      _healthController.text = documentSnapshot['health'];
      _weightController.text = documentSnapshot['weight'];
      _dateController.text = documentSnapshot['date'];
      _imageController.text = documentSnapshot['imageLink'];
    }

    //show bottom sheet
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _tagController,
                  decoration: const InputDecoration(labelText: 'Tag'),
                ),
                TextField(
                  controller: _manufacturerController,
                  decoration: const InputDecoration(labelText: 'Manufacturer'),
                ),
                TextField(
                  controller: _weightController,
                  decoration: const InputDecoration(labelText: 'Weight'),
                ),
                TextField(
                  controller: _healthController,
                  decoration: const InputDecoration(labelText: 'Condition'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'Image Link'),
                ),
                SizedBox(
                  height: Dimensions.sizedBoxHeight20,
                ),
                //Create Button
                ElevatedButton(
                    child: const Text('Create'),
                    onPressed: () async {
                      final String tag = _tagController.text;
                      final String manufacturer = _manufacturerController.text;
                      final String weight = _weightController.text;
                      final String condition = _healthController.text;
                      final String date = _dateController.text;
                      final String image = _imageController.text;

                      if (image != null) {
                        await _details.add({
                          'tag': tag,
                          'manufacturer': manufacturer,
                          'weight': weight,
                          'health': condition,
                          'date': date,
                          'imageLink': image,
                        });
                        _manufacturerController.text = '';
                        _weightController.text = '';
                        _healthController.text = '';
                        _dateController.text = '';
                        _imageController.text = '';
                      }
                      ;
                    })
              ],
            ),
          );
        });
  }

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
            MajorDrones(Classifications: _Classifications),
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
                                          mainAxisExtent: 350),
                                  itemCount: streamSnapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot documentSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey),
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                        left: 5,
                                        bottom: 10,
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 20,
                                      ),
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
                                                  const Text('ID:',
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
                                                  const Text('Weight:',
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
                                                  const Text('Manufacturer:',
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
                                                  const Text('Condition:',
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
                                                  const Text('D O A:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                    documentSnapshot['date'],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        await _details
                                                            .doc(
                                                                documentSnapshot!
                                                                    .id)
                                                            .delete();
                                                      },
                                                      icon: Icon(Icons.delete)),
                                                  IconButton(
                                                      onPressed: () {
                                                        _update(
                                                            documentSnapshot);
                                                      },
                                                      icon: Icon(Icons.edit)),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  });
                        }
                        //for loading
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
            ),
          ],
        ),
      ),

      //floating action button to create new doc
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
