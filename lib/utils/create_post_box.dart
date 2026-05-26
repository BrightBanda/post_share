import 'package:flutter/material.dart';
import 'package:post_share/utils/app_snackbar.dart';

class CreatePostBox extends StatelessWidget {
  const CreatePostBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                readOnly: true, // Making it a click trigger for UX simplicity
                onTap: () {
                  AppSnackbar.show(
                    context: context,
                    message: "you have created a post",
                  );
                },
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.image, color: Colors.green),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
