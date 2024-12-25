import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/board_bloc.dart';

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardBloc, BoardState>(
      builder: (context, state) {
        if (state is BoardLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFileLabels(),
              ...List.generate(8, (y) => _buildRow(y, state.squares[y])),
              _buildFileLabels(),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildFileLabels() {
    return Row(
      children: [
        const SizedBox(width: 20), // 为左侧的数字标签留出空间
        ...List.generate(
          8,
          (x) => Expanded(
            child: Center(
              child: Text(
                String.fromCharCode('A'.codeUnitAt(0) + x),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20), // 为右侧的数字标签留出空间
      ],
    );
  }

  Widget _buildRow(int y, List<String> row) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          child: Center(
            child: Text(
              '${8 - y}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...List.generate(
          8,
          (x) => _buildSquare(x, y, row[x]),
        ),
        SizedBox(
          width: 20,
          child: Center(
            child: Text(
              '${8 - y}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSquare(int x, int y, String piece) {
    final isWhiteSquare = (x + y) % 2 == 0;
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: isWhiteSquare ? Colors.white : Colors.brown[300],
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: Center(
            child: Text(
              piece,
              style: const TextStyle(
                fontSize: 32,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
} 