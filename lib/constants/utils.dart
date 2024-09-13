import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const base_url = "https://cryptude-api.herokuapp.com";

class MyButtons {
  static const kWelcomeTextStyle = TextStyle(
    color: AppColors.primaryColorBlue,
    fontSize: 20.4,
    letterSpacing: 2.1,
  );

  static BoxDecoration loginButton = const BoxDecoration(
      color: AppColors.primaryColorBlue,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: AppColors.referralTxtColor2,
          //spreadRadius: 2,
          blurRadius: 3,
        )
      ]);

  static BoxDecoration loginButtonWithBorders = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      //border: Border.all(width: 3, color: AppColors.referralTxtColor2),
      boxShadow: [
        BoxShadow(
          color: AppColors.referralTxtColor2,
          //spreadRadius: 2,
          blurRadius: 3,
        )
      ]);

  coration(
      {color = Colors.white,
      borderRadius = const BorderRadius.all(Radius.circular(10)),
      boxShadow = const [
        BoxShadow(color: AppColors.referralTxtColor2, blurRadius: 3)
      ]}) {
    // TODO: implement coration
    throw UnimplementedError();
  }
}

class RegisterStyles {
  static const subBody1 = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
}

class AppColors {
  static const primaryColorBlue = Color(0xFF1520A6);
  //static const primaryColorBlue = Color(0xFF1C8AFF);
  static final secondaryColorBlue = Color(0xFF9991f6);

  static final accentColor = Color(0xFFFC6752);

  static final semanticBottomNavigationItemColor = Color(0xFFFFB461);
  static const neutralBlackColor = Color(0xFFFFB461);
  static const neutralBlackColor2 = Color(0xFFBDBCBC);
  static const referralTxtColor1 = Color(0xFFB2ADEC);
  static const referralTxtColor1real = Color(0xFFF1F2F4);
  static const referralSecondCard = Color(0xFFE5E5EB);
  static const referralTxtColor2 = Color(0xFF50565A);
  static const try4 = Color(0xFF383838);
  static const cardColor = Color(0xFFBDBCBC);
  static const cardColorBorder = Color(0xFF77808D);
  static const textCardColorBorder = Color(0xFF23262F);

  static const referralBonus = Color(0xFFBDBCBC);
  static const sellCryptoDone = Color(0xFF34DFDD);
  static const chatReceiver = Color(0xFFBDBCBC);
}

class AllStyle {
  static final text1 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.primaryColorBlue,
  );

  static final buttonTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.white,
  );

  static final text2 = GoogleFonts.poppins(
      fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500);

  static final bigText = GoogleFonts.poppins(
      fontSize: 17, color: Colors.black, fontWeight: FontWeight.w900);

  static final text3 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );

  static final text4 = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.black,
  );

  static final text5 = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.try4,
  );

  static final text6 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );

  static final text7 = GoogleFonts.poppins(
    fontSize: 27,
    color: Colors.black,
  );

  static final text8 = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.primaryColorBlue,
  );

  static final text9 = GoogleFonts.poppins(
    fontSize: 12,
    color: Colors.black,
  );

  static final text10 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.textCardColorBorder,
  );

  static final text11 = GoogleFonts.poppins(
    fontSize: 20,
    color: AppColors.try4,
  );

  static final text12 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.try4,
  );

  static final text13 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.try4,
  );

  static final text14 = GoogleFonts.poppins(
    fontSize: 32,
    color: AppColors.try4,
  );

  static final buttonTextStyle4Register = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.primaryColorBlue,
  );

  static final chatStyle1 = GoogleFonts.poppins(
    fontSize: 12,
    color: Colors.black,
  );

  static final chatStyle2 = GoogleFonts.poppins(
    fontSize: 12,
    color: Colors.white,
  );

  static final text15 = GoogleFonts.poppins(
    fontSize: 20,
    color: AppColors.try4,
  );
  static final text16 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.sellCryptoDone,
  );

  static final text17 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static final amountBig = GoogleFonts.poppins(
    fontSize: 21,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static final cedisBig = GoogleFonts.poppins(
    fontSize: 21,
    color: AppColors.sellCryptoDone,
    fontWeight: FontWeight.w700,
  );

  static final hintStyle = GoogleFonts.poppins(
    fontSize: 12,
    color: Colors.grey,
  );

  static final avatarColor = GoogleFonts.poppins(
    fontSize: 17,
    color: Colors.blue,
  );
  static final FAQTM = GoogleFonts.poppins(
    fontSize: 21,
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );

  static final history = GoogleFonts.poppins(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);
}
