import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_favorite/favorite_view.dart';
import 'package:rentify/core/constants/ligth_theme_color_constants.dart';
import 'package:rentify/gen/assets.gen.dart';


Widget buildDrawerItem(
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

Widget buildDrawer(context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              buildDrawerItem(
                  title: 'Profile',
                  onPressed: () => context.router.push( const AddingProductViewRoute())),
              buildDrawerItem(
                  title: 'Communication', onPressed: () {}, isVisible: false),
              buildDrawerItem(title: 'Contracts', onPressed: () {}),
              buildDrawerItem(title: 'Settings', onPressed: () => context.router.push(const ProfileViewRoute())),
              buildDrawerItem(title: 'About Us', onPressed: () {}),
              buildDrawerItem(
                  title: 'Log Out',
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ],
          ),
        ),
        const Spacer(),
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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