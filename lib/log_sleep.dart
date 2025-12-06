import 'package:flutter/material.dart';
import 'package:snugg_log/widgets/custom_textbox.dart';

class LogSleepPage extends StatefulWidget {
  const LogSleepPage({super.key});

  @override
  State<LogSleepPage> createState() => _LogSleepPageState();
}

class _LogSleepPageState extends State<LogSleepPage> {
  double _hoursSlept = 0;

  void _showDialog() {
    showDialog(context: context, builder:(context) {
      return AlertDialog(
        title: Text("Sleep Logged"),
        content: Text("Today's sleep has been successfully logged!"),
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
          "Log Sleep",
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
                  text: "How did you sleep last night?",
                  width: 372,
                  height: 52,
                  textStyle: TextStyle(
                    color: Color.fromARGB(255, 54, 37, 17),
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 150),
                Text(
                  "Hours Slept: $_hoursSlept",
                  style: TextStyle(color: Color.fromARGB(255, 54, 37, 17), fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Slider(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  value: _hoursSlept,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: Color.fromARGB(255, 90, 61, 28),
                  inactiveColor: Colors.grey,
                  thumbColor: Color.fromARGB(255, 0, 102, 0),
                  onChanged: (value){
                    setState(() {
                      _hoursSlept = value;
                    });
                  },
                ),
                SizedBox(height: 130),
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