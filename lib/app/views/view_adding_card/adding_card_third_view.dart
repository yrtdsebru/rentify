part of 'adding_card_view.dart';

class AddingCardThirdView extends StatelessWidget with CustomWidgets {
  const AddingCardThirdView({Key? key}) : super(key: key);

  // Her bir TextField değiştiğinde çağrılacak fonksiyon.
  void _onTextFieldChanged(int index, String value, BuildContext context) {
    final viewModelRead = context.read<AddingCardViewModel>();
    final controllers = viewModelRead.controllers;
    final focusNodes = viewModelRead.focusNodes;
    // Tüm TextField'ların değerlerini kontrol et
    bool allFilled = true;
    for (int i = 0; i < 6; i++) {
      if (controllers[i].text.isEmpty) {
        allFilled = false;
        break;
      }
    }

    viewModelRead.add(IsFilledEvent(allFilled));

    if (value.isNotEmpty) {
      if (index < 5) {
        // Bir sonraki TextField'a odaklanma isteği gönderiyoruz.
        focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        // Önceki TextField'a odaklanma isteği gönderiyoruz.
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModelRead = context.read<AddingCardViewModel>();
    final controllers = viewModelRead.controllers;
    final focusNodes = viewModelRead.focusNodes;

    // * email verisini cekmek icin
    final viewModelWatch = context.watch<AddingCardViewModel>();
    String email = viewModelWatch.state.email;

    return BlocBuilder<AddingCardViewModel, AddingCardState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              L10n.of(context)!.verifyYourCode,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 21,
                color: context.isDark? Colors.white: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  L10n.of(context)!.weSend6DigitsCodeTo,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 113, 111, 111),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  ' $email',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 113, 111, 111),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 40,
                  child: TextField(
                    autofocus: true,
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      // TextField değiştiğinde çağrılan fonksiyon.
                      _onTextFieldChanged(index, value, context);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  L10n.of(context)!.didntGetACode,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 113, 111, 111),
                  ),
                ),
                InkWell(
                  onTap: () {
                    viewModelRead.add(CurrentPageIndexEvent(2));
                  },
                  child: Text(
                    L10n.of(context)!.resend,
                    style: TextStyle(
                      color: context.isDark? Color.fromARGB(191, 124, 48, 254): Color.fromARGB(255, 48, 79, 254),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 400),
            buildButton(
              context,
              label: L10n.of(context)!.verify,
              textColor: context.isDark? (state.isButtonEnabled ? Colors.black54 : Colors.white) : (state.isButtonEnabled ? Colors.white : Colors.black54),
              backgroundColor: state.isFilled
                  ? const Color.fromARGB(249, 48, 79, 255)
                  : Colors.grey,
              hoverColor: const Color.fromARGB(158, 125, 123, 123),
              onPressed: state.isFilled
                  ? () {
                      // viewModelRead.add(SuccessMessageEvent(true));
                      viewModelRead.add(CurrentPageIndexEvent(3));
                      // print(context.read<AddingCardViewModel>().controllers);
                    }
                  : () {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      );
    });
  }
}
