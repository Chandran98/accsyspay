import 'package:Accsys_Pay/MainApp/Models/bus_modal/seat_layout_state_model.dart';
import 'package:Accsys_Pay/MainApp/Models/bus_modal/seat_model.dart';
import 'package:Accsys_Pay/MainApp/utils/busBooking/seat_state.dart';
import 'package:Accsys_Pay/MainApp/utils/busBooking/seat_widget.dart';
import 'package:flutter/material.dart';

class SeatLayoutWidget extends StatelessWidget {
  final SeatLayoutStateModel stateModel;
  final void Function(int rowI, int colI, SeatState currentState)
      onSeatStateChanged;

  const SeatLayoutWidget({
    Key key,
    this.stateModel,
    this.onSeatStateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ...List<int>.generate(stateModel.cols + 1, (colI) => colI)
              .map<Row>(
                (colI) => Row(
                  children: [
                    ...List<int>.generate(stateModel.rows + 1, (rowI) => rowI)
                        .reversed
                        .map((rowI) => SeatWidget(
                              model: SeatModel(
                                  seatState: _getSeatState(rowI, colI,
                                      stateModel.sleeper + stateModel.seater),
                                  seatType: _getSeatType(rowI, colI,
                                      stateModel.sleeper, stateModel.seater),
                                  rowI: rowI,
                                  colI: colI,
                                  seatSvgSize: stateModel.seatSvgSize,
                                  sleeperSelectedSeat:
                                      stateModel.sleeperSelectedSeat,
                                  sleeperUnSelectedSeat:
                                      stateModel.sleeperUnSelectedSeat,
                                  sleeperSoldSeat: stateModel.sleeperSoldSeat,
                                  sleeperFemaleSeatSelected:
                                      stateModel.sleeperFemaleSeatSelected,
                                  sleeperFemaleSeatUnselected:
                                      stateModel.sleeperFemaleSeatUnselected,
                                  sleeperFemaleSeatSold:
                                      stateModel.sleeperFemaleSeatSold,
                                  sleeperMaleSeatSelected:
                                      stateModel.sleeperMaleSeatSelected,
                                  sleeperMaleSeatUnselected:
                                      stateModel.sleeperMaleSeatUnselected,
                                  sleeperMaleSeatSold:
                                      stateModel.sleeperMaleSeatSold,
                                  sleeperDisabledSeat:
                                      stateModel.sleeperDisabledSeat,
                                  seaterSelectedSeat:
                                      stateModel.seaterSelectedSeat,
                                  seaterUnSelectedSeat:
                                      stateModel.seaterUnSelectedSeat,
                                  seaterSoldSeat: stateModel.seaterSoldSeat,
                                  seaterFemaleSeatSelected:
                                      stateModel.seaterFemaleSeatSelected,
                                  seaterFemaleSeatUnselected:
                                      stateModel.seaterFemaleSeatUnselected,
                                  seaterFemaleSeatSold:
                                      stateModel.seaterFemaleSeatSold,
                                  seaterMaleSeatSelected:
                                      stateModel.seaterMaleSeatSelected,
                                  seaterMaleSeatUnselected:
                                      stateModel.seaterMaleSeatUnselected,
                                  seaterMaleSeatSold:
                                      stateModel.seaterMaleSeatSold,
                                  seaterDisabledSeat:
                                      stateModel.seaterDisabledSeat,
                                  selectedSeats: stateModel.selectedSeats),
                              onSeatStateChanged: onSeatStateChanged,
                            ))
                        .toList()
                  ],
                ),
              )
              .toList()
        ],
      ),
    );
  }

  SeatState _getSeatState(row, col, List<dynamic> seats) {
    for (var i = 0; i < seats.length; i++) {
      if (seats[i]['row'] == row.toString() &&
          seats[i]['column'] == col.toString()) {
        if (seats[i]['ladiesSeat'] == "true" &&
            seats[i]['available'] == "true") {
          return SeatState.femaleSeatUnselected;
        } else if (seats[i]['ladiesSeat'] == "true" &&
            seats[i]['available'] == "false") {
          return SeatState.femaleSeatSold;
        } else if (seats[i]['maleSeat'] == "true" &&
            seats[i]['available'] == "true") {
          return SeatState.maleSeatUnselected;
        } else if (seats[i]['maleSeat'] == "true" &&
            seats[i]['available'] == "false") {
          return SeatState.maleSeatSold;
        } else if (seats[i]['available'] == "true") {
          return SeatState.unselected;
        } else if (seats[i]['available'] == "false") {
          return SeatState.sold;
        }
      }
    }
    return SeatState.empty;
  }

  SeatType _getSeatType(row, col, List<dynamic> sleeper, List<dynamic> seater) {
    bool isSleeper = sleeper.any(
        (e) => e['row'] == row.toString() && e['column'] == col.toString());
    bool isSeater = seater.any(
        (e) => e['row'] == row.toString() && e['column'] == col.toString());
    if (isSleeper) {
      return SeatType.sleeper;
    } else if (isSeater) {
      return SeatType.seater;
    }
    return SeatType.none;
  }
}
