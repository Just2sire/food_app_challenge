import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/features/auth/widgets/line_widget.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateForm() {
    _formKey.currentState!.validate();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back !",
                      style: context.headlineMedium,
                    ),
                    Text(
                      "Login to your account",
                      style: context.bodyLarge,
                    )
                  ],
                ),
              ),
              SizedBox(
                // height: context.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: context.surface,
                            child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Color(0xff55acee),
                                size: 35,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: context.surface,
                            child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Color(0xffcd468b),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: context.surface,
                            child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Color(0xff55acee),
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LineWidget(
                            width: context.width * 0.3,
                          ),
                          Text(
                            "or",
                            style: context.bodyLarge,
                          ),
                          LineWidget(
                            width: context.width * 0.3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  height: context.height * 0.23,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return null;
                        },
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          prefixStyle: TextStyle(),
                          hintText: "Username",
                          hintStyle: TextStyle(
                            height: 2,
                            color: Color(0xffDDDADA),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return null;
                        },
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.send,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.key_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            height: 2,
                            color: Color(0xffDDDADA),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Forgot password?",
                          style: context.bodyMedium,
                          children: [
                            TextSpan(
                              text: "Click here",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push("/forgot_password_get_email");
                                },
                              style: context.bodyMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey,
                                decorationStyle: TextDecorationStyle.solid,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.11,
                width: context.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _validateForm();
                        context.push("/home");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.primary,
                        fixedSize: Size(
                          (context.width * 0.8),
                          (context.height * 0.08),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: context.titleLarge!.copyWith(
                          color: context.surface,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "Don't have an account ?",
                        style: context.bodyMedium,
                        children: [
                          TextSpan(
                            text: "Register",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push("/register");
                              },
                            style: context.bodyMedium!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey,
                              decorationStyle: TextDecorationStyle.solid,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
