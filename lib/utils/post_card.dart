import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;

  // Optional callbacks if you want to make buttons functional later
  final VoidCallback? onLikePressed;
  final VoidCallback? onCommentPressed;
  final VoidCallback? onSharePressed;
  final VoidCallback? onMenuPressed;

  const PostCard({
    super.key,
    required this.post,
    this.onLikePressed,
    this.onCommentPressed,
    this.onSharePressed,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Fallback logic to protect against null/empty usernames
    final String username = post['username'] ?? 'anonymous';
    final String avatarLetter = username.isNotEmpty
        ? username[0].toUpperCase()
        : '?';

    return Card(
      margin: const EdgeInsets.only(bottom: 6.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent.shade100,
                  child: Text(avatarLetter),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@$username',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        post['created_at'] ?? '',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: onMenuPressed ?? () {},
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              post['caption'] ?? '',
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: onLikePressed ?? () {},
                  icon: const Icon(Icons.thumb_up_outlined, size: 20),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  onPressed: onCommentPressed ?? () {},
                  icon: const Icon(Icons.bookmark_add_outlined, size: 20),
                  label: const Text('Save'),
                ),
                TextButton.icon(
                  onPressed: onSharePressed ?? () {},
                  icon: const Icon(Icons.share_outlined, size: 20),
                  label: const Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
