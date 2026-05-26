import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/utils/app_colors.dart';
import 'package:post_share/utils/create_post_box.dart';
import 'package:post_share/utils/post_card.dart';
// Import your provider to trigger logouts if necessary
// import 'package:post_share/providers/auth_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<Map<String, String>> _dummyPosts = [
    {
      "username": "alex_dev",
      "time": "5m ago",
      "content":
          "Just finished setting up my FastAPI backend authentication using OAuth2PasswordRequestForm. Working flawlessly with Flutter now! 🚀",
    },
    {
      "username": "riverpod_fan",
      "time": "2h ago",
      "content":
          "Riverpod 3 AsyncNotifier makes handling local network states and loading spinners incredibly easy. Goodbye manual setState boilerplate.",
    },
    {
      "username": "flutter_coder",
      "time": "1d ago",
      "content":
          "Does anyone know the best way to securely save JWT access tokens on Android and iOS? Thinking about using flutter_secure_storage.",
    },
  ];

  Future<void> _handleRefresh() async {
    // Simulate network latency when pulling down to refresh the feed
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Feed updated!'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _onLogoutPressed() {
    // If you implemented the global authentication state gateway provider:
    // ref.read(authProvider.notifier).logout();

    // Otherwise, for manual navigation testing:
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logged out successfully')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'post_share',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColors.accentOrange,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: _onLogoutPressed,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount:
              _dummyPosts.length +
              1, // +1 to include the "Create Post" box at the top
          itemBuilder: (context, index) {
            // Index 0 renders the post creation box
            if (index == 0) {
              return const CreatePostBox();
            }

            // Adjust index by 1 to pull data out of your data collection correctly
            final post = _dummyPosts[index - 1];

            return PostCard(post: post);
          },
        ),
      ),
    );
  }
}
