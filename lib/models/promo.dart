part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
      {@required this.title, @required this.discount, @required this.subtitle});

  @override
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  Promo(
      title: "Student Promo",
      discount: 50,
      subtitle: "Maximal only for two people"),
  Promo(
      title: "Team Promo", discount: 70, subtitle: "Maximal for three members"),
  Promo(title: "Annual Promo", discount: 40, subtitle: "Min, one year")
];
