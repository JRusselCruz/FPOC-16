import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final monthName = DateFormat('MMMM').format(now);
    final currentWeekday = now.weekday;
    final firstDayOfWeek = now.subtract(Duration(days: currentWeekday - 1));
    var lastDayOfWeek = now.add(Duration(days: DateTime.daysPerWeek - currentWeekday - 1));

    final isFirstWeekInMonth = firstDayOfWeek.month == now.month;
    final isLastWeekInMonth = lastDayOfWeek.month == now.month;

    // Check if the last day of the week is also the last day of the month
    if (lastDayOfWeek.month != now.month) {
      // Subtract the remaining days of the next month
      final daysInNextMonth = DateTime(lastDayOfWeek.year, lastDayOfWeek.month + 1, 0).day;
      final remainingDays = daysInNextMonth - lastDayOfWeek.day;
      lastDayOfWeek = lastDayOfWeek.subtract(Duration(days: remainingDays));
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 160,
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 95, 36, 159),
              title: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_circle_left_rounded),
                  ),
                  const Text(
                    'Time Tracking',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox.expand(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              child: Text(
                                'Month of $monthName',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.start,
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
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'NON-COMPLIANCE WEEK:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.transparent,
                              shadows: [Shadow(offset: Offset(0, -3), color:  Color.fromARGB(255, 117, 117, 117))],
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              decorationColor: Color.fromARGB(255, 117, 117, 117),
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Image.asset(
                            'assets/icons/logo1.png',
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                    if (isFirstWeekInMonth || isLastWeekInMonth)
                      Text(
                        '${DateFormat('MMM dd').format(firstDayOfWeek)} - ${DateFormat('dd, yyyy').format(lastDayOfWeek)}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(60, 25, 60, 50),
                      child: Text(
                        'Kindly upload the DXC Time screenshot of the week mentioned above.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 117, 117, 117),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Link(
                        uri: Uri.parse('https://login.replicon.com/DefaultV2.aspx?companykey=DXCTechnology&msg=Please+Login+to+continue&code=&init='),
                        builder: (context,followlink) => GestureDetector(
                          onTap: followlink,
                          child: const Text(
                            'Go To DXC Time',
                            style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                               color: Color.fromARGB(255, 117, 117, 117),
                               decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
