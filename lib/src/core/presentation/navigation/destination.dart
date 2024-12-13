enum Destination {
  home("/"),
  login("/login"),
  teamSelection("/team"),
  truckSelection("/truck"),
  ;

  final String path;

  const Destination(this.path);

  static Destination parse(String? value) {
    return Destination.values.firstWhere((route) => route.path == value,
        orElse: () => Destination.home);
  }
}
