import 'package:yanomic_github_io/util/datetime.dart';

enum School {
  ncu(
      name: "Nanchang University",
      logo: "assets/logos/ncu.jpeg",
      location: "Nanchang, Jiangxi, China",
      homepage: "https://www.ncu.edu.cn/"),
  nju(
      name: "Nanjing University",
      logo: "assets/logos/nju.jpeg",
      location: "Nanjing, Jiangsu, China",
      homepage: "https://www.nju.edu.cn/"),
  ;

  final String name;
  final String logo;
  final String location;
  final String homepage;

  const School(
      {required this.name,
      required this.logo,
      required this.location,
      required this.homepage});
}

class Education {
  final School school;
  final String degree;
  final String field;
  final DateTime startDate;
  final DateTime? endDate;
  final String grade;

  Education(
      {required this.school,
      required this.degree,
      required this.field,
      required this.startDate,
      required this.endDate,
      required this.grade});
  String get duration {
    return DateTimeUtil.different(startDate, endDate);
  }
}
