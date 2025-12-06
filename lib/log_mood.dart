import 'package:flutter/material.dart';
import 'package:snugg_log/widgets/custom_button.dart';
import 'package:snugg_log/widgets/custom_textbox.dart';

class LogMoodPage extends StatefulWidget {
  const LogMoodPage({super.key});

  @override
  State<LogMoodPage> createState() => _LogMoodPageState();
}

class _LogMoodPageState extends State<LogMoodPage> {

  List<bool> _isSelected = [false, false, false, false, false, false];

  void _showDialog() {
    showDialog(context: context, builder:(context) {
      return AlertDialog(
        title: Text("Mood Logged"),
        content: Text("Today's mood has been successfully logged!"),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, "main");
            },
            child: Text("OK")
            )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 43, 23),
        leading: Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 30, color: Colors.white,)
            ),
            SizedBox(width: 5),
            Image.asset("assets/snugg_log_logo.png"),
          ],
        ),
        leadingWidth: 110,
        centerTitle: true,
        title: Text(
          "Log Mood",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextbox(
                  text: "How are you feeling today?",
                  width: 372,
                  height: 52,
                  textStyle: TextStyle(
                    color: Color.fromARGB(255, 54, 37, 17),
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: 110,
                      height: 110,
                      onPressed: () {
                        setState(() {
                          _isSelected[0] = !_isSelected[0];
                        });
                      },
                      imgString: ((_isSelected[0] == false) ? "assets/button icons/loved_bear.png" : "assets/button icons/loved_bear_selected.png"),
                    ),
                    CustomButton(
                      width: 110,
                      height: 110,
                      onPressed: () {
                        setState(() {
                          _isSelected[1] = !_isSelected[1];
                        });
                      },
                      imgString: ((_isSelected[1] == false) ? "assets/button icons/sad_bear.png" : "assets/button icons/sad_bear_selected.png"),
                    ),
                    CustomButton(
                      width: 110,
                      height: 110,
                      onPressed: () {
                        setState(() {
                          _isSelected[2] = !_isSelected[2];
                        });
                      },
                      imgString: ((_isSelected[2] == false) ? "assets/button icons/angry_bear.png" : "assets/button icons/angry_bear_selected.png"),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: 110,
                      height: 110,
                      onPressed: () {
                        setState(() {
                          _isSelected[3] = !_isSelected[3];
                        });
                      },
                      imgString: ((_isSelected[3] == false) ? "assets/button icons/anxious_bear.png" : "assets/button icons/anxious_bear_selected.png"),
                    ),
                    CustomButton(
                      width: 110,
                      height: 110,
                      onPressed: () {
                        setState(() {
                          _isSelected[4] = !_isSelected[4];
                        });
                      },
                      imgString: ((_isSelected[4] == false) ? "assets/button icons/calm_bear.png" : "assets/button icons/calm_bear_selected.png"),
                    ),
                    CustomButton(
                      width: 110,
                      height: 110,
                      onPressed: () {
                        setState(() {
                          _isSelected[5] = !_isSelected[5];
                        });
                      },
                      imgString: ((_isSelected[5] == false) ? "assets/button icons/shocked_bear.png" : "assets/button icons/shocked_bear_selected.png"),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 380,
                  child: TextField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Additional notes",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade900)
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(100, 200, 200, 200)
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _showDialog(),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Color.fromARGB(255, 54, 37, 17)),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}