part of 'widgets.dart';

class MovieDetailCard extends StatelessWidget {
  final MovieDetail movie;

  MovieDetailCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 260,
          width: double.infinity,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image:
                      NetworkImage(imageBaseURL + "w780" + movie.backdropPath),
                  fit: BoxFit.cover)),
          child: Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.pink[100].withOpacity(1),
                  Colors.deepPurple[900].withOpacity(0)
                ])),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            movie.title,
            style: whiteNumberFont.copyWith(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
            child: Text(movie.genresAndLanguage,
                style: whiteNumberFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w100))),
        Container(
            height: 30,
            width: 140,
            child: RatingStars(voteAverage: movie.voteAverage)),
      ],
    );
  }
}
