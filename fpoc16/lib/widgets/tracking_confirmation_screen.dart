import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final StreamController<String> _monthController = StreamController<String>.broadcast();
  Stream<String> get monthStream => _monthController.stream;

  @override
  void initState() {
    updateCurrentMonth();
    super.initState();
  }
  @override
  void dispose() {
    _monthController.close();
    super.dispose();
  }

  void updateCurrentMonth() {
    var now = DateTime.now();
    var formatter = DateFormat.MMMM();
    _monthController.add(formatter.format(now));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 160,
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 95, 36, 159),
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
            padding: const EdgeInsets.only(top: 70),
            child: Card(
              child: _buildBody(),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              elevation: 1,
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

Widget _buildBody() {
  return SizedBox(
    width: 400,
    height: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 400,
          child: Card(
            margin: const EdgeInsets.fromLTRB(7, 5, 7, 0),
            elevation: 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 15, 0, 0),
                  child: Text(
                    'Your weekly goals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: StreamBuilder<String>(
                    stream: monthStream,
                    initialData: '',
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      String currentMonth = snapshot.data ?? '';
                      return Text(
                        'Month of $currentMonth',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.start,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '1/4',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
                  child: Text(
                    'Achieved',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'NON-COMPLIANCE WEEK:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.transparent,
                  shadows: [Shadow(offset: Offset(0, -3), color: Color.fromARGB(255, 82, 82, 82))],
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Color.fromARGB(255, 82, 82, 82),
                ),
                textAlign: TextAlign.start,
              ),
              Image.asset(
                'assets/icons/logo1.png',
                height: 50,
                alignment: Alignment.topRight,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
