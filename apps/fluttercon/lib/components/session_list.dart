import 'package:jaspr/jaspr.dart';

import '../models/session.dart';
import 'session_card.dart';

class SessionList extends StatelessComponent {
  const SessionList({required this.sessions, super.key});

  final List<Session> sessions;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ul(classes: "sessions", [
      for (final session in sessions)
        li(key: ValueKey(session.id), [
          SessionCard(session: session),
        ])
    ]);
  }

  static List<StyleRule> get styles => [
        css('.sessions', [
          css('&').list(style: ListStyle.none).box(padding: EdgeInsets.symmetric(horizontal: 40.px)),
          css('li').box(margin: EdgeInsets.only(bottom: 16.px))
        ]),
      ];
}
