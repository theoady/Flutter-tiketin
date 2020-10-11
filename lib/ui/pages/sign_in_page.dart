part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //variabel login
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//kondisi
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context.bloc<ThemeBloc>().add(
          ChangeTheme(
            ThemeData().copyWith(primaryColor: Colors.pink[200]),
          ),
        );
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF0F1240),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/Logo.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      // child: Text("Welcome Back,\nExplorer!",
                      //     style: whiteNumberFont.copyWith(fontSize: 20)),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = EmailValidator.validate(text);
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email Address",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Email Address"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (text) {
                        setState(() {
                          isPasswordValid = text.length >= 6;
                        });
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Text(
                          "Forgot Password?",
                          style: greyTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Get Now",
                          style: pinkTextFont.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(top: 40, bottom: 30),
                        child: isSigningIn
                            ? SpinKitFadingCircle(
                                color: Colors.pink[200],
                              )
                            : FloatingActionButton(
                                elevation: 0,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: isEmailValid && isPasswordValid
                                      ? Colors.white
                                      : Color(0xFFBEBEBE),
                                ),
                                backgroundColor: isEmailValid && isPasswordValid
                                    ? Colors.pink[200]
                                    : Color(0xFFE4E4E4),
                                onPressed: isEmailValid && isPasswordValid
                                    ? () async {
                                        setState(() {
                                          isSigningIn = true;
                                        });
                                        SignInSignUpResult result =
                                            await AuthServices.signIn(
                                                emailController.text,
                                                passwordController.text);

                                        if (result.user == null) {
                                          setState(() {
                                            isSigningIn = false;
                                          });

                                          Flushbar(
                                            duration: Duration(seconds: 4),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: Color(0xFFFF5C83),
                                            message: result.message,
                                          )..show(context);
                                        }
                                      }
                                    : null),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Start Fresh Now?",
                          style: greyTextFont.copyWith(
                              fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          child: Text(
                            "Sign Up",
                            style: pinkTextFont,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
