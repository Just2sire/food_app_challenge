import 'package:flutter/material.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:go_router/go_router.dart';

class SignUpOrLogin extends StatelessWidget {
  const SignUpOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffFBFFF9),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/signup_login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: context.height * 0.55,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              height: context.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Text(
                      "Ready to take your next step ?",
                      maxLines: 2,
                      style: context.headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push("/login");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.primary,
                      fixedSize: Size(
                        (context.width * 0.6),
                        (context.height * 0.08),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          13,
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
                  ElevatedButton(
                    onPressed: () {
                      context.push("/register");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFBFFF9),
                      side: BorderSide(color: context.primary),
                      fixedSize: Size(
                        (context.width * 0.6),
                        (context.height * 0.08),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          32,
                        ),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: context.titleLarge!.copyWith(
                        color: context.primary,
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
