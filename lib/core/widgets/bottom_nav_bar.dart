import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/utils/build_context_extension.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  const BottomNavBar({
    super.key,
    required this.index,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // final PageController _pageController;
  final _controller = NotchBottomBarController(index: 0);

  String view(index) {
    switch (index) {
      case 0:
        return "/home";
      case 1:
        return "/chat";
      case 2:
        return "/add";
      case 3:
        return "/search";
      case 4:
        return "/profile";
      default:
        return "/home";
    }
  }

  Object getBody(selectedIndex) {
    _controller.index = selectedIndex;
    return GoRouter.of(context).push(view(selectedIndex));
  }

  @override
  Widget build(BuildContext context) {
    _controller.index = widget.index;
    return AnimatedNotchBottomBar(
      /// Provide NotchBottomBarController
      notchBottomBarController: _controller,
      color: context.surface,
      showLabel: true,
      notchColor: context.primary,

      /// restart app if you change removeMargins
      removeMargins: false,
      bottomBarWidth: context.width * 0.8,
      durationInMilliSeconds: 300,
      bottomBarItems: [
        BottomBarItem(
          inActiveItem: const FaIcon(
            FontAwesomeIcons.house,
          ),
          activeItem: FaIcon(
            FontAwesomeIcons.house,
            color: context.surface,
          ),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: const FaIcon(
            FontAwesomeIcons.message,
          ),
          activeItem: FaIcon(
            FontAwesomeIcons.message,
            color: context.surface,
          ),
          itemLabel: 'Chat',
        ),
        BottomBarItem(
          inActiveItem: const FaIcon(
            FontAwesomeIcons.plus,
          ),
          activeItem: Icon(
            FontAwesomeIcons.plus,
            color: context.surface,
          ),
          itemLabel: 'Add',
        ),
        BottomBarItem(
          inActiveItem: const FaIcon(
            FontAwesomeIcons.magnifyingGlass,
          ),
          activeItem: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: context.surface,
          ),
          itemLabel: 'Search',
        ),
        BottomBarItem(
          inActiveItem: const FaIcon(
            FontAwesomeIcons.user,
          ),
          activeItem: FaIcon(
            FontAwesomeIcons.user,
            color: context.surface,
          ),
          itemLabel: 'Profile',
        ),
      ],
      onTap: (index) {
        // print(index);
        getBody(index);
        _controller.index = index;

        /// perform action on tab change and to update pages you can update pages without pages
        print('current selected index $index');
        // _pageController.jumpToPage(index);
        // _controller.
      },
    );
  }
}
