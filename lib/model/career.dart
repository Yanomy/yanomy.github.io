enum Company {
  worksApplication(
      name: "Works Applications Co., Ltd.",
      logo: "assets/logos/works_applications.jpeg",
      homepage: "https://www.worksap.com/"),
  adyen(
      name: "Adyen ",
      logo: "assets/logos/adyen.jpeg",
      homepage: "https://www.adyen.com/"),
  ;

  final String name;
  final String logo;
  final String homepage;

  const Company(
      {required this.name, required this.logo, required this.homepage});
}

class Position {
  final String title;
  final DateTime startDate;
  final DateTime? endDate;
  final String location;
  final String description;

  Position(
      {required this.title,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.description});
}

class Career {
  final Company company;
  final List<Position> positions;

  Career({required this.company, required this.positions});
}
