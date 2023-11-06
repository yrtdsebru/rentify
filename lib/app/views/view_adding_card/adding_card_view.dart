import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.dart';
import 'package:rentify/app/views/view_adding_card/utils/add_card_utils.dart';
import 'package:rentify/app/views/view_adding_card/view_model/adding_card_event.dart';
import 'package:rentify/app/views/view_adding_card/view_model/adding_card_state.dart';
import 'package:rentify/app/views/view_adding_card/view_model/adding_card_view_model.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentify/core/widgets/context_widgets.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:rentify/core/extension/context_extension.dart';

part 'adding_card_first_view.dart';
part 'adding_card_second_view.dart';
part 'adding_card_third_view.dart';
part 'adding_card_fourth_view.dart';
part 'adding_card_fifth_view.dart';

@RoutePage()
class AddingCardView extends StatelessWidget with CustomWidgets {
  const AddingCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddingCardViewModel(),
      child: BlocBuilder<AddingCardViewModel, AddingCardState>(
        builder: (context, state) {
          return Scaffold(
              appBar: transparentAppBar(context, () {
                  state.currentIndex == 0
                      ? context.router.pop()
                      : context
                          .read<AddingCardViewModel>()
                          .add(CurrentPageIndexEvent(state.currentIndex - 1));
              }),
              backgroundColor: context.isDark ? const Color(0xFF121212) : const Color.fromARGB(255, 247, 247, 247),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      bodyWidget(state),
                    ],
                  ),
                ),
              ),
            );
        },
      ),
    );
  }

  Widget bodyWidget(AddingCardState state) {
    if (state.currentIndex == 0) {
      return const AddingCardFirstView();
    } else if (state.currentIndex == 1) {
      return  AddingCardSecondView();
    } else if (state.currentIndex == 2) {
      return const AddingCardThirdView();
    } else if (state.currentIndex == 3) {
      return const AddingCardFourthView();
    } else if (state.currentIndex == 4) {
      return const AddingCardFifthView();
    } else {
      return Container();
    }
  }
}
