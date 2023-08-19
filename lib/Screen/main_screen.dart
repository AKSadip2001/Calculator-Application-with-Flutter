import 'package:calculator/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = "0";
  String output = "0";
  num temp = 0;

  double expression_font = 35;
  double output_font = 30;

  void buttonAction(String buttonText) {
    if (buttonText == 'c') {
      expression = "0";
      output = "0";
      expression_font = 35;
      output_font = 30;
    } else if (buttonText == '=') {
      try {
        temp = expression.interpret();
        if (temp.toString() == 'Infinity') {
          output = "Invalid Expression";
        } else {
          if (temp.floor() == temp) {
            temp = temp.floor();
          }
          if (temp != 0) {
            output = "= $temp";
          }
        }
        expression_font = 30;
        output_font = 35;
      } catch (_) {
        output = "Invalid Expression";
      }
    } else if (buttonText == "%") {
      try {
        temp = expression.interpret();
        expression = (temp / 100).toString();
      } catch (_) {
        output = "Invalid Expression";
      }
    } else if (buttonText == "v" || buttonText == "x") {
      // button 'v' and 'x' functionality not added
      return;
    } else {
      if (expression == "0") {
        expression = buttonText;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        if (!expression.endsWith(buttonText)) {
          expression += buttonText;
        }
      } else {
        expression += buttonText;
      }
      expression_font = 35;
      output_font = 30;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(21, 67, 90, 1),
      ),
      body: Center(
        child: Container(
          color: const Color.fromRGBO(21, 67, 90, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                padding: const EdgeInsets.only(
                  right: 25,
                ),
                child: Text(
                  expression,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: expression_font,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 30,
                ),
                padding: const EdgeInsets.only(
                  right: 25,
                ),
                child: Text(
                  output,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: output_font,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CalculatorButton(
                        text: "v",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "c",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "x",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "/",
                        buttonHandler: buttonAction,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(
                        text: "(",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: ")",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "%",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "*",
                        buttonHandler: buttonAction,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(
                        text: "1",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "2",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "3",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "-",
                        buttonHandler: buttonAction,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(
                        text: "4",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "5",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "6",
                        buttonHandler: buttonAction,
                      ),
                      CalculatorButton(
                        text: "+",
                        buttonHandler: buttonAction,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          CalculatorButton(
                            text: "7",
                            buttonHandler: buttonAction,
                          ),
                          CalculatorButton(
                            text: "0",
                            buttonHandler: buttonAction,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CalculatorButton(
                            text: "8",
                            buttonHandler: buttonAction,
                          ),
                          CalculatorButton(
                            text: "00",
                            buttonHandler: buttonAction,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CalculatorButton(
                            text: "9",
                            buttonHandler: buttonAction,
                          ),
                          CalculatorButton(
                            text: ".",
                            buttonHandler: buttonAction,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CalculatorButton(
                            text: "=",
                            buttonHandler: buttonAction,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
