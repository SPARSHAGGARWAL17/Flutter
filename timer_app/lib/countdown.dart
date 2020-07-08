import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:circular_countdown/circular_countdown.dart';

class Count extends StatelessWidget {
  final second;
  Count(this.second);
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: second,
      build: (context, double time) => Text(time.toString()),
      interval: Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}

class Count2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TimeCircularCountdown(
      countdownCurrentColor: Colors.yellow,
      unit: CountdownUnit.second,
      countdownTotal: 25,
      onUpdated: (unit, remainingTime) => print('Updated'),
      onFinished: () => print('Countdown finished'),
    );
  }
}
