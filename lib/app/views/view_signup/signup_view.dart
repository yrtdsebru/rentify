import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_event.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_state.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentify/core/widgets/context_widgets.dart';
import 'package:rentify/core/widgets/date_widget.dart';

@RoutePage()
class SignUpView extends StatelessWidget with CustomWidgets {
  const SignUpView({super.key});

  void validateFields(BuildContext context) {
    final viewModelRead = context.read<SignUpViewModel>();

    // Tüm alanlar dolu mu kontrol ediyoruz
    bool isButtonEnabled = viewModelRead.userNameController.text.isNotEmpty &&
        viewModelRead.nameController.text.isNotEmpty &&
        viewModelRead.surNameController.text.isNotEmpty &&
        viewModelRead.adressController.text.isNotEmpty &&
        viewModelRead.phoneController.text.isNotEmpty &&
        viewModelRead.passwordOneController.text.isNotEmpty &&
        viewModelRead.passwordTwoController.text.isNotEmpty &&
        viewModelRead.emailController.text
            .isNotEmpty && //hepsi bos degilse true doner buton aktiflesir.
        RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$')
            .hasMatch(viewModelRead.emailController.text);

    // Butonun etkinleştirilmesi veya devre dışı bırakılması için IsButtonEnabledEvent olayını tetikliyoruz
    viewModelRead.add(IsButtonEnabledEvent(isButtonEnabled));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignUpViewModel(),
        child: BlocBuilder<SignUpViewModel, SignUpState>(
            builder: (context, state) {
          String dropdownValue = 'Landlord';
          final viewModelRead = context.read<SignUpViewModel>();

          // anlık tetiklemeye yardimci, dinliyor, 3 ınput girdilerini, her bir textInput'a girilen her karakter veya her değişiklik için tetiklenecek
          viewModelRead.userNameController
              .addListener(() => validateFields(context));
          viewModelRead.nameController
              .addListener(() => validateFields(context));
          viewModelRead.surNameController
              .addListener(() => validateFields(context));
          viewModelRead.adressController
              .addListener(() => validateFields(context));
          viewModelRead.phoneController
              .addListener(() => validateFields(context));
          viewModelRead.passwordOneController
              .addListener(() => validateFields(context));
          viewModelRead.passwordTwoController
              .addListener(() => validateFields(context));
          viewModelRead.emailController
              .addListener(() => validateFields(context));

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
                        DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            dropdownValue = newValue!;
                            viewModelRead.add(IsLandlordSelectedEvent(
                                dropdownValue == 'Landlord' ? true : false));
                          },
                          items: <String>['Landlord', 'Tenant']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        textInput(
                          L10n.of(context)!.userName,
                          'isminizi giriniz',
                          context,
                          viewModelRead.nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return L10n.of(context)!.pleaseEnterYourName;
                            }
                            return null;
                          },
                        ),
                        textInput(
                          L10n.of(context)!.userSurName,
                          'Soyadınızı giriniz',
                          context,
                          viewModelRead.surNameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return L10n.of(context)!.pleaseEnterYourName;
                            }
                            return null;
                          },
                        ),
                        textInput(
                          L10n.of(context)!.userName,
                          'Kullanıcı Adı Oluşturunuz',
                          context,
                          viewModelRead.userNameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return L10n.of(context)!.pleaseEnterYourName;
                            }
                            return null;
                          },
                        ),
                        textInput(
                          L10n.of(context)!.email,
                          'E-posta adresinizi giriniz',
                          context,
                          viewModelRead.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!RegExp(
                                    r'^[a-zA-Z0-9ğüşıöjçĞÜşŞİÖÇ\._%+-]+@[a-zA-Z0-9ğüşıöjçĞÜşŞİÖÇ\.-]+\.[a-zA-ZğüşıöçĞÜşŞİÖÇ]{2,}$')
                                .hasMatch(value!)) {
                              return L10n.of(context)!.emailValidationMessage;
                            }
                            return null;
                          },
                        ),
                        textInput(
                          L10n.of(context)!.phone,
                          'Telefon numaranızı giriniz',
                          context,
                          viewModelRead.phoneController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return L10n.of(context)!.pleaseEnterYourName;
                            }
                            return null;
                          },
                        ),
                        textInput(
                          L10n.of(context)!.password,
                          'Şifrenizi giriniz',
                          context,
                          viewModelRead.passwordOneController,
                        ),
                        textInput(
                          L10n.of(context)!.password,
                          'Şifrenizi tekrar giriniz',
                          context,
                          viewModelRead.passwordTwoController,
                        ),
                        if (viewModelRead.passwordOneController.text !=
                            viewModelRead.passwordTwoController.text)
                          const Text(
                            'Şifreler uyuşmuyor',
                            style: TextStyle(color: Colors.red),
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
                                      viewModelRead.add(
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
                          viewModelRead.adressController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            buildButton(
                              context,
                              label: L10n.of(context)!.signUp,
                              backgroundColor: state.isButtonEnabled
                                  ? const Color(0xFF304FFF)
                                  : Colors.grey,
                              hoverColor:
                                  const Color.fromARGB(158, 125, 123, 123),
                              onPressed: state.isButtonEnabled
                                  ? () {
                                      viewModelRead
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
