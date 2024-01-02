import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/features/auth/widgets/back_button.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _firstCodeController = TextEditingController();
  final TextEditingController _secondCodeController = TextEditingController();
  final TextEditingController _thirdCodeController = TextEditingController();
  final TextEditingController _fourthCodeController = TextEditingController();
  final String email = "user@gmail.com";

  void _validateForm() {
    _formKey.currentState!.validate();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstCodeController.dispose();
    _secondCodeController.dispose();
    _thirdCodeController.dispose();
    _fourthCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(
                "assets/forgot_password_assets/check_email.gif",
              ),
              width: context.width * 0.8,
            ),
            SizedBox(
              height: context.height * 0.13,
              width: context.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Verify your email",
                    style: context.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: context.width * 0.9,
                    alignment: Alignment.center,
                    child: Text(
                      "Please enter the 4 digit code sent to $email edit?",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: context.bodyLarge!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: SizedBox(
                height: context.height * 0.13,
                width: context.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: TextFormField(
                            controller: _firstCodeController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1) {},
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return null;
                            },
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.send,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // hintText: "0",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          child: TextFormField(
                            controller: _secondCodeController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin2) {},
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              return null;
                            },
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.send,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // hintText: "0",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          child: TextFormField(
                            controller: _thirdCodeController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin3) {},
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              return null;
                            },
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.send,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // hintText: "0",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          child: TextFormField(
                            controller: _fourthCodeController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin4) {},
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              return null;
                            },
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.send,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // hintText: "0",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "don't have email ?   ",
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "resent",
                            recognizer: TapGestureRecognizer()..onTap = () {},
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
              height: context.height * 0.15,
              width: context.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _validateForm();
                      context.push("/reset_password");
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
                      "Next",
                      style: context.titleLarge!.copyWith(
                        color: context.surface,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  const CustomBackButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
