import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';
import '../lib/features/board/view/chess_board.dart';

void main() {
  group('棋盘显示测试', () {
    testWidgets('显示标准8x8棋盘', (WidgetTester tester) async {
      await tester.pumpWidget(const ChessApp());
      await tester.pumpAndSettle();

      // 验证棋盘存在
      expect(find.byType(ChessBoard), findsOneWidget);

      // 验证黑白格子
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

      // 验证坐标标识
      for (var file in ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']) {
        expect(find.text(file), findsWidgets);
      }
      for (var rank in ['1', '2', '3', '4', '5', '6', '7', '8']) {
        expect(find.text(rank), findsWidgets);
      }
    });

    testWidgets('棋子初始布局正确', (WidgetTester tester) async {
      await tester.pumpWidget(const ChessApp());
      await tester.pumpAndSettle();

      // 验证黑方棋子（顶部）
      final blackPieces = ['♜', '♞', '♝', '♛', '♚', '♟'];
      for (var piece in blackPieces) {
        expect(find.text(piece), findsWidgets);
      }

      // 验证白方棋子（底部）
      final whitePieces = ['♙', '♖', '♘', '♗', '♕', '♔'];
      for (var piece in whitePieces) {
        expect(find.text(piece), findsWidgets);
      }
    });
  });
} 