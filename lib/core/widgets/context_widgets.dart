import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentify/core/constants/ligth_theme_color_constants.dart';
import 'package:rentify/core/extension/context_extension.dart';

mixin CustomWidgets {
  PreferredSizeWidget transparentAppBar(
      BuildContext context, VoidCallback onBackButtonPressed, {double? elevation, Widget? leading, List<Widget>? actions,
      String title = '', TextStyle? titleTextStyle}) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: Center(
          child: Text(
            title,
            style: titleTextStyle ??
                const TextStyle(), // Eğer titleTextStyle null ise, default bir TextStyle kullanılır.
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: elevation??0,
      leading: leading==null?null: IconButton(
        icon: const Icon(Icons.navigate_before),
        tooltip: 'Back',
        color: AppLightColorConstants.contentOnColor,
        onPressed: onBackButtonPressed,
        style: const ButtonStyle(),
      ),
      actions: actions==null? null: <Widget>[
        IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: const Icon(Icons.menu_outlined),),
      ],
    );
  }

  Widget textInput(
    String label,
    String hintText,
    BuildContext context,
    TextEditingController controller, {
    TextInputType? keyboardType,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isIcon = false,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(label,
            style: TextStyle(
                color: context.isDark
                    ? const Color.fromRGBO(184, 184, 184, 0.8)
                    : Colors.black)),
        const SizedBox(height: 10),
        SizedBox(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            inputFormatters: inputFormatters,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10, left: 10),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                color:  Color.fromRGBO(184, 184, 184, 0.8),
              ),
              fillColor: context.isDark ? Colors.transparent : Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }

  Widget buildButton(
    BuildContext context, {
    required String label,
    required Function onPressed,
    Color backgroundColor = AppLightColorConstants.buttonPrimaryColor,
    Color hoverColor = AppLightColorConstants.primaryColor,
    double width = double.infinity,
    IconData? leftIcon,
    IconData? rightIcon,
    double iconSize = 18,
    double elevation = 1,
    Color textColor = AppLightColorConstants.contentOnColor,
    Color borderColor = Colors.transparent,
    TextStyle? textStyle, 
  }) {
    return SizedBox(
      width: width, // Genişlik burada ayarlanır
      child: FloatingActionButton.extended(
        onPressed: () {
          onPressed();
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) Icon(leftIcon, size: iconSize),
            Text(
              label,
              style: textStyle ??
                  TextStyle(
                      color:
                          textColor), // Eğer textStyle null ise, default bir TextStyle kullanılır.
            ),
            if (rightIcon != null) Icon(rightIcon, size: iconSize),
          ],
        ),
        backgroundColor: backgroundColor,
        hoverColor: hoverColor,
        elevation: elevation, // Gölgeyi kaldırmak için elevation sıfır
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: borderColor), // borderColor parametresi kullanıldı
        ),
      ),
    );
  }
}
