import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'steps/board_steps.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    FlutterTestConfiguration()
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
      ],
    reporter: StdoutReporter(),
  );
} 