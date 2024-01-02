import 'package:flutter/material.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      style: const ButtonStyle(),
      child: Text(
        "Back",
        style: context.titleLarge!.copyWith(
          color: Colors.grey,
          decoration: TextDecoration.underline,
          decorationColor: Colors.grey,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    );
  }
}
