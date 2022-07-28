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
