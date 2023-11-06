import 'package:rentify/app/views/view_splash/view_model/splash_event.dart';
import 'package:rentify/app/views/view_splash/view_model/splash_state.dart';
import 'package:rentify/app/views/view_splash/view_model/splash_view_model.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashViewModel()..add(SplashInitialEvent(context)),
      child: BlocBuilder<SplashViewModel, SplashState>(
        builder: (context, state) {
          return Material(
            child: Stack(
              children: [
                SizedBox(
                    width: context.width,
                    height: context.height,
                    child: Container(
                      color: Color.fromARGB(255, 42, 38, 38),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        Assets.icons.svg.iconBrand2,
                        width: context.width * 0.85,
                        height: context.height * 0.55,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
