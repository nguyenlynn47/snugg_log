import 'package:flutter/material.dart';
import 'package:snugg_log/widgets/custom_textbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 43, 23),
        leading: Image.asset("assets/snugg_log_logo.png"),
        leadingWidth: 80,
        titleSpacing: 5,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        //centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.70,
            image: AssetImage("assets/background_1.png"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 65),
              CustomTextbox(
                text: "Welcome back, [USER]!",
                width: 300,
                height: 122,
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 54, 37, 17),
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  CustomTextbox(
                    text: "Current Streak:",
                    width: 144,
                    height: 122,
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 54, 37, 17),
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    width: 144,
                    height: 122,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(240, 217, 217, 217),
                      border: Border.all(
                        width: 1.5, 
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade700,
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(4, 4)
                        )
                      ]
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "6",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 80, 0),
                              fontSize: 45,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "Days",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 80, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              Text(
                "Quote of the Day",
                style: TextStyle(
                  color: Color.fromARGB(255, 99, 65, 23),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextbox(
                text: '"Believe in your infinite potential. Your only limitations are those you set upon yourself." — Roy T. Bennett',
                width: 348,
                height: 180,
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 54, 37, 17),
                  fontSize: 20,
                  fontStyle: FontStyle.italic
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}