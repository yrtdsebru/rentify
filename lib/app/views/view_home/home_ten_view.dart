import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_favorite/favorite_view.dart';
import 'package:rentify/app/views/view_home/home_view.dart';
import 'package:rentify/app/views/view_home/view_model/home_event.dart';
import 'package:rentify/app/views/view_home/view_model/home_state.dart';
import 'package:rentify/app/views/view_home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:rentify/app/views/view_profile/profile_view.dart';
import 'package:rentify/core/widgets/drawer_widget.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentify/app/views/view_notification/notification_view.dart';
import 'package:rentify/app/views/view_reservation/reservation_view.dart';
import 'package:rentify/core/constants/ligth_theme_color_constants.dart';
import 'package:rentify/core/widgets/context_widgets.dart';

@RoutePage()
// ignore: must_be_immutable
class HomeTenView extends StatelessWidget with CustomWidgets {
  HomeTenView({super.key});

  List<Widget> pages = [
    const HomeView(),
    const FavoriteView(),
    //const AddingCarView(), //floatingActionButton gibi eklicem.
    const ReservationView(),
    const ProfileView() //const NotificationView()
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
                    label: 'Home'),
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