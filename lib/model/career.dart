import 'package:yanomy_github_io/util/datetime.dart';

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
  final String? description;

  Position(
      {required this.title,
      required this.startDate,
      this.endDate,
      required this.location,
      this.description});

  String get duration {
    return DateTimeUtil.different(startDate, endDate);
  }
}

class Career {
  final Company company;
  final List<Position> positions;

  Career({required this.company, required this.positions});

  String get duration {
    var start = DateTime.now();
    var end = DateTime(1988);
    for (var p in positions) {
      if (p.startDate.isBefore(start)) {
        start = p.startDate;
      }
      if(p.endDate?.isAfter(end)??false){
        end = p.endDate!;
      }
    }
    return DateTimeUtil.different(start, end);
  }
}
