import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:snugg_log/utils.dart';

class EntriesPage extends StatefulWidget {
  const EntriesPage({super.key});

  @override
  State<EntriesPage> createState() => _EntriesPageState();
}

class _EntriesPageState extends State<EntriesPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 43, 23),
        leading: Image.asset("assets/snugg_log_logo.png"),
        leadingWidth: 80,
        titleSpacing: 5,
        title: Text(
          "Entries",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            image: AssetImage("assets/background_1.png"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: TableCalendar(
            shouldFillViewport: true,
            focusedDay: _focusedDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
            daysOfWeekHeight: 30,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              weekendStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(color: Color.fromARGB(145, 0, 120, 0), shape: BoxShape.circle),
              selectedDecoration: BoxDecoration(color: Color.fromARGB(255, 0, 120, 0), shape: BoxShape.circle),
              outsideDaysVisible: false,
              markersMaxCount: 1,
              defaultTextStyle: TextStyle(color: Color.fromARGB(255, 54, 37, 17), fontWeight: FontWeight.w700, fontSize: 16),
              weekendTextStyle: TextStyle(color: Color.fromARGB(255, 54, 37, 17), fontWeight: FontWeight.w400, fontSize: 16),
            ),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                color: Color.fromARGB(255, 0, 77, 0),
                fontSize: 23,
                fontWeight: FontWeight.bold
              )
            ),
          )
        )
      )
    );
  }
}