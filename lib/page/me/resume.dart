import 'package:flutter/material.dart';
import 'package:yanomy_github_io/model/career.dart';
import 'package:yanomy_github_io/model/education.dart';
import 'package:yanomy_github_io/util/datetime.dart';

List<Career> _careers = [
  Career(company: Company.adyen, positions: [
    Position(
        title: "Team Lead - APM SG",
        startDate: DateTime(2022, 09),
        location: "Singapore"),
    Position(
        title: "Full Stack Java Developer",
        endDate: DateTime(2022, 08),
        startDate: DateTime(2019, 08),
        location: "Singapore"),
  ]),
  Career(company: Company.worksApplication, positions: [
    Position(
        title: "Manager",
        endDate: DateTime(2019, 07),
        startDate: DateTime(2018, 07),
        location: "Singapore"),
    Position(
        title: "Senior Software Engineer",
        endDate: DateTime(2018, 06),
        startDate: DateTime(2016, 12),
        location: "Singapore"),
    Position(
        title: "Software Engineer",
        endDate: DateTime(2016, 11),
        startDate: DateTime(2014, 08),
        location: "Shanghai, China"),
  ]),
];
List<Education> _educations = [
  Education(
    school: School.nju,
    degree: "Master's degree",
    field: "Computer Technology/Computer Systems Technology",
    endDate: DateTime(2014, 07),
    startDate: DateTime(2011, 09),
    grade: "8.53/10",
  ),
  Education(
    school: School.ncu,
    degree: "Bachelor's degree",
    field: "Network Engineering",
    endDate: DateTime(2010, 07),
    startDate: DateTime(2006, 09),
    grade: "8.55/10",
  ),
];

class Resume extends StatelessWidget {
  const Resume({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _buildCareers(context),
        _buildEducations(context),
      ],
    );
  }

  Widget _buildCareers(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Career",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ..._careers.asMap().entries.map(
              (entry) => _buildCareer(context, entry.value, entry.key == 0))
        ],
      ),
    );
  }

  Widget _buildCareer(BuildContext context, Career career, bool isFirst) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isFirst)
          Divider(
            color: Colors.black12,
            height: 32,
          ),
        // company line
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
                dimension: 48, child: Image.asset(career.company.logo)),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  career.company.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(career.duration),
              ],
            )
          ],
        ),
        SizedBox(height: 24),
        // position lines
        ...career.positions.asMap().entries.map((entry) => _buildPosition(
            context, entry.value, entry.key == career.positions.length - 1))
      ],
    );
  }

  Widget _buildPosition(BuildContext context, Position position, bool isLast) {
    return _buildEntry(
        context,
        position.title,
        "${DateTimeUtil.formatYearMonth(position.startDate)} - ${position.endDate == null ? 'Present' : DateTimeUtil.formatYearMonth(position.endDate!)} · ${position.duration}",
        position.location,
        isLast);
  }

  Widget _buildEducations(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Education",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ..._educations.asMap().entries.map(
              (entry) => _buildEducation(context, entry.value, entry.key == 0))
        ],
      ),
    );
  }

  Widget _buildEducation(
      BuildContext context, Education education, bool isFirst) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isFirst)
          Divider(
            color: Colors.black12,
            height: 32,
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
                dimension: 48, child: Image.asset(education.school.logo)),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    education.school.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text("${education.degree}, ${education.field}"),
                  SizedBox(height: 6),
                  Text("Grade: ${education.grade}"),
                  SizedBox(height: 6),
                  Text(
                      "${DateTimeUtil.formatYearMonth(education.startDate)} - ${education.endDate == null ? 'Present' : DateTimeUtil.formatYearMonth(education.endDate!)}"),
                ],
              ),
            ),
            Text(
              education.school.location,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black54),
            )
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildEntry(BuildContext context, String title, String subTitle,
      String location, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 48,
          child: Column(
            children: [
              // the dot
              Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                width: 10,
                height: 10,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              // the line
              if (!isLast)
                Container(
                  width: 1,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                          color: Colors.grey,
                          strokeAlign: BorderSide.strokeAlignCenter)),
                ),
            ],
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(subTitle),
              SizedBox(height: 24),
            ],
          ),
        ),
        Text(
          location,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.black54),
        )
      ],
    );
  }
}
