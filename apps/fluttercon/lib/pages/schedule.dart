import 'package:jaspr/jaspr.dart';

import '../components/pages_nav.dart';
import '../components/session_card.dart';
import '../components/session_list.dart';
import '../models/session.dart';

class SchedulePage extends StatelessComponent {
  SchedulePage({required this.day, required this.sessions, super.key});

  final int day;
  final List<Session> sessions;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Head(meta: {
      'description': "Schedule of all sessions on day $day.",
      'keywords': "Fluttercon, Sessions, Jaspr, Dart, Flutter",
      'og:title': "Fluttercon Berlin 2024 - Schedule for Day $day",
      'og:image': "https://sessionize.com/image/1314-1140o400o3-h467LSBSMTzb8do1dJniEh.jpg"
    });

    yield PagesNav(day: day);

    yield SessionList(sessions: sessions);

    yield footer([
      text('💙 Built with '),
      a(href: "https://github.com/schultek/jaspr", [text('Jaspr')]),
      text('💙'),
      br(),
      text('Join '),
      a(href: "/jaspr_unleashing_the_power_of_dart_for_modern_web_development_642677", [text('my talk')]),
      text(' to see this website being built live.'),
    ]);
  }

  static get styles => [
        ...PagesNav.styles,
        ...SessionList.styles,
        ...SessionCard.styles,
        css('footer').box(margin: EdgeInsets.all(40.px)).text(align: TextAlign.center, fontStyle: FontStyle.italic),
      ];
}
