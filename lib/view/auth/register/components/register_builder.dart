import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/auth_view_model.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alerts/unexepted_error.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_auth_button.dart';
import 'package:datingcase/view/auth/components/custom_bottom_navigate.dart';
import 'package:datingcase/view/auth/components/custom_social_container_row.dart';
import 'package:datingcase/view/auth/register/components/atom/agree_and_terms.dart';
import 'package:datingcase/view/auth/register/components/atom/register_description.dart';
import 'package:datingcase/view/auth/register/components/atom/register_title.dart';
import 'package:datingcase/view/auth/register/components/register_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBuilder extends StatelessWidget {
  const RegisterBuilder({
    super.key,
    required TextEditingController fullNameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
    required this.parts,
    required this.linkText,
    required NavigationService navigationService,
  }) : _fullNameController = fullNameController,
       _emailController = emailController,
       _passwordController = passwordController,
       _rePasswordController = rePasswordController,
       _navigationService = navigationService;

  final TextEditingController _fullNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _rePasswordController;
  final List<String> parts;
  final String linkText;
  final NavigationService _navigationService;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.1,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RegisterTitle(),
                        RegisterDescription(),
                        SizedBox(height: KStyles.kFourtySize),

                        RegisterForm(
                          fullNameController: _fullNameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          rePasswordController: _rePasswordController,
                        ),

                        SizedBox(height: KStyles.kThirtySize),
                        AgreeAndTerms(parts: parts, linkText: linkText),
                        SizedBox(height: KStyles.kTwentyFourSize),
                        CustomAuthButton(
                          title: LocaleKeys.now_register.tr(),
                          onTap: () async {
                            context.read<AuthBloc>().add(
                              AuthRegisterRequest(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _fullNameController.text,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: KStyles.kThirtySevenSize),
                        SocialAuthRow(),
                      ],
                    ),
                  ),
                ),
              ),
              CustomBottomNavigate(
                navigationService: _navigationService,
                title: LocaleKeys.already_have_an_account.tr(),
                route: '/login',
                buttonTitle: LocaleKeys.login_button.tr(),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is AuthFailure) {
          unexceptedError(context, _navigationService);
        }
      },
    );
  }
}
