import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  // Add default class constructor with key parameter, it is requred for every
  // widget. This constructor is used to construct the widget instance.
  const AboutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // As per the new Flutter Lint rules the variables which are declared 
    // locally are not required to have a type. Also the variable which is not 
    // going to be reassigned is required to be marked as final.
     final textTheme = Theme.of(context).textTheme;
     
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Yogacast'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // OVERVIEW SECTION
          AppOverview(textTheme: textTheme),
          const SizedBox(height: 32),
          // DEVELOPER INFO SECTION
          DeveloperInfo(textTheme: textTheme),
          const SizedBox(height: 32),
          // LICENSE SECTION
          LicenseSection(textTheme: textTheme),
        ],
      ),
    );
  }
}

class LicenseSection extends StatelessWidget {


  // As per the new flutter update the parameter which are not optional must
  // be passed as required parameter. This is done to avoid the error.
  // To make an argument required use the required keyword is added.

  const LicenseSection({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('License', style: textTheme.headline6),
        const SizedBox(height: 8),
        const Text(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem '
              'accusantium doloremque laudantium, totam rem aperiam, eaque '
              'ipsa quae ab illo inventore veritatis et quasi architecto '
              'beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem '
              'quia voluptas sit aspernatur aut odit aut fugit, sed quia '
              'consequuntur magni dolores eos qui ratione voluptatem sequi '
              'nesciunt. Neque porro quisquam est, qui dolorem ipsum '
              'quia dolor sit amet, consectetur, adipisci velit, sed quia '
              'non numquam eius modi tempora incidunt ut labore et dolore '
              'magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, '
              'quis nostrum exercitationem ullam corporis suscipit laboriosam, '
              'nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum '
              'iure reprehenderit qui in ea voluptate velit esse quam nihil '
              'molestiae consequatur, vel illum qui dolorem eum fugiat '
              'quo voluptas nulla pariatur?',
        ),
      ],
    );
  }
}

class DeveloperInfo extends StatelessWidget {


  // As per the new flutter update the parameter which are not optional must
  // be passed as required parameter. This is done to avoid the error.
  // To make an argument required use the required keyword is added.


  const DeveloperInfo({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Developer', style: textTheme.headline6),
        const SizedBox(height: 8),
        const Text('Mystic Inc'),
      ],
    );
  }
}

class AppOverview extends StatelessWidget {

  // As per the new flutter update the parameter which are not optional must
  // be passed as required parameter. This is done to avoid the error.
  // To make an argument required use the required keyword is added.
  
  const AppOverview({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Yogacast 2.0', style: textTheme.headline6),
        const SizedBox(height: 32),
        Text('Description', style: textTheme.headline6),
        const SizedBox(height: 8),
        const Text(
  'Yogacast delivers health and wellness information to you in audio format. '
          'Hosted by renowned yoga practitioners.',
        ),
      ],
    );
  }
}
