import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentify/core/extension/context_extension.dart';
import 'package:rentify/gen/assets.gen.dart';

Widget introWidget(BuildContext context){
  return Container(
    width: context.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(Assets.images.png.mask.path),
        fit: BoxFit.cover
      )
    ),
    height: context.height*0.53,

    child: Center(
        child: SvgPicture.asset(Assets.icons.svg.iconBrand3),
    ),
  );
}

Widget introWidgetWithoutLogos(BuildContext context,{String title = "Profile Settings",String? subtitle}){
  return Container(
    width: context.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.images.png.mask.path),
            fit: BoxFit.fill
        )
    ),
    height: context.height*0.3,
    child: Container(
        height: context.height*0.1,
        width: context.width,
        margin: EdgeInsets.only(bottom: context.height*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
            if(subtitle != null) Text(subtitle,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),

          ],
        )),

  );
}