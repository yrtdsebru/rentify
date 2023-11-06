import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_signin/signin_view.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:rentify/core/widgets/decision_widgets.dart';
import 'package:rentify/core/widgets/intro_widgets.dart';
import 'package:rentify/gen/assets.gen.dart';

@RoutePage()
class DecisionView extends StatelessWidget {
  const DecisionView({Key? key}) : super(key: key);

  //AuthController authController = context.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            introWidget(context),
            const SizedBox(
              height: 70,
            ),
            DecisionButton(Assets.driver.path, 'Sing in As Tenant', () {
              //kiracı
              // authController.isLoginAsDriver = true;
              //  context.to(()=> SignInViewRoute());
              context.router.push(const SignInViewRoute());
            }, context.width * 0.8),
            const SizedBox(
              height: 20,
            ),
            DecisionButton(Assets.customer.path, 'Sign in As Landlord', () {
              //sahip
              //   authController.isLoginAsDriver = false;
              // context.to(()=> SignInView());
              context.router.push(const SignInViewRoute());
            }, context.width * 0.8),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'or',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            DecisionButton(Assets.customer.path, 'Sign up  Our  App ', () {
              //   authController.isLoginAsDriver = false;
              // context.to(()=> SignInView());
              context.router.push(const SignUpViewRoute());
            }, context.width * 0.8),
          ],
        ),
      ),
    );
  }
}
