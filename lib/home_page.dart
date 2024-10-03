import 'package:flutter/material.dart';
import 'package:flutter_application_2/register-login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSignUp = true;
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/background.png',
                ),

                fit: BoxFit.cover,
                opacity: 0.5,

                // Make the image cover the entire screen
              ),
            ),
          ),
          // Adding SingleChildScrollView to prevent overflow
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red,
                      child: Text(
                        "M",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    // Toggle Buttons
                    ToggleButtons(
                      borderColor: Colors.blue,
                      fillColor: Colors.yellow,
                      selectedBorderColor: Colors.yellow,
                      selectedColor: Colors.white,
                      borderRadius: BorderRadius.circular(
                          25), // General border radius for all buttons
                      isSelected: isSelected,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        });
                      },
                      children: const <Widget>[
                        // English Button with Right Top Circular Corner
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                25), // Right top circular corner
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'English',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        // Arabic Button (default appearance)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23),
                          child: Text(
                            'عربي',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ), // Arabic text for "Arabic"
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Logo Container
                    Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/logo.png', // Your logo image
                          ),
                          fit: BoxFit
                              .contain, // Make the image cover the container
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description Text
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Rent your car in a few clicks and enjoy\n your trip",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Signup Button
                    // This variable keeps track of the current page (sign up or login)

                    SizedBox(
                      width: 250,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isSignUp =
                                true; // When this button is clicked, set the state to "sign up"
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyRegisterLogin()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isSignUp ? Colors.yellow : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                              color: isSignUp ? Colors.yellow : Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

// Login Button
                    SizedBox(
                      width: 250,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isSignUp =
                                false; // When this button is clicked, set the state to "login"
                          });
                          // Add your login logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              !isSignUp ? Colors.yellow : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                              color: !isSignUp ? Colors.yellow : Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Skip Button
                    TextButton(
                      onPressed: () {
                        // Add skip logic here
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
