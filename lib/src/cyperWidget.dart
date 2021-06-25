import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

/// It's not perfect at all.
class CyberPunk extends StatefulWidget {
  final Widget child;

  /// The max duration of gradually showing/hiding animition;
  /// Since there is two processes of showing and hiding, so the entire animition duration
  /// will be double.
  final int dur;

  /// Count of each 'cyper' animation piece in a single animition circle.
  /// default 10.
  final int cyberItemCount;

  /// Height of each 'cyper' animation piece.
  /// default 10.
  final double cyberItemHeight;

  /// Max height of animation zone.if not set or 0, it will be the value of `size.height` (The widght height).
  final double maxHeight;

  /// Animation repeat times.
  /// default 1.
  final int repeatTimes;

  /// If set to true, animition won't stop and `repeatTimes` won't work.
  final bool infinite;

  CyberPunk(
      {this.child,
<<<<<<< HEAD
      this.dur,
      this.maxHeight,
=======
      this.maxHeight,
      this.dur = 500,
>>>>>>> 5fbc7fd (Project finished first version and to publish.)
      this.cyberItemCount = 10,
      this.cyberItemHeight = 10,
      this.repeatTimes = 1,
      this.infinite = false});
  @override
  CyberPunkState createState() => CyberPunkState(
      repeatTimes: repeatTimes,
      cyberItem: ClipChild(
        child: child,
        pieceHeight: cyberItemHeight,
        maxHeight: maxHeight,
      ));
}

class CyberPunkState extends State<CyberPunk> {
  Random random;
  Widget cyberItem;
  int repeatTimes;

  CyberPunkState({this.cyberItem, this.repeatTimes});

  void setRepeat() {
    this.repeatTimes--;
    if (this.repeatTimes > 0 || widget.infinite) {
      Future.delayed(Duration(milliseconds: widget.dur * 2)).then((_) {
        this.setRepeat();
        this.setState(() {});
      });
    }
  }

  @override
  initState() {
    super.initState();
    this.random = new Random();
    this.setRepeat();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final List<Widget> cyberList = [];
      final width = constraints.maxWidth;
      for (var i = 0; i < widget.cyberItemCount; i++) {
        final left = this.random.nextDouble() * width - width / 2;
        final durantion = this.random.nextDouble() * widget.dur;
        cyberList.add(Positioned(
            key: Key(left.toString()),
            left: left,
            child: OpacityTransition(
                duration: Duration(milliseconds: durantion.floor()),
                child: cyberItem)));
      }
      return Stack(
        children: [widget.child, ...cyberList],
      );
    });
  }
}

class ClipChild extends StatelessWidget {
  final double pieceHeight;
  final double maxHeight;
  final Widget child;
  ClipChild({Key key, this.pieceHeight, this.child, this.maxHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: child,
      clipper: RandomRectPath(pieceHeight, maxHeight: this.maxHeight),
    );
  }
}

class RandomRectPath extends CustomClipper<Path> {
  final double pieceHeight;
  final double maxHeight;
  final Random random = new Random();

  RandomRectPath(this.pieceHeight, {this.maxHeight = 0});

  @override
  Path getClip(Size size) {
    var height = checkMaxHeight() ? this.maxHeight : size.height;
    var top = random.nextDouble() * height;
    var path = Path();
    path.moveTo(0, top);
    path.lineTo(size.width, top);
    path.lineTo(size.width, top + this.pieceHeight);
    path.lineTo(0, top + this.pieceHeight);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

  bool checkMaxHeight() {
    if (this.maxHeight != null && this.maxHeight > 0) {
      return true;
    }
    return false;
  }
}

class OpacityTransition extends StatefulWidget {
  final Duration duration;
  final Widget child;

  OpacityTransition({this.duration, this.child});

  @override
  OpacityTransitionState createState() => OpacityTransitionState();
}

class OpacityTransitionState extends State<OpacityTransition> {
  double opacity = 0;
  OpacityTransitionState();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((_) {
      setState(() {
        this.opacity = 1;
      });
    });
    Future.delayed(widget.duration).then((_) {
      if (mounted == true) {
        setState(() {
          this.opacity = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: this.opacity,
      duration: widget.duration,
      child: widget.child,
      curve: Curves.easeInOut,
    );
  }
}
