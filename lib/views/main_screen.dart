import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/nav_index_provider.dart';
import 'package:post_share/utils/app_colors.dart';
import 'package:post_share/views/create_post_page.dart';
import 'package:post_share/views/home_page.dart';
import 'package:post_share/views/profile_page.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  List<Widget> screens = [HomePage(), CreatePostPage(), ProfilePage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navIndexProvider);
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.airplay_outlined, color: Colors.blue),
          Icon(Icons.add_circle_outline, color: Colors.blue),
          Icon(Icons.account_circle_outlined, color: Colors.blue),
        ],
        inactiveIcons: const [
          Icon(Icons.airplay_outlined, color: Colors.deepPurpleAccent),
          Icon(Icons.add_circle_outline, color: Colors.deepPurpleAccent),
          Icon(Icons.account_circle_outlined, color: Colors.deepPurpleAccent),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: selectedIndex,
        onTap: (index) {
          ref.read(navIndexProvider.notifier).state = index;
        },
        // tabCurve: ,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: const Color.fromARGB(173, 66, 97, 234),
        circleShadowColor: const Color.fromARGB(173, 66, 97, 234),
        elevation: 10,
        gradient: AppColors.brandGradient,
        circleGradient: AppColors.brandGradient,
      ),
    );
  }
}
