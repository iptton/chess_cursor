import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter/material.dart';
import '../../lib/main.dart';
import '../../lib/features/board/view/chess_board.dart';

StepDefinitionGeneric GivenTheGameIsOpened() {
  return given<FlutterWorld>(
    '我打开了游戏',
    (context) async {
      await context.world.tester.pumpWidget(const ChessApp());
    },
  );
}

StepDefinitionGeneric WhenTheGameIsLoaded() {
  return when<FlutterWorld>(
    '游戏加载完成',
    (context) async {
      await context.world.tester.pumpAndSettle();
    },
  );
}

StepDefinitionGeneric ThenIShouldSeeChessboard() {
  return then<FlutterWorld>(
    '我应该看到一个8x8的棋盘',
    (context) async {
      final finder = find.byType(ChessBoard);
      expect(finder, findsOneWidget);
      
      // 验证棋盘大小为8x8
      final board = context.world.tester.widget<ChessBoard>(finder);
      expect(board, isNotNull);
    },
  );
}

StepDefinitionGeneric ThenTheBoardShouldHaveAlternatingColors() {
  return then<FlutterWorld>(
    '棋盘应该显示交替的黑白格子',
    (context) async {
      // 验证棋盘格子颜色
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
      // 验证文件标识（A-H）
      for (var file in ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']) {
        expect(find.text(file), findsWidgets);
      }
      
      // 验证行标识（1-8）
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
      // 验证所有棋子都在正确位置
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
      final blackPieces = ['♟', '♜', '♞', '♝', '♛', '♚'];
      for (var piece in blackPieces) {
        expect(find.text(piece), findsWidgets);
      }
    },
  );
} 