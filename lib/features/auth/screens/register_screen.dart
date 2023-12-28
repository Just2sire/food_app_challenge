import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/features/auth/widgets/register_enum.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegisterSection _section = RegisterSection.userInfo;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.height * 0.13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome !",
                    style: context.headlineMedium,
                  ),
                  Container(
                    width: context.width * 0.7,
                    alignment: Alignment.center,
                    child: Text(
                      "Enter your information to get access to all of the features",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: context.bodyMedium!.copyWith(),
                    ),
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _section = RegisterSection.userPassword;
                            });
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                _section == RegisterSection.userInfo
                                    ? const Color(0xff363C32)
                                    : Colors.white,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _section = RegisterSection.userPassword;
                                });
                              },
                              icon: Icon(
                                Icons.lock_open_outlined,
                                size: 37,
                                color: _section == RegisterSection.userInfo
                                    ? Colors.white
                                    : const Color(0xff363C32),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _section = RegisterSection.userInfo;
                            });
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff363C32),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _section = RegisterSection.userInfo;
                                });
                              },
                              icon: const Icon(
                                Icons.person_outline_outlined,
                                size: 37,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
                height: context.height * 0.24,
                child: ListView(
                  children: [
                    Visibility(
                      visible:
                          _section == RegisterSection.userInfo ? true : false,
                      child: SizedBox(
                        height: context.height * 0.23,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                              controller: _usernameController,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: TextFormField(
                                    controller: _passwordController,
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
                                        Icons.calendar_month_outlined,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Date",
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
                                ),
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: TextFormField(
                                    controller: _passwordController,
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
                                        Icons.male_outlined,
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
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Forgot password?",
                                  style: context.bodyMedium,
                                ),
                                const Gap(10),
                                GestureDetector(
                                  onTap: () {
                                    // context.go("/register");
                                  },
                                  child: Text(
                                    "Click here",
                                    style: context.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.grey,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: SizedBox(
                        height: context.height * 0.23,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                              controller: _usernameController,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Forgot password?",
                                  style: context.bodyMedium,
                                ),
                                const Gap(10),
                                GestureDetector(
                                  onTap: () {
                                    // context.go("/register");
                                  },
                                  child: Text(
                                    "Click here",
                                    style: context.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.grey,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
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
                      // context.go("/login");
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: context.bodyMedium,
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () {
                          context.go("/register");
                        },
                        child: Text(
                          "Register",
                          style: context.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationStyle: TextDecorationStyle.solid,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
