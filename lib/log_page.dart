import 'package:flutter/material.dart';
import 'package:snugg_log/log_mood.dart';
import 'package:snugg_log/log_nutrition.dart';
import 'package:snugg_log/log_sleep.dart';
import 'package:snugg_log/widgets/custom_button.dart';
import 'package:snugg_log/widgets/custom_textbox.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 43, 23),
        leading: Image.asset("assets/snugg_log_logo.png"),
        leadingWidth: 80,
        titleSpacing: 5,
        title: Text(
          "Log",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )
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
          child: Column(
            children: [
              SizedBox(height: 50),
              CustomTextbox(
                text: "What would you like to log today?",
                width: 372,
                height: 52,
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 54, 37, 17),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed: () {
                      pushScreenWithNavBar(context, LogMoodPage());
                    },
                    text: "Mood",
                    imgString: "assets/button icons/happy_bear.png",
                    imgScale: 1.08,
                    width: 150,
                    height: 150,
                  ),
                  CustomButton(
                    onPressed: () {
                      pushScreenWithNavBar(context, LogSleepPage());
                    },
                    text: "Sleep",
                    imgString: "assets/button icons/sleepy_bear.png",
                    imgScale: 1.08,
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
              SizedBox(height: 80),
              CustomButton(
                onPressed: () {
                  pushScreenWithNavBar(context, LogNutritionPage());
                },
                text: "Nutrition",
                imgString: "assets/button icons/nutrition_bear.png",
                imgScale: 1.08,
                width: 150,
                height: 150,
              ),
            ],
          ),
        )
      )
    );
  }
}