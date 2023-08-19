import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key, required this.text, required this.buttonHandler});

  final String text;
  final Function buttonHandler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width) / 4,
      height: text == '='
          ? (MediaQuery.of(context).size.width) / 3
          : (MediaQuery.of(context).size.width) / 6,
      child: TextButton(
        onPressed: () => buttonHandler(text),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  0,
                ),
              ),
            ),
          ),
          backgroundColor: text != "="
              ? MaterialStateProperty.all(
                  const Color.fromRGBO(29, 92, 124, 1),
                )
              : MaterialStateProperty.all(
                  const Color.fromRGBO(86, 167, 197, 1),
                ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
