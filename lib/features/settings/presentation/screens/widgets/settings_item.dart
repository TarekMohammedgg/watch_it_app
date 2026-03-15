import 'package:flutter/material.dart';

import 'package:watch_it_app/core/constants/app_colors.dart';
import 'package:watch_it_app/core/constants/app_style.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconContainerColor;
  final Color iconColor;
  final VoidCallback onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.label,
    required this.iconContainerColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Icon container (appears on the right in RTL)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconContainerColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // Label text
            Expanded(
              child: Text(
                label,
                style: AppStyle.semiBold16,
              ),
            ),
            // Chevron arrow (left arrow for RTL)
            Icon(
              Icons.chevron_left,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
