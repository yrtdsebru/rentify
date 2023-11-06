import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.dart';
import 'package:rentify/app/views/view_404/view_model/404_event.dart';
import 'package:rentify/app/views/view_404/view_model/404_state.dart';
import 'package:rentify/app/views/view_404/view_model/404_view_model.dart';
import 'package:rentify/core/constants/ligth_theme_color_constants.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:rentify/core/widgets/context_widgets.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NotFoundView extends StatelessWidget with CustomWidgets {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => NotFoundViewModel(),
      child: BlocBuilder<NotFoundViewModel, NotFoundState>(
        builder: (context, state){
          return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: transparentAppBar(context, () {context.router.pop(); }),
        body: Center(
          child: Column(
            children: [
             // Assets.images.png.imagePageNotFound.image(width: 350),
              const Padding(
                  padding: EdgeInsets.symmetric(
                vertical: 15,
              )),
              Text(
                L10n.of(context)!.error404,
                style: const TextStyle(
                  fontSize: 26,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                L10n.of(context)!.pageNotFound,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(
                L10n.of(context)!.notFoundPageMessage,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const Align(
                alignment: Alignment.center,
              ),
              SizedBox(height: context.height* 0.025  ,),
              SizedBox(
                width: 315, // Ekran genişliği kadar genişlik
                child: Text(
                  L10n.of(context)!.notFoundPageMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 116, 116, 116),
                  ),
                ),
              ),
              Container(height: context.height* 0.1),
              SizedBox(
                height: context.height* 0.08,
                width: context.width* 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<NotFoundViewModel>().add(RetuntoHomeEvent(context));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppLightColorConstants.bgAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(100), // Kose yuvarlanmasi
                    ),
                  ),
                  child: Text(
                    L10n.of(context)!.backToHome,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
        }
      ),
      
    );
  }
}
