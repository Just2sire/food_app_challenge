import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/data/page_view_data.dart';
// import 'package:food_app/core/providers/first_use_provider.dart';
import 'package:food_app/core/services/storage.dart';
import 'package:food_app/core/widgets/page_view_step.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentPage = 0;
  final PageController pageViewController = PageController(initialPage: 0);

  SharedPreferences? data = Storage.storageData;

  void firstConnection() {
    // bool firstTime = context.read<FirstUserProvider>().firstConnection;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffFBFFF9),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blob.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              width: context.width,
              height: context.height * 0.9,
              child: PageView(
                controller: pageViewController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: List.generate(
                  pageViewData.length,
                  (index) {
                    final data = pageViewData[index];
                    return PageViewStep(
                      image: data.image,
                      step: data.step,
                      title: data.title,
                      description: data.description,
                    );
                  },
                ),
              ),
            ),
          ),
          IntroScreenSwitch(
            controller: pageViewController,
            page: currentPage,
          )
        ],
      ),
    );
  }
}

class IntroScreenSwitch extends StatelessWidget {
  const IntroScreenSwitch({
    super.key,
    required this.controller,
    required this.page,
  });

  final PageController controller;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      // color: context.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              controller.animateToPage(
                page - 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            },
            child: page == 0
                ? TextButton(
                    onPressed: () {
                      context.go("/signup_or_login");
                    },
                    child: Text(
                      "Skip",
                      style: context.bodyLarge,
                    ),
                  )
                : Container(
                    width: context.width * 0.13,
                    height: context.width * 0.13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: context.surface,
                    ),
                  ),
          ),
          DotsIndicator(
            dotsCount: pageViewData.length,
            position: page + 0.0,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.animateToPage(
                page + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            },
            child: page == 2
                ? TextButton(
                    onPressed: () {
                      context.go("/signup_or_login");
                    },
                    child: Text(
                      "Finish",
                      style: context.bodyLarge,
                    ),
                  )
                : Container(
                    width: context.width * 0.13,
                    height: context.width * 0.13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: context.surface,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
