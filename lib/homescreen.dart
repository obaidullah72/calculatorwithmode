import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userInput = "";
  String result = "0";
  List<String> buttonList = [
    "AC",
    "(",
    ")",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "-",
    "C",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Set background and text color based on dark mode
    Color backgroundColor = widget.isDarkMode ? Colors.black : Colors.white;
    Color textColor = widget.isDarkMode ? Colors.white : Colors.black;
    Color buttonBackground = widget.isDarkMode ? Colors.grey[800]! : Colors.white;
    Color buttonTextColor = widget.isDarkMode ? Colors.white : Colors.black;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: widget.isDarkMode ? Colors.grey[900] : Colors.white,
          title: Text(
            'Calculator',
            style: TextStyle(color: textColor),
          ),
          actions: [
            IconButton(
              icon: Icon(
                widget.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                color: textColor,
              ),
              onPressed: widget.onThemeToggle,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: size.height / 3.2,
              child: resultWidget(textColor),
            ),
            Expanded(child: buttonWidget(buttonBackground, buttonTextColor)),
          ],
        ),
      ),
    );
  }

  Widget resultWidget(Color textColor) {
    return Container(
      color: widget.isDarkMode ? Colors.black : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, bottom: 0, top: 0),
            alignment: Alignment.centerRight,
            child: Text(
              userInput,
              style: TextStyle(
                fontSize: 32,
                color: textColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20, bottom: 10, top: 0),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget(Color buttonBackground, Color buttonTextColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: widget.isDarkMode ? Colors.black : const Color.fromARGB(66, 233, 232, 232),
      child: GridView.builder(
        itemCount: buttonList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return button(buttonList[index], buttonBackground, buttonTextColor);
        },
      ),
    );
  }

  Widget button(String text, Color buttonBackground, Color buttonTextColor) {
    Color textColor = getColor(text, buttonTextColor);
    return InkWell(
      onTap: () {
        setState(() {
          handleButtonPress(text);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: getBGColor(text, buttonBackground),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(String text, Color buttonTextColor) {
    if (text == "/" || text == "*" || text == "+" || text == "-" || text == "C" || text == "(" || text == ")") {
      return Colors.redAccent;
    }
    if (text == "=" || text == "AC") {
      return Colors.white;
    }
    return buttonTextColor;
  }

  Color getBGColor(String text, Color buttonBackground) {
    if (text == "AC") {
      return Colors.redAccent;
    }
    if (text == "=") {
      return const Color.fromARGB(255, 104, 204, 159);
    }
    return buttonBackground;
  }

  void handleButtonPress(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }
    if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
      return;
    }

    if (text == "=") {
      result = calculate();
      userInput = result;
      if (userInput.endsWith(".0")) {
        userInput = userInput.replaceAll(".0", "");
      }
      if (result.endsWith(".0")) {
        result = result.replaceAll(".0", "");
      }
    } else {
      userInput += text;
    }
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      print(e);
      return "Error";
    }
  }
}
