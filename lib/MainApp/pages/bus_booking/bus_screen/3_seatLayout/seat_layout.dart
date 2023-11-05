// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../Models/bus_modal/seat_layout_state_model.dart';
import '../../../../utils/busBooking/seat_layout_widget.dart';
import '../../../../utils/busBooking/seat_state.dart';

class SeatLayoutPage extends StatefulWidget {
  final void Function(
          int rowI, int colI, SeatState currentState, dynamic selectedSeat)
      onSeatStateChanged;
  final List<dynamic> seater;
  final List<dynamic> sleeper;
  final int rowN;
  final int colN;
  final List<dynamic> selectedSeats;

  const SeatLayoutPage(
      {Key key,
      this.onSeatStateChanged,
      this.seater,
      this.sleeper,
      this.colN,
      this.rowN,
      this.selectedSeats})
      : super(key: key);

  @override
  State<SeatLayoutPage> createState() => _SeatLayoutPageState();
}

class _SeatLayoutPageState extends State<SeatLayoutPage> {
  List<dynamic> selectedSeats = [];
  List<dynamic> seater = [];
  List<dynamic> sleeper = [];
  int rowN = 0;
  int colN = 0;
  List currentSeats;

  @override
  void initState() {
    super.initState();
    rowN = widget.rowN;
    colN = widget.colN;
    seater = widget.seater;
    sleeper = widget.sleeper;
    currentSeats = seater + sleeper;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.center,
        width: 80.w,
        height: 70.h,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(left: 8.0.w, top: 1.h),
          child: SeatLayoutWidget(
            onSeatStateChanged: (rowI, colI, seatState) {
              dynamic selectedSeat = currentSeats
                  .where((e) =>
                      e['row'] == rowI.toString() &&
                      e['column'] == colI.toString())
                  .toList();
              widget.onSeatStateChanged(rowI, colI, seatState, selectedSeat);
            },
            stateModel: SeatLayoutStateModel(
                sleeperSelectedSeat: 'assets/images/birth_selected.svg',
                sleeperUnSelectedSeat: 'assets/images/birth_unselected.svg',
                sleeperSoldSeat: 'assets/images/birth_sold.svg',
                sleeperFemaleSeatSelected:
                    'assets/images/birth_ladies_selected.svg',
                sleeperFemaleSeatUnselected:
                    'assets/images/birth_ladies_unselected.svg',
                sleeperFemaleSeatSold: 'assets/images/birth_ladies_sold.svg',
                sleeperMaleSeatSelected:
                    'assets/images/birth_male_selected.svg',
                sleeperMaleSeatUnselected:
                    'assets/images/birth_male_unselected.svg',
                sleeperMaleSeatSold: 'assets/images/birth_male_sold.svg',
                sleeperDisabledSeat: 'assets/images/birth_disabled.svg',
                seaterSelectedSeat: 'assets/images/seat_selected.svg',
                seaterUnSelectedSeat: 'assets/images/seat_unselected.svg',
                seaterSoldSeat: 'assets/images/seat_sold.svg',
                seaterFemaleSeatSelected:
                    'assets/images/seat_ladies_selected.svg',
                seaterFemaleSeatUnselected:
                    'assets/images/seat_ladies_unselected.svg',
                seaterFemaleSeatSold: 'assets/images/seat_ladies_sold.svg',
                seaterMaleSeatSelected: 'assets/images/seat_male_selected.svg',
                seaterMaleSeatUnselected:
                    'assets/images/seat_male_unselected.svg',
                seaterMaleSeatSold: 'assets/images/seat_male_sold.svg',
                seaterDisabledSeat: 'assets/images/seat_disabled.svg',
                rows: rowN,
                cols: colN,
                seatSvgSize: 50,
                seater: seater,
                sleeper: sleeper,
                selectedSeats: widget.selectedSeats),
          ),
        ));
  }
}
