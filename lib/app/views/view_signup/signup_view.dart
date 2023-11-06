import 'package:auto_route/auto_route.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_signin/signin_view.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_event.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_state.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentify/core/constants/ligth_theme_color_constants.dart';
import 'package:rentify/core/widgets/context_widgets.dart';

@RoutePage()
class SignUpView extends StatelessWidget with CustomWidgets {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignUpViewModel(),
        child: BlocBuilder<SignUpViewModel, SignUpState>(
            builder: (context, state) {
          return Scaffold(
            appBar: transparentAppBar(context, () {
              context.router.pop();
             }),
            resizeToAvoidBottomInset: false,
            backgroundColor: AppLightColorConstants.bgLight,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(L10n.of(context)!.signUp,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              L10n.of(context)!.alreadyHaveAccount,
                              style: const TextStyle(fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                context.router.push( const SignInViewRoute());
                                
                              },
                              child: Text(L10n.of(context)!.signin),
                            ),
                          ],
                        ),
                        textInput(L10n.of(context)!.userName, 'isminizi giriniz', context,
                            context.read<SignUpViewModel>().nameController),
                        textInput(L10n.of(context)!.userSurName, 'Soyadınızı giriniz', context,
                            context.read<SignUpViewModel>().surNameController),
                        textInput(
                          L10n.of(context)!.password,
                          'Şifrenizi giriniz',
                          context,
                          context.read<SignUpViewModel>().passwordController,
                        ),
                        textInput(
                          L10n.of(context)!.email,
                          'E-posta adresinizi giriniz',
                          context,
                          context.read<SignUpViewModel>().emailController,
                        ),
                        textInput(
                          L10n.of(context)!.phone,
                          'Telefon numaranızı giriniz',
                          context,
                          context.read<SignUpViewModel>().phoneController,
                        ),
                        textInput(
                          L10n.of(context)!.address,
                          'Adresinizi giriniz',
                          context,
                          context.read<SignUpViewModel>().adressController,
                        ),
                        const SizedBox(height: 30,),
                        buildButton(context, label: L10n.of(context)!.signUp, onPressed: (){
                                                        context
                                  .read<SignUpViewModel>()
                                  .add(SignUpInitialEvent(context));
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
