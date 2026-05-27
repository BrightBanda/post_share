import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/feed_provider.dart';
import 'package:post_share/utils/app_colors.dart';
import 'package:post_share/utils/app_snackbar.dart';
import 'package:post_share/utils/create_post_box.dart';
import 'package:post_share/utils/post_card.dart';
// Import your provider to trigger logouts if necessary
// import 'package:post_share/providers/auth_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomePage> {
  Future<void> _handleRefresh() async {
    ref.invalidate(feedProvider);
    await ref.read(feedProvider.future).catchError((_) => []);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      AppSnackbar.show(
        context: context,
        message: "Feed refreshed",
        color: AppColors.accentOrange,
        duration: Duration(seconds: 1),
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
    final feedAsync = ref.watch(feedProvider);
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
        child: feedAsync.when(
          data: (posts) {
            return ListView.builder(
              padding: const EdgeInsets.all(12.0),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                // Map index back down to database list bounds
                final post = posts[index];

                // ✅ PostCard automatically expects an structure payload map or model representation
                return PostCard(post: post);
              },
            );
          },
          error: (err, st) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              Center(
                child: Text(
                  "Error loading feed: ${err.toString().replaceAll("Exception:", "")}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.accentOrange),
          ),
        ),
      ),
    );
  }
}
