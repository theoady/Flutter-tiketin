part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1240),
      body: LiquidSwipe(
        pages: [
          Center(
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 60),
                    height: 300,
                    child: Lottie.asset('assets/splashscreen1.json'),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Easy Ticket Booking",
                      style: whiteTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                  Text(
                    "Get New Experience\nin booking movie ticket",
                    style: greyTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 60),
                    height: 300,
                    child: Lottie.asset('assets/splashscreen2.json'),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Pick a date and sit",
                      style: whiteTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                  Text(
                    "Pick ticket and sit\neasier than any before",
                    style: greyTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Logo.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35, bottom: 16),
                  child: Text(
                    "Get Your Ticket",
                    style: whiteTextFont.copyWith(fontSize: 20),
                  ),
                ),
                Text(
                  "Watch a new movie much\neasier than any before",
                  style: greyTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 250,
                  height: 46,
                  margin: EdgeInsets.only(top: 70, bottom: 19),
                  child: RaisedButton(
                      child: Text(
                        "Get Started",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      color: secondarypink,
                      onPressed: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToRegistrationPage(RegistrationData()));
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToLoginPage());
                      },
                      child: Text(
                        "Sign In",
                        style: pinkTextFont,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
        enableLoop: true,
        fullTransitionValue: 300,
        positionSlideIcon: 1,
        waveType: WaveType.liquidReveal,
      ),
      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Container(
      //         height: 300,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             image: AssetImage("assets/Logo.png"),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.only(top: 35, bottom: 16),
      //         child: Text(
      //           "New Experience",
      //           style: whiteTextFont.copyWith(fontSize: 20),
      //         ),
      //       ),
      //       Text(
      //         "Watch a new movie much\neasier than any before",
      //         style: greyTextFont.copyWith(
      //             fontSize: 16, fontWeight: FontWeight.w300),
      //         textAlign: TextAlign.center,
      //       ),
      //       Container(
      //         width: 250,
      //         height: 46,
      //         margin: EdgeInsets.only(top: 70, bottom: 19),
      //         child: RaisedButton(
      //             child: Text(
      //               "Get Started",
      //               style: whiteTextFont.copyWith(fontSize: 16),
      //             ),
      //             color: secondarypink,
      //             onPressed: () {
      //               // context
      //               //     .bloc<PageBloc>()
      //               //     .add(GoToRegistrationPage(RegistrationData()));
      //             }),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Text(
      //             "Already have an account?",
      //             style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               // context.bloc<PageBloc>().add(GoToLoginPage());
      //             },
      //             child: Text(
      //               "Sign In",
      //               style: pinkTextFont,
      //             ),
      //           )
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
