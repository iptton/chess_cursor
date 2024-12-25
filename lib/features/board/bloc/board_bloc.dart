import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class BoardEvent extends Equatable {
  const BoardEvent();

  @override
  List<Object> get props => [];
}

class InitializeBoardEvent extends BoardEvent {}

// States
abstract class BoardState extends Equatable {
  const BoardState();
  
  @override
  List<Object> get props => [];
}

class BoardInitial extends BoardState {}

class BoardLoaded extends BoardState {
  final List<List<String>> squares; // 8x8的棋盘，每个格子可能为空或包含棋子

  const BoardLoaded({required this.squares});

  @override
  List<Object> get props => [squares];
}

// Bloc
class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(BoardInitial()) {
    on<InitializeBoardEvent>(_onInitializeBoard);
  }

  void _onInitializeBoard(InitializeBoardEvent event, Emitter<BoardState> emit) {
    // 创建8x8的空棋盘
    final squares = List.generate(
      8,
      (y) => List.generate(8, (x) => ''),
    );

    // 初始化棋子位置
    // 黑方棋子（顶部）
    squares[0] = ['♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜'];
    squares[1] = List.filled(8, '♟');

    // 白方棋子（底部）
    squares[6] = List.filled(8, '♙');
    squares[7] = ['♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖'];

    emit(BoardLoaded(squares: squares));
  }
} 