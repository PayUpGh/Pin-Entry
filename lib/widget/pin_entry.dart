import 'package:flutter/material.dart';



class PinEntryWidget extends StatefulWidget {
  const PinEntryWidget(
      {super.key, this.activeColor = Colors.blue, this.onFinishedPin});

  final Color activeColor;
  final Function(int)? onFinishedPin;

  @override
  _PinEntryWidgetState createState() => _PinEntryWidgetState();
}

class _PinEntryWidgetState extends State<PinEntryWidget> {
  String pin = '';

  void _onNumberPressed(int number) {
    setState(() {
      if (pin.length < 4) {
        pin += number.toString();
      }
      if (pin.length == 4 && widget.onFinishedPin != null) {
        // Call the onFinishedPin function if it's not null
        widget.onFinishedPin!(int.parse(pin));
      }
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: pin.length > index
                      ? widget.activeColor // Color when PIN is entered
                      : Colors.grey, // Color when PIN is not entered
                  radius: 10,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildNumberButton(1),
                buildNumberButton(2),
                buildNumberButton(3),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildNumberButton(4),
                buildNumberButton(5),
                buildNumberButton(6),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildNumberButton(7),
                buildNumberButton(8),
                buildNumberButton(9),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: 80.0,
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(''),
                  ),
                ),
                buildNumberButton(0),
                SizedBox(
                  width: 80.0,
                  child: MaterialButton(
                    onPressed: _onDeletePressed,
                    child: const Icon(Icons.backspace),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget buildNumberButton(int number) {
    return SizedBox(
      width: 80.0,
      child: MaterialButton(
        onPressed: () => _onNumberPressed(number),
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
