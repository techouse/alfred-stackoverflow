// ignore_for_file: long-method

part of 'main.dart';

final HtmlUnescape _unescape = HtmlUnescape();

final AlfredWorkflow _workflow = AlfredWorkflow(
  cache: AlfredCache<AlfredItems>(
    fromEncodable: (Map<String, dynamic> json) => AlfredItems.fromJson(json),
    maxEntries: 10000,
    expiryPolicy: const CreatedExpiryPolicy(
      Duration(days: 7),
    ),
  ),
)..disableAlfredSmartResultOrdering = true;

final AlfredUpdater _updater = AlfredUpdater(
  githubRepositoryUrl: Uri.parse(Env.githubRepositoryUrl),
  currentVersion: Env.appVersion,
  updateInterval: Duration(days: 1),
);

const updateItem = AlfredItem(
  title: 'Auto-Update available!',
  subtitle: 'Press <enter> to auto-update to a new version of this workflow.',
  arg: 'update:workflow',
  match:
      'Auto-Update available! Press <enter> to auto-update to a new version of this workflow.',
  icon: AlfredItemIcon(path: 'alfredhatcog.png'),
  valid: true,
);

void _showPlaceholder() {
  _workflow.addItem(
    const AlfredItem(
      title: 'Search StackOverflow for ...',
      icon: AlfredItemIcon(path: 'icon.png'),
    ),
  );
}

Future<void> _performSearch({
  required String query,
  Set<String>? tags,
}) async {
  try {
    final ItemList<Question> questions = await StackExchangeService.search(
      siteId: 'stackoverflow',
      query: query,
      tagged: tags,
      answers: 1,
      page: 1,
      pageSize: 20,
    );

    if (questions.isNotEmpty) {
      _workflow.addItems(
        <AlfredItem>[
          for (final Question question in questions)
            AlfredItem(
              uid: question.id.toString(),
              title: _unescape.convert(question.title),
              subtitle: _unescape.convert(question.tags.join(', ')),
              arg: question.link.toString(),
              match: _unescape.convert(
                '${question.title} ${question.tags.join(' ')}',
              ),
              text: AlfredItemText(
                largeType: question.title,
                copy: question.link.toString(),
              ),
              quickLookUrl: question.link.toString(),
              icon: AlfredItemIcon(
                path: question.isAnswered ? 'icon_check.png' : 'icon.png',
              ),
              valid: true,
            ),
        ],
      );
    } else {
      final Uri url = Uri.https('www.google.com', '/search', {'q': query});

      _workflow.addItem(
        AlfredItem(
          title: 'No matching questions found',
          subtitle: 'Shall I try and search Google?',
          arg: url.toString(),
          text: AlfredItemText(copy: url.toString()),
          quickLookUrl: url.toString(),
          icon: AlfredItemIcon(path: 'google.png'),
          valid: true,
        ),
      );
    }
  } on http.ClientException catch (error) {
    _workflow.addItem(
      AlfredItem(
        title: 'StackExchange API Error',
        subtitle: error.message,
        text: AlfredItemText(copy: error.message),
        valid: false,
      ),
    );
  }
}
