// ignore_for_file: must_be_immutable
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_onboarding/view_model/onboarding_event.dart';
import 'package:rentify/app/views/view_onboarding/view_model/onboarding_state.dart';
import 'package:rentify/app/views/view_onboarding/view_model/onboarding_view_model.dart';
import 'package:rentify/core/constants/ligth_theme_color_constants.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:rentify/core/widgets/context_widgets.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OnboardingView extends StatelessWidget with CustomWidgets {
  OnboardingView({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => OnboardingViewModel(),
      child: BlocBuilder<OnboardingViewModel, OnboardingState>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: context.height * 1,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView.builder(   //horizontal slider PageView, ListView vertical
                  controller: pageController,
                  itemCount: onboardingPages(context).length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        SizedBox(height: context.height * 0.1),
                        SizedBox(
                          width: context.width * 0.80,
                          height: context.height * 0.40,
                          child: SvgPicture.asset(
                            onboardingPages(context)[index][1]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: context.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (pageIndex) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: AnimatedContainer(
                                      curve: Curves.easeIn,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      width: pageIndex == index
                                          ? context.width * 0.035
                                          : context.width * 0.022,
                                      height: pageIndex == index
                                          ? context.height * 0.009
                                          : context.height * 0.008,
                                      decoration: BoxDecoration(
                                          color: pageIndex == index
                                              ? AppLightColorConstants
                                                  .buttonPrimaryColor
                                              : Colors.red.shade100,
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                    ),
                                  )),
                        ),
                        SizedBox(height: context.height * 0.01),
                        Container(
                          width: double.infinity,
                          height: context.height * 0.20,
                          padding: const EdgeInsets.only(
                              top: 60, left: 40, right: 40),
                          child: Text(
                            onboardingPages(context)[index][0]!,
                            style: TextStyle(
                              color:
                                  context.isDark ? Colors.white : Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: context.height * 0.04),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildButton(
                                context,
                                width: context.width * 0.38,
                                backgroundColor: AppLightColorConstants.bgLight,
                                textColor: Colors.red.shade300,
                                hoverColor: Colors.transparent,
                                label: L10n.of(context)!.skip,
                                onPressed: () {
                                  context.router
                                      .push(const DecisionViewRoute());
                                },
                              ),
                              buildButton(
                                context,
                                width: context.width * 0.38,
                                label: L10n.of(context)!.next,
                                onPressed: () {
                                  context.read<OnboardingViewModel>().add(
                                      IndicatorIncrementEvent(
                                          index, context, pageController));
                                },
                                rightIcon: Icons.navigate_next_outlined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }

  List onboardingPages(BuildContext context) {
    return [
      [
        L10n.of(context)!.onboardFirstTitle,
        Assets.icons.svg.iconMap3,
      ],
      [
        L10n.of(context)!.onboardSecondTitle,
        Assets.icons.svg.iconMoney,
      ],
      [
        L10n.of(context)!.onboardThirdTitle,
        Assets.images.svg.imageManWithKeys1,
      ],
    ];
  }
}
