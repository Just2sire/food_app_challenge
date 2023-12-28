import 'package:flutter/material.dart';
import 'package:food_app/utils/build_context_extension.dart';

class PageViewStep extends StatelessWidget {
  const PageViewStep({
    super.key,
    required this.image,
    required this.step,
    required this.title,
    required this.description,
  });

  final String image;
  final int step;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.75,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.surface,
                width: 0.5,
              ),
            ),
            child: Image(
              image: AssetImage(
                "assets/food_images/$image",
                ),
                fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: context.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: context.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  child: Text(
                    description,
                    maxLines: 3,
                    style: context.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
