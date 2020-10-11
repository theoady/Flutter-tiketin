part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("CGV Transmart Solo"),
  Theater("XXI Solo Paragon"),
  Theater("XXI Solo Grand Mall"),
  Theater("XXI The Park Solobaru"),
];
