import 'package:flutter/material.dart';
import 'package:food_app/features/auth/widgets/back_button.dart';
import 'package:food_app/features/auth/widgets/enums.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class GetEmailScreen extends StatefulWidget {
  const GetEmailScreen({super.key});

  @override
  State<GetEmailScreen> createState() => _GetEmailScreenState();
}

class _GetEmailScreenState extends State<GetEmailScreen> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  GetPasswordWith getWith = GetPasswordWith.email;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
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
                "assets/forgot_password_assets/forgot_password.gif",
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
                    "Do you forget your password ?",
                    style: context.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: context.width * 0.9,
                    alignment: Alignment.center,
                    child: Text(
                      "Enter your email or your phone nulber to send you a message",
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
                    getWith == GetPasswordWith.email
                        ? TextFormField(
                            controller: _emailController,
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
                                vertical: 10,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 30,
                                color: Colors.grey,
                              ),
                              prefixStyle: TextStyle(),
                              hintText: "Email",
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
                          )
                        : TextFormField(
                            controller: _phoneNumberController,
                            validator: (value) {
                              return null;
                            },
                            textAlign: TextAlign.start,
                            textInputAction: TextInputAction.send,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              prefixIcon: Icon(
                                Icons.phone_outlined,
                                size: 30,
                                color: Colors.grey,
                              ),
                              prefixStyle: TextStyle(),
                              hintText: "Phone Number",
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getWith == GetPasswordWith.email
                              ? "don't have email ?"
                              : "Don't have phone number ?",
                          style: context.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            if (getWith == GetPasswordWith.email) {
                              setState(() {
                                getWith = GetPasswordWith.phoneNumber;
                              });
                            } else {
                              setState(() {
                                getWith = GetPasswordWith.email;
                              });
                            }
                          },
                          child: Text(
                            getWith == GetPasswordWith.email
                                ? "phone number"
                                : "email",
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
                      context.push("/verify_email");
                      // _validateForm();
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
