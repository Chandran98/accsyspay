
import 'package:equatable/equatable.dart';

class SeatLayoutStateModel extends Equatable {
  final int rows;
  final int cols;
  final List<dynamic> currentSeats;
  final int seatSvgSize;
  final String pathSelectedSeat;
  final String pathUnSelectedSeat;
  final String pathFemaleSeat;
  final String pathFemaleSeatSold;
  final String pathMaleSeat;
  final String pathMaleSeatSold;
  final String pathSoldSeat;
  final String pathDisabledSeat;

  const SeatLayoutStateModel({
    this.rows,
    this.cols,
    this.currentSeats,
    this.seatSvgSize = 50,
    this.pathSelectedSeat,
    this.pathDisabledSeat,
    this.pathSoldSeat,
    this.pathUnSelectedSeat,
    this.pathFemaleSeat,
    this.pathFemaleSeatSold,
    this.pathMaleSeat,
    this.pathMaleSeatSold
  });

  @override
  List<Object> get props => [
        rows,
        cols,
        seatSvgSize,
        currentSeats,
        pathUnSelectedSeat,
        pathSelectedSeat,
        pathSoldSeat,
        pathDisabledSeat,
        pathFemaleSeat,
        pathFemaleSeatSold,
        pathMaleSeat,
        pathMaleSeatSold
      ];
}