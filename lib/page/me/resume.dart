import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final bool isSmallScreen;

  const Resume({super.key, required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        shrinkWrap: true,
        children: [
          _buildName(context),
          SizedBox(height: 32),
          _buildAboutMe(context),
          SizedBox(height: 32),
          _buildCareers(context),
          SizedBox(height: 32),
          _buildEducations(context),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Yan Hai", style: Theme.of(context).textTheme.displayLarge),
        SizedBox(height: 4),
        Text(
            "Team Lead | Software Engineer | Problem Solver | Advocate of Domain-Driven Design",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black38)),
      ],
    );
  }

  Widget _buildAboutMe(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ABOUT ME",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Text("""
As an engineer, I bring a profound understanding of the payment ecosystem, with expertise in addressing pain points in transaction flows and enabling seamless solutions across countries and regions. My passion lies in designing and optimizing systems that enhance user experiences and drive efficiency.

As a tech enthusiast, I am deeply interested in backend architecture and related technologies, including messaging systems, microservices, databases, caching solutions, and containerization. I prioritize practical, reliable solutions that solve real-world problems over chasing cutting-edge technologies for their novelty.

As a lead, I have extensive experience managing diverse teams across cultures and time zones. I excel in balancing team priorities, collaborating with cross-functional groups, and fulfilling my own commitments. My adaptable leadership style enables me to align with team dynamics and deliver impactful results.
        """,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black54))
      ],
    );
  }

  Widget _buildCareers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("CAREER",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        ..._careers
            .asMap()
            .entries
            .map((entry) => _buildCareer(context, entry.value, entry.key == 0))
      ],
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
                InkWell(
                  onTap: () => launchUrl(Uri.parse(career.company.homepage),
                      mode: LaunchMode.platformDefault),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    career.company.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  career.duration,
                ),
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
                maxLines: 1,
                overflow: TextOverflow.visible,
                position.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  "${DateTimeUtil.formatYearMonth(position.startDate)} - ${position.endDate == null ? 'Present' : DateTimeUtil.formatYearMonth(position.endDate!)} · ${position.duration}"),
              SizedBox(height: 24),
            ],
          ),
        ),
        if (!isSmallScreen)
          Text(
            maxLines: 1,
            overflow: TextOverflow.visible,
            position.location,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black54),
          )
      ],
    );
  }

  Widget _buildEducations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("EDUCATION",
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        ..._educations.asMap().entries.map(
            (entry) => _buildEducation(context, entry.value, entry.key == 0))
      ],
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
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(education.school.homepage),
                        mode: LaunchMode.platformDefault),
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      education.school.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    "${education.degree}, ${education.field}",
                  ),
                  SizedBox(height: 6),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    "Grade: ${education.grade}",
                  ),
                  SizedBox(height: 6),
                  Text(
                    "${DateTimeUtil.formatYearMonth(education.startDate)} - ${education.endDate == null ? 'Present' : DateTimeUtil.formatYearMonth(education.endDate!)}",
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
            if (!isSmallScreen)
              Text(
                maxLines: 1,
                overflow: TextOverflow.visible,
                education.school.location,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black54),
              )
          ],
        ),

      ],
    );
  }
}
