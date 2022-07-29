import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            height: 120,
          ),
          Spacer(),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
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
        child: Text('Oops, Something went wrong'),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class MajorDrones extends StatelessWidget {
  const MajorDrones({
    Key? key,
    required CollectionReference<Object?> Classifications,
  })  : _Classifications = Classifications,
        super(key: key);

  final CollectionReference<Object?> _Classifications;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: StreamBuilder(
          stream: _Classifications.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
