part of 'adding_card_view.dart';

class AddingCardSecondView extends StatelessWidget with CustomWidgets {
  AddingCardSecondView({Key? key}) : super(key: key);

  // 3 textInput dolduktan sonra buton aktiflessin
  void validateFields(BuildContext context) {
    final viewModelRead = context.read<AddingCardViewModel>();

    // Tüm alanlar dolu mu kontrol ediyoruz
    bool isButtonEnabled = viewModelRead.nameController.text.isNotEmpty &&
        viewModelRead.emailController.text.isNotEmpty &&
        viewModelRead.cardController.text
            .isNotEmpty && //hepsi bos degilse true doner buton aktiflesir.
        RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$')
            .hasMatch(viewModelRead.emailController.text);

    // Butonun etkinleştirilmesi veya devre dışı bırakılması için IsButtonEnabledEvent olayını tetikliyoruz
    viewModelRead.add(IsButtonEnabledEvent(isButtonEnabled));
  }

  // * email verisini cekmek icin
  void onEmailEntered(String enteredEmail, BuildContext context) {
    final viewModelRead = context.read<AddingCardViewModel>();
    viewModelRead.add(EmailEnteredEvent(enteredEmail));
  }

  // * card verisini cekmek icin
  void onCardEntered(String enteredCard, BuildContext context) {
    final viewModelRead = context.read<AddingCardViewModel>();
    viewModelRead.add(CardEnteredEvent(enteredCard));
  }

  @override
  Widget build(BuildContext context) {
    final viewModelRead = context.read<AddingCardViewModel>();

    // anlık tetiklemeye yardimci, dinliyor, 3 ınput girdilerini, her bir textInput'a girilen her karakter veya her değişiklik için tetiklenecek
    viewModelRead.nameController.addListener(() => validateFields(context));
    viewModelRead.emailController.addListener(() => validateFields(context));
    viewModelRead.cardController.addListener(() {
      final cardType =
          CardUtils.getCardTypeFrmNumber(viewModelRead.cardController.text);
      viewModelRead.add(CardTypeEvent(cardType));
      validateFields(context);
    });

    return BlocBuilder<AddingCardViewModel, AddingCardState>(
        builder: (context, state) {
      // Kart türüne uygun SVG ikonunu al
      Widget? cardIcon = CardUtils.getCardIcon(state.cardType);

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              L10n.of(context)!.addCard,
              overflow:
                  TextOverflow.ellipsis, // Metin kesildiğinde üç nokta göster
              maxLines: 1, // En fazla 1 satır göster
              style: TextStyle(
                fontSize: 21,
                color: context.isDark? Colors.white: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              L10n.of(context)!.enterYourCreditCardInfo,
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromARGB(255, 113, 111, 111),
              ),
            ),
            const SizedBox(height: 10),
            textInput(
              L10n.of(context)!.accountHolderName,
              L10n.of(context)!.fullName,
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
              L10n.of(context)!.email,
              'yourname@example.com',
              context,
              viewModelRead.emailController,
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!RegExp(
                        r'^[a-zA-Z0-9ğüşıöjçĞÜşŞİÖÇ\._%+-]+@[a-zA-Z0-9ğüşıöjçĞÜşŞİÖÇ\.-]+\.[a-zA-ZğüşıöçĞÜşŞİÖÇ]{2,}$')
                    .hasMatch(value!)) {
                  return L10n.of(context)!.emailValidationMessage;
                }
                return null;
              },
              // * Email değiştiğinde onEmailEntered fonksiyonu tetiklenecek, veri cekmek icin kullanicaz
              onChanged: (enteredEmail) =>
                  onEmailEntered(enteredEmail, context),
            ),
            textInput(
              L10n.of(context)!.cardNumber,
              '1234 5678 9101 2345  MM/YY  CVV',
              context,
              viewModelRead.cardController,
              keyboardType: TextInputType.number,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: cardIcon,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(23),
                CardNumberInputFormatter(),
              ],
              // * Card değiştiğinde onCardEntered fonksiyonu tetiklenecek, veri cekmek icin kullanicaz
              onChanged: (enteredCard) =>
                  onCardEntered(enteredCard, context),
            ),
            const SizedBox(height: 30),
            buildButton(
              context,
              label: L10n.of(context)!.verify,
              textColor: context.isDark? (state.isButtonEnabled ? Colors.black54 : Colors.white) : (state.isButtonEnabled ? Colors.white : Colors.black54),
              backgroundColor: state.isButtonEnabled ? const Color(0xFF304FFF) : Colors.grey,
              hoverColor: const Color.fromARGB(158, 125, 123, 123),
              onPressed: state.isButtonEnabled
                  ? () {
                      viewModelRead.add(CurrentPageIndexEvent(2));
                      // print(context.read<AddingCardViewModel>().state.email);
                      // print(context.read<AddingCardViewModel>().state.card);
                      // print(context.read<AddingCardViewModel>().state.name);
                    }
                  : () {},
            ),
          ],
        ),
      );
    });
  }
}
