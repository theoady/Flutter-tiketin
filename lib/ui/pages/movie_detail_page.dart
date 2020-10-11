part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> credits;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          backgroundColor: Color(0xFF0F1240),
          body: FutureBuilder(
              future: MovieServices.getDetails(movie),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  movieDetail = snapshot.data;
                  return FutureBuilder(
                      future: MovieServices.getCredits(movie.id),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          credits = snapshot.data;

                          return ListView(
                            children: <Widget>[
                              MovieDetailCard(movieDetail),
                              //note : credits
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: defaultMargin, bottom: 12),
                                    child: Text(
                                      "Cast & Crew",
                                      style:
                                          whiteTextFont.copyWith(fontSize: 14),
                                    )),
                              ),
                              FutureBuilder(
                                  future: MovieServices.getCredits(movie.id),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      credits = snapshot.data;
                                      return SizedBox(
                                        height: 115,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: credits.length,
                                            itemBuilder: (_, index) =>
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: (index == 0)
                                                            ? defaultMargin
                                                            : 0,
                                                        right: (index ==
                                                                credits.length -
                                                                    1)
                                                            ? defaultMargin
                                                            : 16),
                                                    child: CreditCard(
                                                        credits[index]))),
                                      );
                                    } else {
                                      return SizedBox(
                                          height: 50,
                                          child: SpinKitFadingCircle(
                                            color: Colors.pink[200],
                                          ));
                                    }
                                  }),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    defaultMargin, 24, defaultMargin, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Storyline",
                                    style: whiteNumberFont,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 30),
                                child: Text(
                                  movie.overview,
                                  style: greyTextFont.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              // note: BUTTON
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 0),
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    color: Colors.pink[200],
                                    child: Text(
                                      "Continue to Book",
                                      style:
                                          whiteTextFont.copyWith(fontSize: 16),
                                    ),
                                    onPressed: () {
                                      context.bloc<PageBloc>().add(
                                          GoToSelectSchedulePage(movieDetail));
                                    }),
                              ),
                              SizedBox(height: defaultMargin)
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      });
                } else {
                  return SizedBox();
                }
              })),
    );
  }
}
