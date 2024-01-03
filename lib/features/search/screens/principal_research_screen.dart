import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/data/foods_data.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:food_app/core/widgets/bottom_nav_bar.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';

class SearchPrincipalScreen extends StatefulWidget {
  const SearchPrincipalScreen({super.key});

  @override
  State<SearchPrincipalScreen> createState() => _SearchPrincipalScreenState();
}

class _SearchPrincipalScreenState extends State<SearchPrincipalScreen> {
  TextEditingController searchController = TextEditingController();
  late final GlobalKey<ScaffoldState> key;

  @override
  void initState() {
    key = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int notif = 1;
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ],
          ),
        ],
        // bottom: Text("data"),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width * 0.8,
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          // vertical: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                        prefixStyle: TextStyle(),
                        hintText: "Search...",
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
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: context.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container();
                        },
                      );
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                    ),
                  ),
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
                    "Most popular searches",
                    style: context.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
              height: context.height * 0.23,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Food food = foods[index];
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
                                  image: AssetImage(
                                    "assets/foods/${food.picture}",
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
                                  vertical: 4,
                                  horizontal: 2,
                                ),
                                width: context.width * 0.35,
                                height: context.height * 0.13,
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: const BorderRadius.all(
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
                                              color: food.disponible
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
                                              color: food.disponible
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
                                      food.name,
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${food.price} XOF",
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                        color: context.primary,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 23,
                                        width: context.width * 0.15,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: context.primary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          "Order",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
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
                itemCount: foods.length,
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
                    "Add Recently",
                    style: context.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
              height: context.height * 0.23,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Food food = foods[index];
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
                                  image: AssetImage(
                                    "assets/foods/${food.picture}",
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
                                  vertical: 4,
                                  horizontal: 2,
                                ),
                                width: context.width * 0.35,
                                height: context.height * 0.13,
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: const BorderRadius.all(
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
                                              color: food.disponible
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
                                              color: food.disponible
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
                                      food.name,
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${food.price} XOF",
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                        color: context.primary,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 23,
                                        width: context.width * 0.15,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: context.primary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          "Order",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
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
                itemCount: foods.length,
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
                    "Customer Favourite",
                    style: context.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
              height: context.height * 0.23,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Food food = foods[index];
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
                                  image: AssetImage(
                                    "assets/foods/${food.picture}",
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
                                  vertical: 4,
                                  horizontal: 2,
                                ),
                                width: context.width * 0.35,
                                height: context.height * 0.13,
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: const BorderRadius.all(
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
                                              color: food.disponible
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
                                              color: food.disponible
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
                                      food.name,
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "${food.price} XOF",
                                      style: context.bodyMedium!.copyWith(
                                        fontSize: 12,
                                        color: context.primary,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 23,
                                        width: context.width * 0.15,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: context.primary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          "Order",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
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
                itemCount: foods.length,
              ),
            ),
            Gap(context.height * 0.13),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        index: 3,
      ),
    );
  }
}
