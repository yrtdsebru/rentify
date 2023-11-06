import 'package:rentify/app/app.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.dart';
import 'package:rentify/app/theme/dark_theme_data.dart';
import 'package:rentify/app/theme/light_theme_data.dart';
import 'package:rentify/app/views/view_profile/view_model/profile_event.dart';
import 'package:rentify/app/views/view_profile/view_model/profile_state.dart';
import 'package:rentify/app/views/view_profile/view_model/profile_view_model.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:rentify/core/widgets/context_widgets.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileView extends StatelessWidget with CustomWidgets {
  const ProfileView({super.key});

  void isDarkMode(
    bool event,
    BuildContext context,
  ) {
    context.read<ProfileViewModel>().add(DarkModeEvent(event));
    event
        ? App.setTheme(context, AppThemeDark.getTheme())
        : App.setTheme(context, AppThemeLight.getTheme());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileViewModel(),
        child: BlocBuilder<ProfileViewModel, ProfileState>(
          builder: (context, state) {
            return Scaffold(
              appBar: transparentAppBar(
                context,
                () {
                  context.router.pop();
                },
                title: L10n.of(context)!.myProfile,
                titleTextStyle:
                    Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.isDark ? Colors.white : Colors.black,
                        ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  // liste yontemiyle assa kaydirma islemini tamamlar.
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch, // witgetlari genisletir.
                    children: [
                      Card(
                        elevation: 0.1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.all(16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      Assets.icons.svg.iconEdit,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.grey, BlendMode.srcIn),
                                    ),
                                    onPressed: () {
                                      // context.router
                                      //     .push(const UserInfoViewRoute());
                                    },
                                  )
                                ],
                              ),
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: const NetworkImage(
                                    'https://randomuser.me/api/portraits/men/11.jpg'),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: InkWell(
                                    onTap: () {
                                      // context.router
                                      //     .push(const UserInfoViewRoute());
                                    },
                                    child: SvgPicture.asset(
                                        Assets.icons.svg.iconCamera,
                                        width: 25,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.grey, BlendMode.srcIn)),
                                  ),
                                ),
                              ),
                              const Text(
                                'Mehedi Hasan',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'hello@gmail.com',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Colors.grey,
                                ),
                              ),
                              const Text(
                                '+852054156545',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.69,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListView(
                                      shrinkWrap: false,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                              top: 8,
                                              left: 8,
                                              right: 10,
                                            ),
                                            leading: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.grey.withOpacity(1),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  Assets.icons.svg.iconMoon,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              L10n.of(context)!.darkMode,
                                            ),
                                            trailing: Transform.scale(
                                              scale: 0.8,
                                              child: CupertinoSwitch(
                                                value: context
                                                        .read<
                                                            ProfileViewModel>()
                                                        .state
                                                        .isSwitch
                                                    ? true
                                                    : false,
                                                onChanged: (value) =>
                                                    isDarkMode(value, context),
                                              ),
                                            )),
                                        const Divider(
                                          endIndent: 20,
                                          thickness: 1,
                                        ),
                                        ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 8,
                                              right: 16,
                                            ),
                                            leading: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.blue
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                  child: SvgPicture.asset(
                                                Assets.icons.svg.iconUser,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        Colors.blue,
                                                        BlendMode.srcIn),
                                              )),
                                            ),
                                            title: Text(
                                                L10n.of(context)!.personalInfo),
                                            onTap: () {
                                              // context.router.push(
                                              //     const UserInfoViewRoute());
                                            },
                                            trailing: Transform.scale(
                                              scale: 0.9,
                                              child: const Icon(Icons
                                                  .arrow_forward_ios_rounded),
                                            )),
                                        const Divider(
                                          endIndent: 20,
                                          thickness: 1,
                                        ),
                                        ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 8,
                                              right: 16,
                                            ),
                                            leading: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.orange
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                  child: SvgPicture.asset(
                                                Assets.icons.svg.iconBank,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        Colors.orange,
                                                        BlendMode.srcIn),
                                              )),
                                            ),
                                            title: Text(
                                                L10n.of(context)!.bankAndCards),
                                            onTap: () {
                                              // context.router.push(
                                              //     const AddingCardViewRoute());
                                            },
                                            trailing: Transform.scale(
                                              scale: 0.9,
                                              child: const Icon(Icons
                                                  .arrow_forward_ios_rounded),
                                            )),
                                        const Divider(
                                          endIndent: 20,
                                          thickness: 1,
                                        ),
                                        ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 8,
                                              right: 16,
                                            ),
                                            leading: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.red.withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  Assets.icons.svg
                                                      .iconCreditCardChange,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.red,
                                                          BlendMode.srcIn),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              L10n.of(context)!.transaction,
                                            ),
                                            trailing: Transform.scale(
                                              scale: 0.9,
                                              child: const Icon(Icons
                                                  .arrow_forward_ios_rounded),
                                            )),
                                        const Divider(
                                          endIndent: 20,
                                          thickness: 1,
                                        ),
                                        ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 8,
                                              right: 16,
                                            ),
                                            leading: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.blue
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  Assets.icons.svg.iconSettings,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.blue,
                                                          BlendMode.srcIn),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                                L10n.of(context)!.settings),
                                            onTap: () {
                                              // context.router.push(
                                              //     const SettingsViewRoute());
                                            },
                                            trailing: Transform.scale(
                                              scale: 0.9,
                                              child: const Icon(Icons
                                                  .arrow_forward_ios_rounded),
                                            )),
                                        const Divider(
                                          endIndent: 20,
                                          thickness: 1,
                                        ),
                                        ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 8,
                                              right: 16,
                                            ),
                                            leading: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.green
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  Assets.icons.svg.iconDatabase,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.green,
                                                          BlendMode.srcIn),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                                L10n.of(context)!.dataPrivacy),
                                            trailing: Transform.scale(
                                              scale: 0.9,
                                              child: const Icon(Icons
                                                  .arrow_forward_ios_rounded),
                                            )),
                                        const Divider(
                                          endIndent: 20,
                                          thickness: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
