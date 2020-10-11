part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      // note: Header
      Container(
        decoration: BoxDecoration(
          color: Color(0xFF0F1240),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadURL) {
                  imageFileToUpload = null;
                  context
                      .bloc<UserBloc>()
                      .add(UpdateData(profileImage: downloadURL));
                });
              }
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: Image.asset("assets/logo-text.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToProfilePage());
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.deepPurple[200], width: 1),
                          ),
                          child: Stack(children: <Widget>[
                            SpinKitFadingCircle(
                                color: Colors.pink[200], size: 50),
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: ((userState
                                                    .user.profilePicture ==
                                                "")
                                            ? AssetImage("assets/user_pic.png")
                                            : NetworkImage(
                                                userState.user.profilePicture)),
                                        fit: BoxFit.cover)))
                          ]),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            child: Text(
                              userState.user.name,
                              style: whiteTextFont.copyWith(fontSize: 18),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToWalletPage(GoToMainPage()));
                            },
                            child: Text(
                              NumberFormat.currency(
                                      locale: "id_ID",
                                      decimalDigits: 0,
                                      symbol: "IDR ")
                                  .format(userState.user.balance),
                              style: whiteTextFont.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 46,
                          width: 46,
                          margin: EdgeInsets.only(left: 100),
                          child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: Colors.pink[200],
                            child: SizedBox(
                              height: 26,
                              width: 26,
                              child: Icon(
                                MdiIcons.walletPlus,
                                color: Colors.white.withOpacity(0.54),
                              ),
                            ),
                            onPressed: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToTopUpPage(GoToMainPage()));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: Colors.pink[200],
                size: 50,
              );
            }
          },
        ),
      ),
      //note : Now Playing
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
        child: Text(
          'Now Playing',
          style:
              whiteTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 140,
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(0, 9);

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin : 0,
                      right: (index == movies.length - 1) ? defaultMargin : 16),
                  child: MovieCard(
                    movies[index],
                    onTap: () {
                      context
                          .bloc<PageBloc>()
                          .add(GoToMovieDetailPage(movies[index]));
                    },
                  ),
                ),
              );
            } else {
              return SpinKitFadingCircle(color: Colors.pink[200], size: 50);
            }
          },
        ),
      ),
      //note: Browse Movie
      // Container(
      //   margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
      //   child: Text(
      //     "Browse Movie",
      //     style:
      //         whiteTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      //   ),
      // ),
      // BlocBuilder<UserBloc, UserState>(
      //   builder: (_, userState) {
      //     if (userState is UserLoaded) {
      //       return Container(
      //         margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      //         child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: List.generate(
      //                 userState.user.selectedGenres.length,
      //                 (index) =>
      //                     BrowseButton(userState.user.selectedGenres[index]))),
      //       );
      //     } else {
      //       return SpinKitFadingCircle(
      //         color: Colors.pink[200],
      //         size: 50,
      //       );
      //     }
      //   },
      // ),

      //note : Coming Soon
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
        child: Text(
          'Coming Soon',
          style:
              whiteTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 140,
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(10);

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin : 0,
                      right: (index == movies.length - 1) ? defaultMargin : 16),
                  child: ComingsoonCard(movies[index]),
                ),
              );
            } else {
              return SpinKitFadingCircle(color: Colors.pink[200], size: 50);
            }
          },
        ),
      ),
      //note : Promo
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
        child: Text(
          'Promo Of The Day',
          style:
              whiteTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Column(
        children: dummyPromos
            .map((e) => Padding(
                  padding:
                      EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                  child: PromoCard(e),
                ))
            .toList(),
      ),
      SizedBox(height: 100)
    ]);
  }
}
