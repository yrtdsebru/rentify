part of 'adding_card_view.dart';

class AddingCardFirstView extends StatelessWidget with CustomWidgets {
  const AddingCardFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  Assets.icons.svg.iconBrand2,// Resim dosya yolu
                  width: 400, // Resim genişliği
                  height: 350, // Resim yüksekliği
                ),
                const SizedBox(height: 30),
                Text(
                  L10n.of(context)!.letsAddYourCard,
                  overflow:
                      TextOverflow.ellipsis, // Metin kesildiğinde üç nokta göster
                  maxLines: 1, // En fazla 1 satır göster
                  style: TextStyle(
                    fontSize: 28,
                    color: context.isDark ? Colors.white: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  L10n.of(context)!.experienceThePower,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: context.isDark ? Color.fromARGB(255, 126, 125, 125) : Color.fromARGB(255, 113, 111, 111),
                  ),
                ),
                const SizedBox(height: 110),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: buildButton(
                    context,
                    label:  L10n.of(context)!.addYourCard,
                    leftIcon: Icons.add,
                    onPressed: () {
                      context
                          .read<AddingCardViewModel>()
                          .add(CurrentPageIndexEvent(1));
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      }
    );
  }
}
