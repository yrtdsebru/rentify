part of 'adding_card_view.dart';

class AddingCardFourthView extends StatelessWidget with CustomWidgets {
  const AddingCardFourthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModelRead = context.read<AddingCardViewModel>();

    // * card verisini cekmek icin
    final viewModelWatch = context.watch<AddingCardViewModel>();
    String card = viewModelWatch.state.card;

    String cardNumber = card.substring(0, card.length - 11);
    String maskedCardNumber = cardNumber.replaceRange(
        0, cardNumber.length - 4, '*' * (cardNumber.length - 4));

    return BlocBuilder<AddingCardViewModel, AddingCardState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),

                    color: context.isDark? Color.fromARGB(165, 39, 104, 41): const Color.fromRGBO(200, 230, 201, 0.382),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: context.isDark? Color.fromARGB(237, 192, 243, 193): Color.fromARGB(233, 3, 112, 7),
                      ),
                      title: Text(
                        L10n.of(context)!.cardSuccessfullyAdded,
                        style: TextStyle(
                            color: context.isDark? Color.fromARGB(255, 184, 226, 186): Color.fromARGB(196, 3, 112, 7),
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  L10n.of(context)!.cardList,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  L10n.of(context)!.enterCardInfo,
                ),
                const SizedBox(
                  height: 20,
                ),
                Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),

                      color: context.isDark? Color.fromARGB(255, 158, 28, 19).withOpacity(0.5) : Colors.red.withOpacity(0.5),
                    ),
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: SvgPicture.asset(Assets.icons.svg.iconRecycle,

                          color: context.isDark? Color.fromARGB(239, 227, 193, 191): Color.fromARGB(255, 153, 26, 17),
                          width: 30, height: 20),
                    ),
                  ),
                  onDismissed: (direction) {},
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical:
                                0), //default listtile paddingini 0 yapmamiz gerek
                        leading: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            Assets.icons.svg.mastercard,
                            width: 50,
                            height: 30,
                          ),
                        ),
                        title: Text(
                          '${L10n.of(context)!.account} $maskedCardNumber',
                          style: const TextStyle(fontSize: 13),
                        ),
                        trailing: Container(
                          height: 70,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),

                            color: context.isDark? Colors.white.withOpacity(0.8): Color.fromARGB(255, 115, 165, 239)
                                .withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 300,
            ),
            buildButton(
              context,
              label: L10n.of(context)!.addAnotherCard,
              leftIcon: Icons.add,
              onPressed: () {
                // viewModelRead.add(SuccessMessageEvent(false));

                viewModelRead.add(CurrentPageIndexEvent(1));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            buildButton(
              context,
              label: L10n.of(context)!.continueText,
              textColor: const Color.fromARGB(255, 48, 79, 254),
              backgroundColor: Colors.transparent,
              borderColor: const Color.fromARGB(255, 48, 79, 254),
              onPressed: () {
                // viewModelRead.add(SuccessMessageEvent(false));
               //////////////////// context.router.push(const HomeViewRoute());
                //viewModelRead.add(CurrentPageIndexEvent(4));
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    });
  }
}
