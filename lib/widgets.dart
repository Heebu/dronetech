import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dimensions.dart';

class Types extends StatelessWidget {
  const Types({
    Key? key,
    required this.name,
    required this.link,
  }) : super(key: key);

  final String name;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
      child: Column(
        children: [
          Image(
            image: NetworkImage(
              link,
            ),
            fit: BoxFit.cover,
            height: Dimensions.sizedBoxHeight100 + Dimensions.sizedBoxHeight20,
          ),
          Spacer(),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font16,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Oops, Something went wrong',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//loading
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

//major drones widget
class MajorDrones extends StatefulWidget {
  const MajorDrones({
    Key? key,
    required CollectionReference<Object?> Classifications,
  })  : _Classifications = Classifications,
        super(key: key);

  final CollectionReference<Object?> _Classifications;

  @override
  State<MajorDrones> createState() => _MajorDronesState();
}

class _MajorDronesState extends State<MajorDrones> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: StreamBuilder(
          stream: widget._Classifications.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: streamSnapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Expanded(
                    child: Types(
                        name: documentSnapshot['name'],
                        link: documentSnapshot['image']),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
