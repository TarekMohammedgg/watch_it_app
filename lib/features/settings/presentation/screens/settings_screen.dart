import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:watch_it_app/core/constants/app_colors.dart';
import 'package:watch_it_app/core/constants/app_strings.dart';
import 'package:watch_it_app/core/constants/app_style.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_states.dart';
import '../../data/repo/settings_repo.dart';
import 'widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open link')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(SettingsRepo())..fetchProfile(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: const Icon(
            Icons.settings,
            color: AppColors.textDark,
          ),
          title: Text(
            AppStrings.settingsTitle,
            style: AppStyle.bold20,
          ),
        ),
        body: BlocBuilder<SettingsCubit, SettingsStates>(
          builder: (context, state) {
            if (state is SettingsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryGreen,
                ),
              );
            }
            if (state is SettingsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message, style: AppStyle.regular14),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<SettingsCubit>().fetchProfile(),
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }
            if (state is SettingsSuccess) {
              final profile = state.profile;
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildSectionHeader(AppStrings.sectionInterface),
                  const SizedBox(height: 8),
                  SettingsItem(
                    icon: Icons.facebook,
                    label: AppStrings.facebook,
                    iconContainerColor: AppColors.iconContainerGreen,
                    iconColor: AppColors.primaryGreen,
                    onTap: () => _launchUrl(context, profile.facebookUrl),
                  ),
                  SettingsItem(
                    icon: Icons.phone,
                    label: AppStrings.whatsapp,
                    iconContainerColor: AppColors.iconContainerGreen,
                    iconColor: AppColors.primaryGreen,
                    onTap: () => _launchUrl(context, profile.whatsappUrl),
                  ),
                  SettingsItem(
                    icon: Icons.play_circle_outline,
                    label: AppStrings.youtubeChannel,
                    iconContainerColor: AppColors.iconContainerGreen,
                    iconColor: AppColors.primaryGreen,
                    onTap: () => _launchUrl(context, profile.youtubeUrl),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(AppStrings.sectionGeneral),
                  const SizedBox(height: 8),
                  SettingsItem(
                    icon: Icons.info_outline,
                    label: AppStrings.aboutDeveloper,
                    iconContainerColor: AppColors.iconContainerGrey,
                    iconColor: AppColors.primaryGreen,
                    onTap: () {
                      if (profile.aboutDeveloper != null) {
                        _launchUrl(context, profile.aboutDeveloper!);
                      }
                    },
                  ),
                  SettingsItem(
                    icon: Icons.shield_outlined,
                    label: AppStrings.privacyPolicy,
                    iconContainerColor: AppColors.iconContainerGreen,
                    iconColor: AppColors.primaryGreen,
                    onTap: () {
                      if (profile.privacyPolicy != null) {
                        _launchUrl(context, profile.privacyPolicy!);
                      }
                    },
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: AppStyle.regular14,
      ),
    );
  }
}
