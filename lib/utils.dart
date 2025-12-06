// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<String>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll({
  DateTime.utc(2025, 12, 1): ["Mood: Happy", "Hours slept: 7", "Meals eaten: Breakfast"],
  DateTime.utc(2025, 12, 2): ["Mood: Anxious", "Hours slept: 5", "Meals eaten: Dinner"],
  DateTime.utc(2025, 12, 3): ["Mood: Happy, Calm", "Hours slept: 7", "Meals eaten: Lunch, Dinner"],
  DateTime.utc(2025, 12, 4): ["Mood: Angry", "Hours slept: 3", "Meals eaten: Lunch, Dinner"],
  //DateTime.now(): ["Mood: ", "Hours slept: ", "Meals eaten: "]
});

final _kEventSource = {
  for (var item in List.generate(25, (index) => index))
    DateTime.utc(kFirstDay.year, 8, item * 5): List.generate(
      item % 4 + 1,
      (index) => ('Event $item | ${index + 1}'),
    ),
}..addAll({
    kToday: [
      "Today's Event 1",
      "Today's Event 2",
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(2025, 1, 1);
final kLastDay = DateTime(2026, 12, 31);
