import 'package:flutter/material.dart';
import 'package:food_app/core/data/foods_data.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:gap/gap.dart';

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = foods.map((element) => element.name).toList();

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    // );
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        matchQuery.length,
        (index) {
          Food food =
              foods.lastWhere((element) => element.name == matchQuery[index]);
          return Center(
            child: SizedBox(
              height: context.height * 0.23,
              width: double.infinity,
              child: Stack(
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
                        width: context.width * 0.45,
                        height: context.height * 0.14,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.height * 0.1,
                    left: context.width * 0.05,
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "Order",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                                // style: context.bodySmall!.copyWith(
                                //   color: Colors.white,
                                //   height: 8,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        // return ListTile(
        //   title: Text(result),
        // );
        return SizedBox(
          width: context.width * 0.8,
          height: 40,
          child: Row(
            children: [
              const Gap(10),
              const Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
              const Gap(20),
              Text(
                result,
                style: context.titleMedium!.copyWith(
                  color: Colors.black54,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
