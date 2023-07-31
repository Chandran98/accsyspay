import 'package:equatable/equatable.dart';
import 'package:Accsys_Pay/MainApp/utils/busBooking/seat_type.dart';

class SeatLayoutStateModel extends Equatable {
  final int rows;
  final int cols;
  final List<dynamic> seater;
  final List<dynamic> sleeper;
  final List<dynamic> selectedSeats;
  final int seatSvgSize;
  final String sleeperSelectedSeat;
  final String sleeperUnSelectedSeat;
  final String sleeperSoldSeat;
  final String sleeperFemaleSeatSelected;
  final String sleeperFemaleSeatUnselected;
  final String sleeperFemaleSeatSold;
  final String sleeperMaleSeatSelected;
  final String sleeperMaleSeatUnselected;
  final String sleeperMaleSeatSold;
  final String sleeperDisabledSeat;
  final String seaterSelectedSeat;
  final String seaterUnSelectedSeat;
  final String seaterSoldSeat;
  final String seaterFemaleSeatSelected;
  final String seaterFemaleSeatUnselected;
  final String seaterFemaleSeatSold;
  final String seaterMaleSeatSelected;
  final String seaterMaleSeatUnselected;
  final String seaterMaleSeatSold;
  final String seaterDisabledSeat;

  const SeatLayoutStateModel({
    this.rows,
    this.cols,
    this.seater,
    this.sleeper,
    this.selectedSeats,
    this.seatSvgSize = 50,
    this.sleeperSelectedSeat,
    this.sleeperUnSelectedSeat,
    this.sleeperSoldSeat,
    this.sleeperFemaleSeatSelected,
    this.sleeperFemaleSeatUnselected,
    this.sleeperFemaleSeatSold,
    this.sleeperMaleSeatSelected,
    this.sleeperMaleSeatUnselected,
    this.sleeperMaleSeatSold,
    this.sleeperDisabledSeat,
    this.seaterSelectedSeat,
    this.seaterUnSelectedSeat,
    this.seaterSoldSeat,
    this.seaterFemaleSeatSelected,
    this.seaterFemaleSeatUnselected,
    this.seaterFemaleSeatSold,
    this.seaterMaleSeatSelected,
    this.seaterMaleSeatUnselected,
    this.seaterMaleSeatSold,
    this.seaterDisabledSeat,
  });

  @override
  List<Object> get props => [
        rows,
        cols,
        seatSvgSize,
        seater,
        sleeper,
        selectedSeats,
        sleeperSelectedSeat,
        sleeperUnSelectedSeat,
        sleeperSoldSeat,
        sleeperFemaleSeatSelected,
        sleeperFemaleSeatUnselected,
        sleeperFemaleSeatSold,
        sleeperMaleSeatSelected,
        sleeperMaleSeatUnselected,
        sleeperMaleSeatSold,
        sleeperDisabledSeat,
        seaterSelectedSeat,
        seaterUnSelectedSeat,
        seaterSoldSeat,
        seaterFemaleSeatSelected,
        seaterFemaleSeatUnselected,
        seaterFemaleSeatSold,
        seaterMaleSeatSelected,
        seaterMaleSeatUnselected,
        seaterMaleSeatSold,
        seaterDisabledSeat,
      ];
}
