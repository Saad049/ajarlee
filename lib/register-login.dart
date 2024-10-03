import 'package:flutter/material.dart';

class MyRegisterLogin extends StatefulWidget {
  const MyRegisterLogin({super.key});

  @override
  State<MyRegisterLogin> createState() => _MyRegisterLoginState();
}

class _MyRegisterLoginState extends State<MyRegisterLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailPhoneController = TextEditingController();

  bool isEmailSelected = true;
  // This tracks whether Email is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Logo Container with Padding for Space
          Positioned(
            top: 5, // Adjust position as needed
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20), // Adds space around the logo
              child: Container(
                height: 70, // Adjust logo size
                width: 70,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/logo.png', // Your logo image
                    ),
                    fit: BoxFit.contain, // Make the image cover the container
                  ),
                ),
              ),
            ),
          ),
          // White Container for Login Form
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20), // Adjusted the spacing

                      // Toggle Button to select Email or Phone
                      SizedBox(
                        height: 45,
                        width: 200,
                        child: ToggleButtons(
                          isSelected: [isEmailSelected, !isEmailSelected],
                          onPressed: (int index) {
                            setState(() {
                              isEmailSelected = index ==
                                  0; // Update the selection based on the index
                            });
                          },
                          borderRadius: BorderRadius.circular(25),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  decoration: isEmailSelected
                                      ? TextDecoration
                                          .underline // Underline if selected
                                      : TextDecoration
                                          .none, // No underline if not selected
                                ),
                              ),

                              // Button for Email
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Phone',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  decoration: !isEmailSelected
                                      ? TextDecoration
                                          .underline // Underline if selected
                                      : TextDecoration.none,

                                  // No underline if not selected
                                ),
                              ),
                            ), // Button for Phone
                          ],
                        ),
                      ),

                      const SizedBox(
                          height:
                              30), // Space between the ToggleButtons and the text

                      const SizedBox(
                        height: 10,
                      ),

                      // Email/Phone input field
                      TextFormField(
                        controller: _emailPhoneController,
                        decoration: InputDecoration(
                          labelText: isEmailSelected ? 'Email' : 'Phone',
                          prefixIcon: Icon(
                            isEmailSelected ? Icons.email : Icons.phone,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return isEmailSelected
                                ? 'Please enter your email'
                                : 'Please enter your phone number';
                          }
                          if (isEmailSelected &&
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          if (!isEmailSelected &&
                              !RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                      // const SizedBox(height: 20),

                      // Terms and conditions with checkbox and link
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool? value) {
                              // Handle checkbox logic here
                            },
                          ),
                          const Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: 'I agree to understand the ',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'terms',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'conditions',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Register button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle login logic here
                            print('Email/Phone: ${_emailPhoneController.text}');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("__________________ "),
                          Text(
                            "Or Register With",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(" ___________________"),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      // Move the Facebook logo to the start of this row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Place the Facebook logo at the start of the row
                          Container(
                            height: 50,
                            width: 120,
                            // Adjust the size if needed
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 203, 201, 201),
                              borderRadius: BorderRadius.circular(5),
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //     'assets/faceBook.png', // Ensure the path is correct
                              //   ),
                              // ),
                            ),
                            child: Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 203, 201, 201),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.g_mobiledata,
                              color: Colors.white,
                              size: 40,
                            ),

                            // Adjust the size if needed
                            // decoration: const BoxDecoration(
                            //   image: DecorationImage(
                            //     image: AssetImage(
                            //       'assets/google.png', // Ensure the path is correct
                            //     ),
                            //   ),
                            // ),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 203, 201, 201),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.apple,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account?"),
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
