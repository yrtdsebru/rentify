import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:rentify/gen/assets.gen.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(bool) onDateSelected;
  const CustomDatePicker({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime dateTime;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    dateTime = DateTime(2023, 2, 1, 10, 20);
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.calendar_today,
          color: Color(0xFF304FFE),
        ),
        contentPadding: const EdgeInsets.all(10),
        hintText: L10n.of(context)!.selectDate,
        hintStyle: const TextStyle(
          color: Color(0xFFd0d0d0),
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFd0d0d0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFd0d0d0),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
      readOnly: true,
      controller: _textEditingController,
      onTap: () async {
        final selectedDate = await showCupertinoModalPopup<DateTime>(
          context: context,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color:
                  //     context.isDark ? Color(0xFF121212) : Color(0xffFFFFFF)
                      ),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, dateTime);
                    },
                    child: Text(
                      L10n.of(context)!.done,
                      style: const TextStyle(color: Color(0xFF304FFE)),
                    ),
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      maximumDate: DateTime.now(),
                      initialDateTime: dateTime,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() {
                          dateTime = newTime;
                        });
                      },
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                ],
              ),
            );
          },
        );

        if (selectedDate != null) {
          final bool isOver18 =
              DateTime.now().difference(dateTime).inDays >= 365 * 18;
          if (!isOver18) {
            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              builder: (ctx) {
                return CupertinoAlertDialog(
                  title: Text(
                    L10n.of(context)!.ageRestriction,
                    // style: TextStyle(
                    //     color: context.isDark
                    //         ? AppDarkColorConstants.contentPrimary
                    //         : AppLightColorConstants.contentPrimary),
                  ),
                  content: Text(
                    L10n.of(context)!.ageValidationMessage,
                    // style: TextStyle(
                    //     color: context.isDark
                    //         ? AppDarkColorConstants.contentPrimary
                    //         : AppLightColorConstants.contentPrimary),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        L10n.of(context)!.okay,
                        style: const TextStyle(color: Color(0xFF304FFE)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            );
          } else {
            setState(() {
              dateTime = selectedDate;
              widget.onDateSelected(true);
              _textEditingController.text =
                  '${dateTime.month}-${dateTime.day}-${dateTime.year}';
            });
          }
        }
      },
    );
  }
}

class customDropDown extends StatefulWidget {
  const customDropDown({Key? key});

  @override
  State<customDropDown> createState() => _customDropDownState();
}

class _customDropDownState extends State<customDropDown> {
  final Map<String, dynamic> _dropdownItems = {
    "Japan": Assets.icons.svg.iconFlagJp,
    "Turkey": Assets.icons.svg.iconFlagTr,
    "ABD": Assets.icons.svg.iconUS,
    "Greece": Assets.icons.svg.iconFlagGR
  };

  String _dropDownValue = "Turkey";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 22, left: 13),
        child: DropdownButton(
          elevation: 8,
          isExpanded: true,
          iconSize: 25.0,
          dropdownColor: context.isDark ? Colors.black : Colors.white,
          // style: TextStyle(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          underline: const SizedBox(),
          value: _dropDownValue,
          items: _dropdownItems.entries.map((entry) {
            return DropdownMenuItem(
                value: entry.key,
                child: Row(
                  children: [
                    SvgPicture.asset(entry.value),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(entry.key),
                  ],
                ));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _dropDownValue = value.toString();
              print(value);
            });
          },
        ),
      ),
    );
  }
}