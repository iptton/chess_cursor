import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final int x; // 0-7 代表 A-H
  final int y; // 0-7 代表 1-8

  const Position(this.x, this.y);

  String get fileLabel => String.fromCharCode('A'.codeUnitAt(0) + x);
  String get rankLabel => (y + 1).toString();

  @override
  List<Object> get props => [x, y];

  @override
  String toString() => '$fileLabel$rankLabel';

  bool isValid() => x >= 0 && x < 8 && y >= 0 && y < 8;

  static Position fromAlgebraic(String algebraic) {
    if (algebraic.length != 2) throw ArgumentError('Invalid algebraic notation');
    
    final file = algebraic[0].toUpperCase();
    final rank = algebraic[1];
    
    final x = file.codeUnitAt(0) - 'A'.codeUnitAt(0);
    final y = int.parse(rank) - 1;
    
    return Position(x, y);
  }
} 