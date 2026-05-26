import 'package:flutter/material.dart';
import 'package:post_share/utils/app_colors.dart';

class AddMedialContainer extends StatelessWidget {
  const AddMedialContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryYellow.withValues(alpha: 0.2),
            AppColors.accentOrange.withValues(alpha: 0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: AppColors.accentOrange.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 40,
            color: AppColors.accentOrange.withValues(alpha: 0.8),
          ),
          const SizedBox(height: 8),
          Text(
            'Add Photos or Video',
            style: TextStyle(
              color: AppColors.accentOrange.withValues(alpha: 0.9),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
