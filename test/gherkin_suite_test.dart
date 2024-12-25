import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'steps/board_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [RegExp('test/features/.*\\.feature')]
    ..reporters = [
      StdoutReporter(MessageLevel.error)
        ..setWriteLineFn(print)
        ..setWriteFn(print),
      ProgressReporter()
        ..setWriteLineFn(print)
        ..setWriteFn(print),
      TestRunSummaryReporter()
        ..setWriteLineFn(print)
        ..setWriteFn(print),
    ]
    ..stepDefinitions = [
      GivenTheGameIsOpened(),
      WhenTheGameIsLoaded(),
      ThenIShouldSeeChessboard(),
      ThenTheBoardShouldHaveAlternatingColors(),
      ThenTheBoardShouldShowCoordinates(),
      ThenIShouldSeePiecesInInitialPositions(),
      ThenWhitePiecesShouldBeAtBottom(),
      ThenBlackPiecesShouldBeAtTop(),
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test/test_app.dart";

  return GherkinRunner().execute(config);
} 