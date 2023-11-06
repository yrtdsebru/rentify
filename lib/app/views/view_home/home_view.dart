import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentify/app/views/view_adding_car/adding_car_view.dart';
import 'package:rentify/app/views/view_favorite/favorite_view.dart';
import 'package:rentify/app/views/view_flow/flow_view.dart';
import 'package:rentify/app/views/view_home/view_model/home_event.dart';
import 'package:rentify/app/views/view_home/view_model/home_state.dart';
import 'package:rentify/app/views/view_home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentify/app/views/view_notification/notification_view.dart';
import 'package:rentify/app/views/view_reservation/reservation_view.dart';
import 'package:rentify/core/constants/ligth_theme_color_constants.dart';
import 'package:rentify/core/widgets/context_widgets.dart';

@RoutePage()
// ignore: must_be_immutable
class HomeView extends StatelessWidget with CustomWidgets {
  HomeView({super.key});

  List<Widget> pages = [
    const FlowView(),
    const FavoriteView(),
    const AddingCarView(), //floatingActionButton gibi eklicem.
    const ReservationView(),
    const NotificationView()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeViewModel(),
        child: BlocBuilder<HomeViewModel, HomeState>(builder: (context, state) {
          return Scaffold(
            appBar: transparentAppBar(
              context,
              () {},
              elevation: 0.3,
              leading: null,
              //actions: null,
              title: 'rentify',
              titleTextStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            body: pages[state.pageIndex],
            endDrawer: buildDrawer(context),
            floatingActionButton: Transform.scale(
              scale: 1.32,
              child: FloatingActionButton(
                backgroundColor: AppLightColorConstants.buttonPrimaryColor,
                onPressed: () {context.read<HomeViewModel>().add(PageIndexEvent(2));},
                child: const Icon(Icons.add),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 35,
              type: BottomNavigationBarType.fixed,
              currentIndex: state.pageIndex,
              onTap: (value) {
                context.read<HomeViewModel>().add(PageIndexEvent(value));
              },
              unselectedItemColor: AppLightColorConstants.buttonDisabledColor,
              selectedItemColor: AppLightColorConstants.buttonPrimaryColor,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: 'Add Car'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today), label: 'Reservation'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'Notification'),
              ],
            ),
          );
        }));
  }
}

buildDrawerItem(
    {required String title,
    required Function onPressed,
    Color color = Colors.black,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
    double height = 45,
    bool isVisible = false}) {
  return SizedBox(
    height: height,
    child: ListTile(
      contentPadding: const EdgeInsets.all(0),
      // minVerticalPadding: 0,
      dense: true,
      onTap: () => onPressed(),
      title: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: fontSize, fontWeight: fontWeight, color: color),
          ),
          const SizedBox(
            width: 5,
          ),
          isVisible
              ? CircleAvatar(
                  backgroundColor: AppLightColorConstants.buttonPrimaryColor,
                  radius: 15,
                  child: Text(
                    '1',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                )
              : Container()
        ],
      ),
    ),
  );
}

buildDrawer(context) {
  return Drawer(
    backgroundColor: AppLightColorConstants.buttonPrimaryColor,
    child: Column(
      children: [
        InkWell(
          onTap: () {
            context.router.push(const FavoriteView());
          },
          child: SizedBox(
            height: 150,
            child: DrawerHeader(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage(Assets.icons.svg.iconFillUser),fit: BoxFit.fill,)),
                  // authController.myUser.value.image == null
                  //     ? const DecorationImage(
                  //         image: AssetImage('assets/person.png'),
                  //         fit: BoxFit.fill)
                  //     : DecorationImage(
                  //         image: NetworkImage(
                  //             authController.myUser.value.image!),
                  //         fit: BoxFit.fill)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hello',
                          style: GoogleFonts.poppins(
                              color: Colors.black.withOpacity(0.28),
                              fontSize: 14)),
                      Text(
                        'Ebru',
                        // authController.myUser.value.name == null
                        //     ? "Mark"
                        //     : authController.myUser.value.name!,
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              buildDrawerItem(
                  title: 'Profile',
                  onPressed: () => context.router.push(const AddingCarView())),
              buildDrawerItem(
                  title: 'Communication', onPressed: () {}, isVisible: false),
              buildDrawerItem(title: 'Contracts', onPressed: () {}),
              buildDrawerItem(title: 'Settings', onPressed: () {}),
              buildDrawerItem(title: 'About Us', onPressed: () {}),
              buildDrawerItem(
                  title: 'Log Out',
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ],
          ),
        ),
        Spacer(),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              buildDrawerItem(
                  title: 'Do more',
                  onPressed: () {},
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.15),
                  height: 20),
              const SizedBox(
                height: 20,
              ),
              buildDrawerItem(
                title: 'Rate us on store',
                onPressed: () {},
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.15),
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
