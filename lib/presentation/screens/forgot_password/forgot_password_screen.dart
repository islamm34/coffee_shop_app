// lib/presentation/screens/forgot_password/forgot_password_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/animations/fade_animation.dart';
import '../../../core/theme/app_theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.login);
          },
          icon: SvgPicture.network(
            'https://api.iconify.design/lucide/arrow-left.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              context.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),        title: Text(
          'Reset Password',
          style: AppTextStyles.titleMedium.copyWith(
            color: context.textPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: AppSpacing.paddingXxl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.gapXxl,
            Text(
              'Enter your email',
              style: AppTextStyles.displaySmall.copyWith(
                color: context.textPrimary,
              ),
            ),
            AppSpacing.gapSm,
            Text(
              'We\'ll send you a reset link to your email',
              style: AppTextStyles.bodyMedium.copyWith(
                color: context.textSecondary,
              ),
            ),
            AppSpacing.gapXxl,
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email Address',
                prefixIcon: Icon(Icons.email_outlined, color: context.textSecondary),
              ),
            ),
            AppSpacing.gapXxl,
            PrimaryButton(
              text: 'Send Instructions',
              onPressed: () {
                setState(() {
                  _isEmailSent = true;
                });
              },
              fullWidth: true,
            ),
            if (_isEmailSent) ...[
              AppSpacing.gapLg,
              FadeAnimation(
                child: Container(
                  padding: AppSpacing.paddingLg,
                  decoration: BoxDecoration(
                    color: AppColors.successLight.withValues(alpha: 0.2),
                    borderRadius: AppRadius.mdRadius,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.network(
                        'https://api.iconify.design/lucide/check-circle.svg',
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.success,
                          BlendMode.srcIn,
                        ),
                      ),
                      AppSpacing.gapHorizontalMd,
                      Expanded(
                        child: Text(
                          'Reset link sent to your email',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const Spacer(),
            ClipRRect(
              borderRadius: AppRadius.xxlRadius,
              child: Image.network(
                'https://picsum.photos/seed/forgotPassword/400/200',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: double.infinity,
                    color: context.backgroundColor,
                    child: Icon(
                      Icons.coffee,
                      color: context.secondaryColor,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
            AppSpacing.gapLg,
          ],
        ),
      ),
    );
  }
}