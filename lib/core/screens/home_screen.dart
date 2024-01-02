import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/widgets/bottom_nav_bar.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int notif = 1;
    return Scaffold(
      appBar: myAppBar(context, notif),
      extendBody: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
              height: context.height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Desiré!",
                    textAlign: TextAlign.start,
                    style: context.headlineMedium,
                  ),
                  Text(
                    "What do you want to order today ?",
                    style: context.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const HomeCard(),
                ],
              ),
            ),
            const Gap(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
              height: context.height * 0.033,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  VerticalDivider(
                    color: context.primary,
                    thickness: 2,
                  ),
                  Text(
                    "Categories",
                    style: context.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
              height: context.height * 0.055,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Gap(context.width * 0.03)
                      : TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: context.primary,
                          ),
                          child: Row(
                            children: [
                              // FaIcon(FontAwesomeIcons.bowlFood, color: Colors.white, size: 15,),
                              const Icon(
                                Icons.room_service_outlined,
                                color: Colors.white,
                              ),
                              const Gap(5),
                              Text(
                                "Fruits",
                                style: context.bodyMedium!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                },
                separatorBuilder: (context, index) => const Gap(10),
                itemCount: 10,
              ),
            ),
            const Gap(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
              height: context.height * 0.033,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  VerticalDivider(
                    color: context.primary,
                    thickness: 2,
                  ),
                  Text(
                    "Customer favorite",
                    style: context.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
              height: context.height * 0.2,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Gap(context.width * 0.03)
                      : Stack(
                          children: [
                            Positioned(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image(
                                  image: const AssetImage(
                                    "assets/foods/food_2.jpeg",
                                  ),
                                  width: context.width * 0.4,
                                  height: context.height * 0.14,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Positioned(
                              top: context.height * 0.1,
                              left: context.width * 0.025,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 2),
                                width: context.width * 0.35,
                                height: context.height * 0.13,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: (index % 3) != 0
                                                  ? context.primary
                                                  : context.tertiary,
                                            ),
                                          ),
                                          child: Container(
                                            width: 50,
                                            // height: 50,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (index % 3) != 0
                                                  ? context.primary
                                                  : context.tertiary,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Product name",
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "2000 XOF",
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                        color: context.primary,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: context.primary,
                                      ),
                                      child: Text(
                                        "Order",
                                        style: context.bodyMedium!.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                },
                separatorBuilder: (context, index) => const Gap(10),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        index: 0,
      ),
    );
  }

  AppBar myAppBar(BuildContext context, int notif) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FaIcon(
            FontAwesomeIcons.locationDot,
            color: context.primary,
            size: 35,
          ),
          RichText(
            text: TextSpan(
              text: "  Homs-Syria",
              style: context.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: " edit?",
                  style: context.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
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
        ),
        Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
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
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      color: Colors.grey.shade200,
      elevation: 5,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: context.height * 0.25,
              width: context.width * 0.6,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(right: context.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.left,
                  children: [
                    Text(
                      "🍀Easy Way to Order Your Food🍀",
                      style: context.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.45,
                      child: Text(
                        "Choosing Healthy & Fresh Food",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: context.bodyLarge!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.55,
                      child: Text(
                        "FoodDeliv is the best app for all your delivery and foods needs",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: context.bodyExtraSmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black87,
                        fixedSize: const Size(100, 15),
                      ),
                      child: Text(
                        "Order Now",
                        style: context.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(),
          ),
          Positioned(
            left: context.width * 0.45,
            top: context.height * 0.05,
            child: Image(
              image: const AssetImage(
                "assets/food_images/menu_food.jpeg",
              ),
              width: context.width * 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
