import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  String text;
  VoidCallback voidCallback;
  customButton({super.key, required this.text, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[800]),
        onPressed: () {
          voidCallback();
        },
        child: Text(text),
      ),
    );
  }
}

class iconBtn extends StatelessWidget {
  VoidCallback voidCallback;
  var icon;
  String text;
  iconBtn({
    super.key,
    required this.voidCallback,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,

      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[800]),
        onPressed: () {
          voidCallback();
        },
        label: Text(text),
        icon: icon,
      ),
    );
  }
}
