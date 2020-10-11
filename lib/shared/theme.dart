part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xFF503E9D);
Color accentColor1 = Color(0xFF2C1F63);
Color accentColor2 = Colors.pink[200];
Color accentColor3 = Color(0xFFADADAD);

Color secondarypink = Color(0xFFFB93D5);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle pinkTextFont = GoogleFonts.raleway()
    .copyWith(color: secondarypink, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle pinkNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.pink[200]);

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);
