import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter/material.dart';
import '../../lib/features/board/view/chess_board.dart';

StepDefinitionGeneric GivenTheGameIsOpened() {
  return given<FlutterWorld>(
    '我打开了游戏',
    (context) async {
      await FlutterGherkinIntegration().pumpWidget(context.world);
    },
  );
}

StepDefinitionGeneric WhenTheGameIsLoaded() {
  return when<FlutterWorld>(
    '游戏加载完成',
    (context) async {
      await FlutterGherkinIntegration().pumpAndSettle(context.world);
    },
  );
}

StepDefinitionGeneric ThenIShouldSeeChessboard() {
  return then<FlutterWorld>(
    '我应该看到一个8x8的棋盘',
    (context) async {
      final finder = find.byType(ChessBoard);
      await FlutterGherkinIntegration().pumpAndSettle(context.world);
      expect(finder, findsOneWidget);
    },
  );
}

StepDefinitionGeneric ThenTheBoardShouldHaveAlternatingColors() {
  return then<FlutterWorld>(
    '棋盘应该显示交替的黑白格子',
    (context) async {
      await FlutterGherkinIntegration().pumpAndSettle(context.world);
      
      final whiteFinder = find.byWidgetPredicate(
        (widget) => widget is Container && 
          (widget.decoration as BoxDecoration?)?.color == Colors.white,
      );
      final brownFinder = find.byWidgetPredicate(
        (widget) => widget is Container && 
          (widget.decoration as BoxDecoration?)?.color == Colors.brown[300],
      );
      
      expect(whiteFinder, findsWidgets);
      expect(brownFinder, findsWidgets);
    },
  );
}

StepDefinitionGeneric ThenTheBoardShouldShowCoordinates() {
  return then<FlutterWorld>(
    '棋盘的边缘应该显示坐标标识\\(A-H和1-8\\)',
    (context) async {
      await FlutterGherkinIntegration().pumpAndSettle(context.world);
      
      for (var file in ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']) {
        expect(find.text(file), findsWidgets);
      }
      
      for (var rank in ['1', '2', '3', '4', '5', '6', '7', '8']) {
        expect(find.text(rank), findsWidgets);
      }
    },
  );
}

StepDefinitionGeneric ThenIShouldSeePiecesInInitialPositions() {
  return then<FlutterWorld>(
    '我应该看到所有棋子在正确的初始位置',
    (context) async {
      await FlutterGherkinIntegration().pumpAndSettle(context.world);
      
      final pieces = ['♜', '♞', '♝', '♛', '♚', '♟', '♙', '♖', '♘', '♗', '♕', '♔'];
      for (var piece in pieces) {
        expect(find.text(piece), findsWidgets);
      }
    },
  );
}

StepDefinitionGeneric ThenWhitePiecesShouldBeAtBottom() {
  return then<FlutterWorld>(
    '白方棋子应该在底部两行',
    (context) async {
      await FlutterGherkinIntegration().pumpAndSettle(context.world);
      
      final whitePieces = ['♙', '♖', '♘', '♗', '♕', '♔'];
      for (var piece in whitePieces) {
        expect(find.text(piece), findsWidgets);
      }
    },
  );
}

StepDefinitionGeneric ThenBlackPiecesShouldBeAtTop() {
  return then<FlutterWorld>(
    '黑方棋子应该在顶部两行',
    (context) async {
      await FlutterGherkinIntegration().pumpAndSettle(context.world);
      
      final blackPieces = ['♟', '♜', '♞', '♝', '♛', '♚'];
      for (var piece in blackPieces) {
        expect(find.text(piece), findsWidgets);
      }
    },
  );
} 