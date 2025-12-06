import 'package:flutter/material.dart';
import 'package:snugg_log/widgets/custom_button.dart';
import 'package:snugg_log/widgets/custom_textbox.dart';

class LogNutritionPage extends StatefulWidget {
  const LogNutritionPage({super.key});

  @override
  State<LogNutritionPage> createState() => _LogNutritionPageState();
}

class _LogNutritionPageState extends State<LogNutritionPage> {
  List<bool> _isSelected = [false, false, false];

  void _showDialog() {
    showDialog(context: context, builder:(context) {
      return AlertDialog(
        title: Text("Nutrition Logged"),
        content: Text("Today's nutrition has been successfully logged!"),
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
          "Log Nutrition",
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
                SizedBox(height: 50),
                CustomTextbox(
                  text: "What did you eat today?",
                  width: 372,
                  height: 52,
                  textStyle: TextStyle(
                    color: Color.fromARGB(255, 54, 37, 17),
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onPressed: () {
                          setState(() {
                            _isSelected[0] = !_isSelected[0];
                          });
                        },
                      imgString: ((_isSelected[0] == false) ? "assets/button icons/breakfast_icon.png" : "assets/button icons/breakfast_icon_selected.png"),
                    ),
                    CustomButton(
                      onPressed: () {
                          setState(() {
                            _isSelected[1] = !_isSelected[1];
                          });
                        },
                      imgString: ((_isSelected[1] == false) ? "assets/button icons/lunch_icon.png" : "assets/button icons/lunch_icon_selected.png"),
                    ),
                    CustomButton(
                      onPressed: () {
                          setState(() {
                            _isSelected[2] = !_isSelected[2];
                          });
                        },
                      imgString: ((_isSelected[2] == false) ? "assets/button icons/dinner_icon.png" : "assets/button icons/dinner_icon_selected.png"),
                    ),
                  ],
                ),
                SizedBox(height: 140),
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
        )
      )
    );
  }
}