import 'package:flutter/material.dart';
import 'package:food_app/features/auth/widgets/back_button.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(
                "assets/forgot_password_assets/reset_password.gif",
              ),
              width: context.width * 0.8,
            ),
            SizedBox(
              height: context.height * 0.05,
              width: context.width * 0.9,
              child: Text(
                "Reset your password",
                textAlign: TextAlign.center,
                style:
                    context.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _formKey,
              child: SizedBox(
                height: context.height * 0.23,
                width: context.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          vertical: 10,
                        ),
                        prefixIcon: Icon(
                          Icons.key_outlined,
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        prefixIcon: Icon(
                          Icons.key_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                        prefixStyle: TextStyle(),
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
                            // context.push("/home");
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
