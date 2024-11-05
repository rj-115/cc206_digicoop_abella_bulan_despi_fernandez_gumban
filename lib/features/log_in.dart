import 'package:flutter/material.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  bool hidePass1 = true;
  bool hidePass2 = true;

  TextEditingController usernameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController idField = TextEditingController();
  TextEditingController password1Field = TextEditingController();
  TextEditingController password2Field = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Image(
                    image: AssetImage('assets/MAIN_LOGO.png'),
                    height: 200,
                    width: 200,
                  ),
                ),
                const Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0A0170),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: idField,
                    decoration: const InputDecoration(
                      labelText: 'WVSU ID',
                      hintText: 'Example: 2022M0000',
                      labelStyle: TextStyle(fontSize: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    maxLength: 9,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID';
                      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                        return 'Special characters are not allowed';
                      } else if (value.length < 9) {
                        return 'ID must be 9 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: password1Field,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: const TextStyle(fontSize: 10.0),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          suffixIcon: IconButton(
                            icon: Icon(hidePass1
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined),
                            onPressed: () {
                              setState(() {
                                hidePass1 = !hidePass1;
                              });
                            },
                          ),
                        ),
                        obscureText: hidePass1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A0170),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.green),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Success',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              content: const Text(
                                'You have logged in successfully!',
                                style: TextStyle(fontSize: 14),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0A0170),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('CONTINUE'),
                                  Navigator.pushNamed(context, 'signUp');
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  const Icon(Icons.warning, color: Colors.red),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Errors Found',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              content: const Text(
                                'One of the required fields is empty or contains invalid data. Please check your input.',
                                style: TextStyle(fontSize: 14),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0A0170),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OKAY'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Log In'),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account yet?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, 'logIn');
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Color(0xFF0A0170),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}