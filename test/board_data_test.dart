import 'package:dartchess/dartchess.dart' hide Move, Piece;
import 'package:flutter_test/flutter_test.dart';
import 'package:chessground/chessground.dart';

void main() {
  group('BoardData', () {
    test('implements hashCode/==', () {
      expect(
        const BoardData(
          interactableSide: InteractableSide.both,
          orientation: Side.white,
          sideToMove: Side.white,
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        ),
        const BoardData(
          interactableSide: InteractableSide.both,
          orientation: Side.white,
          sideToMove: Side.white,
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        ),
      );
      expect(
        const BoardData(
          interactableSide: InteractableSide.both,
          orientation: Side.white,
          sideToMove: Side.white,
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        ).hashCode,
        const BoardData(
          interactableSide: InteractableSide.both,
          orientation: Side.white,
          sideToMove: Side.white,
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        ).hashCode,
      );

      expect(
        const BoardData(
          interactableSide: InteractableSide.both,
          orientation: Side.white,
          sideToMove: Side.white,
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        ),
        isNot(
          const BoardData(
            interactableSide: InteractableSide.both,
            orientation: Side.white,
            sideToMove: Side.white,
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 2',
          ),
        ),
      );

      expect(
        const BoardData(
          interactableSide: InteractableSide.both,
          orientation: Side.white,
          sideToMove: Side.white,
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        ).hashCode,
        isNot(
          const BoardData(
            interactableSide: InteractableSide.both,
            orientation: Side.white,
            sideToMove: Side.white,
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 2',
          ).hashCode,
        ),
      );
    });

    test('copyWith', () {
      const boardData = BoardData(
        interactableSide: InteractableSide.both,
        orientation: Side.white,
        sideToMove: Side.white,
        fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
      );

      expect(boardData.copyWith(), boardData);

      expect(
        boardData.copyWith(
          interactableSide: InteractableSide.both,
          orientation: Side.white,
          sideToMove: Side.white,
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        ),
        boardData,
      );

      expect(
        boardData
            .copyWith(interactableSide: InteractableSide.white)
            .interactableSide,
        InteractableSide.white,
      );

      expect(
        boardData.copyWith(orientation: Side.black).orientation,
        Side.black,
      );

      expect(
        boardData.copyWith(sideToMove: Side.black).sideToMove,
        Side.black,
      );

      expect(
        boardData.copyWith(fen: 'new_fen').fen,
        'new_fen',
      );
    });

    test('copyWith, nullable values', () {
      const boardData = BoardData(
        interactableSide: InteractableSide.both,
        orientation: Side.white,
        fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        sideToMove: Side.white,
        lastMove: BoardMove(from: SquareId('e2'), to: SquareId('e4')),
      );

      // pass null values to non-nullable fields should not change the field
      expect(
        boardData.copyWith(
          // ignore: avoid_redundant_argument_values
          interactableSide: null,
        ),
        boardData,
      );

      // pass null values to nullable fields should set the field to null
      expect(
        // ignore: avoid_redundant_argument_values
        boardData.copyWith(lastMove: null).lastMove,
        null,
      );
    });
  });
}
