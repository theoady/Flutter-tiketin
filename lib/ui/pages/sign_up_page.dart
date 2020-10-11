part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<ThemeBloc>().add(
          ChangeTheme(
            ThemeData().copyWith(primaryColor: Colors.pink[200]),
          ),
        );

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: Color(0xFF0F1240),
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 22),
                    height: 56,
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Create New\nAccount",
                          style: whiteTextFont.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: 90,
                    height: 104,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (widget.registrationData.profileImage ==
                                        null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(
                                        widget.registrationData.profileImage),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (widget.registrationData.profileImage ==
                                  null) {
                                widget.registrationData.profileImage =
                                    await getImage();
                              } else {
                                widget.registrationData.profileImage = null;
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      (widget.registrationData.profileImage ==
                                              null)
                                          ? "assets/btn_add_photo.png"
                                          : "assets/btn_del_photo.png"),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Full Name"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Email"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
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
                        hintText: "Password"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    controller: retypePasswordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Confirm Password"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    backgroundColor: Colors.pink[200],
                    elevation: 0,
                    onPressed: () {
                      if (!(nameController.text.trim() != "" &&
                          emailController.text.trim() != "" &&
                          passwordController.text.trim() != "" &&
                          retypePasswordController.text.trim() != "")) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Please fill all the fields",
                        )..show(context);
                      } else if (passwordController.text !=
                          retypePasswordController.text) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Missmatch password and Confirm Password",
                        )..show(context);
                      } else if (passwordController.text.length < 6) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Password's length min 6 characters",
                        )..show(context);
                      } else if (!EmailValidator.validate(
                          emailController.text)) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Wrong formatted email address",
                        )..show(context);
                      } else {
                        widget.registrationData.name = nameController.text;
                        widget.registrationData.email = emailController.text;
                        widget.registrationData.password =
                            passwordController.text;

                        //to do goto preference page
                        context
                            .bloc<PageBloc>()
                            .add(GoToPreferencePage(widget.registrationData));
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
