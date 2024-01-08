import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/widgets/bottom_nav_bar.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Message",
          style: context.titleLarge,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 30,
              color: Colors.grey,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 10),
          //   child: const Icon(
          //     Icons.search,
          //     color: Colors.grey,
          //     size: 40,
          //   ),
          // )
        ],
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.2,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.05,
                    ),
                    child: Text(
                      "Contact",
                      style: context.bodyLarge!.copyWith(),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: context.height * 0.07,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CircularStepProgressIndicator(
                          totalSteps: 10,
                          currentStep: 6,
                          width: context.height * 0.07,
                          height: 30,
                          roundedCap: (_, isSelected) => isSelected,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(30);
                      },
                      itemCount: 15,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        index: 1,
      ),
    );
  }
}
