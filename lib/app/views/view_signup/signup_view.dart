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
import 'package:rentify/core/widgets/context_widgets.dart';
import 'package:rentify/core/widgets/date_widget.dart';

@RoutePage()
class SignUpView extends StatelessWidget with CustomWidgets {
  const SignUpView({super.key});

  // 3 textInput dolduktan sonra buton aktiflessin
  bool validateFields(BuildContext context) {
    final viewModelRead = context.read<SignUpViewModel>();

    // Tüm alanlar dolu mu kontrol ediyoruz
    bool isButtonEnabled = viewModelRead.nameController.text.isNotEmpty &&
        viewModelRead.surNameController.text.isNotEmpty &&
        viewModelRead.adressController.text.isNotEmpty &&
        viewModelRead.phoneController.text.isNotEmpty &&
        viewModelRead.passwordOneController.text.isNotEmpty &&
        viewModelRead.emailController.text
            .isNotEmpty && //hepsi bos degilse true doner buton aktiflesir.
        RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$')
            .hasMatch(viewModelRead.emailController.text);

    // Butonun etkinleştirilmesi veya devre dışı bırakılması için IsButtonEnabledEvent olayını tetikliyoruz
    return isButtonEnabled;
  }

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
            // backgroundColor: AppLightColorConstants.bgLight,
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
                                context.router.push(const SignInViewRoute());
                              },
                              child: Text(L10n.of(context)!.signin),
                            ),
                          ],
                        ),
                        textInput(
                            L10n.of(context)!.userName,
                            'isminizi giriniz',
                            context,
                            context.read<SignUpViewModel>().nameController),
                        textInput(
                            L10n.of(context)!.userSurName,
                            'Soyadınızı giriniz',
                            context,
                            context.read<SignUpViewModel>().surNameController),
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
                          L10n.of(context)!.password,
                          'Şifrenizi giriniz',
                          context,
                          context.read<SignUpViewModel>().passwordOneController,
                        ),
                        textInput(
                          L10n.of(context)!.password,
                          'Şifrenizi tekrar giriniz',
                          context,
                          context.read<SignUpViewModel>().passwordTwoController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(L10n.of(context)!.birthOfDate),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomDatePicker(
                                    onDateSelected: (isDateSelected) {
                                      context.read<SignUpViewModel>().add(
                                          IsDateSelectedEvent(isDateSelected));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        textInput(
                          L10n.of(context)!.address,
                          'Adresinizi giriniz',
                          context,
                          context.read<SignUpViewModel>().adressController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            buildButton(
                              context,
                              label: L10n.of(context)!.signUp,
                              backgroundColor: validateFields(context)
                                  ? const Color(0xFF304FFF)
                                  : Colors.grey,
                              hoverColor:
                                  const Color.fromARGB(158, 125, 123, 123),
                              onPressed: validateFields(context)
                                  ? () {
                                      context
                                          .read<SignUpViewModel>()
                                          .add(SignUpInitialEvent(context));
                                    }
                                  : () {},
                            ),
                          ],
                        ),
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
