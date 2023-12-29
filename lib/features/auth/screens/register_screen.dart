import 'package:flutter/material.dart';
import 'package:food_app/features/auth/widgets/register_enum.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../widgets/register_user_info.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  RegisterSection _section = RegisterSection.userInfo;
  bool checkboxValue = false;
  void setCheckboxValue(bool value) {
    setState(() {
      checkboxValue = value;
    });
  }
  void _validateForm() {
    _formKey.currentState!.validate();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _dateController.dispose();
    _sexController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
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
                              _section = RegisterSection.userInfo;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff363C32),
                                width: 3,
                              ),
                              color: _section == RegisterSection.userInfo
                                  ? const Color(0xff363C32)
                                  : Colors.white,
                            ),
                            child: Icon(
                              Icons.person_outline_outlined,
                              size: 37,
                              color: _section == RegisterSection.userInfo
                                  ? Colors.white
                                  : const Color(0xff363C32),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _section = RegisterSection.userPassword;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xff363C32), width: 3),
                              color: _section == RegisterSection.userPassword
                                  ? const Color(0xff363C32)
                                  : Colors.white,
                            ),
                            child: Icon(
                              Icons.lock_open_outlined,
                              size: 37,
                              color: _section == RegisterSection.userPassword
                                  ? Colors.white
                                  : const Color(0xff363C32),
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
                height: context.height * 0.43,
                child: ListView(
                  children: [
                    RegisterUserInfo(
                      section: _section,
                      usernameController: _usernameController,
                      dateController: _dateController,
                      sexController: _sexController,
                      phoneController: _phoneController,
                      emailController: _emailController,
                    ),
                    Visibility(
                      visible:
                          _section == RegisterSection.userInfo ? false : true,
                      child: SizedBox(
                        height: context.height * 0.26,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                  Icons.person_outline_outlined,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                prefixStyle: TextStyle(),
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
                            TextFormField(
                              controller: _confirmPasswordController,
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
                                hintText: "Confirm Password",
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: checkboxValue,
                                  onChanged: (value) {
                                    setState(() {
                                      checkboxValue = value!;
                                    });
                                  },
                                ),
                                const Gap(7),
                                GestureDetector(
                                  onTap: () {
                                    // context.go("/register");
                                  },
                                  child: Text(
                                    "Remenber me",
                                    style: context.bodyMedium!.copyWith(
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
                      if (_section == RegisterSection.userInfo) {
                        setState(() {
                          _section = RegisterSection.userPassword;
                        });
                      } else {
                        _validateForm();
                      }
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
                      _section == RegisterSection.userInfo ? "Next" : "Login",
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
                        "Already have an account ?",
                        style: context.bodyMedium,
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () {
                          context.go("/login");
                        },
                        child: Text(
                          "Login",
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