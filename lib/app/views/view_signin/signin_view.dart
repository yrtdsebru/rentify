import 'package:auto_route/auto_route.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_signin/view_model/signin_event.dart';
import 'package:rentify/app/views/view_signin/view_model/signin_state.dart';
import 'package:rentify/app/views/view_signin/view_model/signin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentify/core/widgets/context_widgets.dart';

@RoutePage()
class SignInView extends StatelessWidget with CustomWidgets {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInViewModel(),
      child:
          BlocBuilder<SignInViewModel, SignInState>(builder: (context, state) {
        return Scaffold(
            appBar: transparentAppBar(context, () {
              context.router.pop();
            }),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      L10n.of(context)!.signin,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Hesabınız yok mu?',
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {
                              context.router.push(const SignUpViewRoute());
                            },
                            child: Text(L10n.of(context)!.signUp)),
                      ],
                    ),
                    Column(
                      children: [
                        textInput(
                            L10n.of(context)!.email,
                            'E-mail',
                            context,
                            prefixIcon: const Icon(Icons.email_outlined),
                            context.read<SignInViewModel>().emailController),
                        textInput(
                            L10n.of(context)!.password,
                            'Password',
                            context,
                            prefixIcon: const Icon(Icons.key),
                            suffixIcon: const Icon(Icons.visibility_outlined),
                            context.read<SignInViewModel>().passwordController),
                        const SizedBox(height: 30),
                        buildButton(
                          context,
                          label: L10n.of(context)!.signin,
                          onPressed: () {
                            context
                                .read<SignInViewModel>()
                                .add(SignInInitialEvent(context));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
