import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/utils/add_medial_container.dart';
import 'package:post_share/utils/app_colors.dart';
import 'package:post_share/utils/app_snackbar.dart';
import 'package:post_share/viewmodels/create_post_page_viewmodel.dart';
import 'package:post_share/views/home_page.dart';

class CreatePostPage extends ConsumerWidget {
  final TextEditingController _captionController = TextEditingController();
  CreatePostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createPostState = ref.watch(createPostProvider);
    ref.listen<AsyncValue<String>>(createPostProvider, (previous, next) {
      next.whenOrNull(
        data: (message) {
          if (message == "Success") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
            );
          }
        },
        error: (error, StackTrace) {
          AppSnackbar.show(context: context, message: error.toString());
        },
      );
    });
    return Scaffold(
      backgroundColor: Colors.white, // Pure white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Create Post',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // User info row
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.accentOrange.withOpacity(0.2),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.accentOrange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Alex Dev',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Post Text Field
              Expanded(
                child: TextField(
                  controller: _captionController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "What's on your mind?",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: InputBorder.none,
                  ),
                ),
              ),

              // Add Media Container (Using Brand Gradient)
              GestureDetector(
                onTap: () {
                  // Handle media upload logic here
                },
                child: AddMedialContainer(),
              ),
              const SizedBox(height: 24),

              //show loading indicatar
              if (createPostState.isLoading)
                Center(child: CircularProgressIndicator()),
              //Publish Button
              Container(
                height: 54,
                decoration: BoxDecoration(
                  gradient: AppColors.brandGradient,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentOrange.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: ElevatedButton(
                  onPressed: createPostState.isLoading
                      ? null
                      : () {
                          // Handle post publishing logic
                          ref
                              .read(createPostProvider.notifier)
                              .createPost(
                                caption: _captionController.text,
                                image_url: "image_url",
                              );
                          AppSnackbar.show(
                            context: context,
                            message: _captionController.text,
                            color: Colors.green,
                          );
                          print("Publishing: ${_captionController.text}");
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Publish Post',
                    style: TextStyle(
                      color:
                          Colors.black, // High contrast text on top of gradient
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
