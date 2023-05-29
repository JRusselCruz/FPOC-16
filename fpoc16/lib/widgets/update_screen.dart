import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 160,
            child: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_circle_left_rounded),
                  ),
                  const Text(
                    'Time Tracking',
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Card(
              child: Card(
                child: Text(
                  'Your weekly goals'
                ),
              ),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}

_buildBody() {
  return ListView(
    children: <Widget> [
      Card(

      ),
    ],
  )
}