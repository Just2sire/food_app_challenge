import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/bottom_nav_bar.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';

class SearchPrincipalScreen extends StatelessWidget {
  const SearchPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int notif = 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              textAlign: TextAlign.left,
              style: context.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: "for your  ",
                style: context.bodyLarge,
                children: [
                  TextSpan(
                    text: "favourite meal",
                    style: context.bodyLarge!.copyWith(
                      color: context.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(3)
          ],
        ),
        actions: [
          Stack(
            children: [
              Positioned(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                  // icon: const FaIcon(
                  //   FontAwesomeIcons.cartShopping,
                  // ),
                ),
              ),
              Positioned(
                top: context.height * 0.03,
                child: Container(
                  height: 17,
                  width: 17,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.tertiary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    notif.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
        // bottom: ,
      ),
      extendBody: true,
      body: const SingleChildScrollView(),
      bottomNavigationBar: const BottomNavBar(index: 3,),
    );
  }
}
