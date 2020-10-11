part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isExpired;

  MainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.pink[200]),
          SafeArea(
            child: Container(
              color: Color(0xFF0F1240),
            ),
          ),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[
              MoviePage(),
              TicketPage(isExpiredTicket: widget.isExpired),
              ProfilePage()
            ],
          ),
          createCustomBottomNavBar(),
        ],
      ),
    );
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          // clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: mainColor,
                unselectedItemColor: Colors.white,
                currentIndex: bottomNavBarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    title: Text(
                      "Movies",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset((bottomNavBarIndex == 0)
                            ? "assets/icon/ic_movies.png"
                            : "assets/icon/ic_movies_grey.png")),
                  ),
                  BottomNavigationBarItem(
                    title: Text(
                      "My Tickets",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset((bottomNavBarIndex == 1)
                            ? "assets/icon/ic_tickets.png"
                            : "assets/icon/ic_tickets_grey.png")),
                  ),
                  BottomNavigationBarItem(
                    title: Text(
                      "Profile",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset((bottomNavBarIndex == 2)
                            ? "assets/edit_profile.png"
                            : "assets/user_pic.png")),
                  )
                ]),
          ),
        ),
      );
}
