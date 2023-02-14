import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:yaqoob_test_project/const.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? selectedDay;
  late List<CleanCalendarEvent> selectedEvent;
  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent(
        'Event name xyz',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        description: 'Start from 2nd Sep 2022',
        color: Colors.blue,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent(
        'Event B',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        color: Colors.orange,
      ),
      CleanCalendarEvent(
        'Event C',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        color: Colors.pink,
      ),
    ],
  };

  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          logoSmallImagee,
        ),
        title: const Text(
          "Calendar",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset("assets/icons/filter.svg"),
          // )
        ],
      ),
      body: SafeArea(
        child: Calendar(
          // isExpandable: true,
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range) {
            print('selected Day ${range.from},${range.to}');
          },
          onDateSelected: (date) {
            return _handleData(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black12,
            fontWeight: FontWeight.w100,
          ),
          bottomBarTextStyle: const TextStyle(
            color: Colors.white,
          ),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        ),
      ),
    );
  }
}
