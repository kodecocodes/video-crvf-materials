import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("About Yogacast"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // OVERVIEW SECTION
          Text("Yogacast 2.0", style: textTheme.headline6),
          SizedBox(height: 32),
          Text("Description", style: textTheme.headline6),
          SizedBox(height: 8),
          Text(
            "Yogacast delivers health and wellness information to you in audio format. "
            "Hosted by renowned yoga practitioners.",
          ),
          SizedBox(height: 32),
          // DEVELOPER INFO SECTION
          Text("Developer", style: textTheme.headline6),
          SizedBox(height: 8),
          Text("Mystic Inc"),
          SizedBox(height: 32),
          // LICENSE SECTION
          Text("License", style: textTheme.headline6),
          SizedBox(height: 8),
          Text(
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem "
                "accusantium doloremque laudantium, totam rem aperiam, eaque "
                "ipsa quae ab illo inventore veritatis et quasi architecto "
                "beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem "
                "quia voluptas sit aspernatur aut odit aut fugit, sed quia "
                "consequuntur magni dolores eos qui ratione voluptatem sequi "
                "nesciunt. Neque porro quisquam est, qui dolorem ipsum "
                "quia dolor sit amet, consectetur, adipisci velit, sed quia "
                "non numquam eius modi tempora incidunt ut labore et dolore "
                "magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, "
                "quis nostrum exercitationem ullam corporis suscipit laboriosam, "
                "nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum "
                "iure reprehenderit qui in ea voluptate velit esse quam nihil "
                "molestiae consequatur, vel illum qui dolorem eum fugiat "
                "quo voluptas nulla pariatur?",
          ),
        ],
      ),
    );
  }
}
