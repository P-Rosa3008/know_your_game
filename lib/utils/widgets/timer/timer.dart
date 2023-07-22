import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:know_your_game/utils/widgets/widgets.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      child: Align(
        alignment: FractionalOffset.topCenter,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? child) {
                    return CustomPaint(
                      painter: TimerPainter(
                        animation: controller,
                        backgroundColor: Colors.blue,
                        color: Colors.blueAccent,
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: FractionalOffset.center,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? child) {
                    return Text(
                      '10:00',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
