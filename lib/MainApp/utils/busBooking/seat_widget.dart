import 'package:Accsys_Pay/MainApp/utils/busBooking/seat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../Models/bus_modal/seat_model.dart';
import '../hover_message.dart';

class SeatWidget extends StatefulWidget {
  final SeatModel model;
  final void Function(int rowI, int colI, SeatState currentState)
      onSeatStateChanged;

  const SeatWidget({
    Key key,
    this.model,
    this.onSeatStateChanged,
  }) : super(key: key);

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  SeatState seatState;
  SeatType seatType;
  int rowI = 0;
  int colI = 0;
  List<dynamic> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    seatState = widget.model.seatState;
    rowI = widget.model.rowI;
    colI = widget.model.colI;
    seatType = widget.model.seatType;
    selectedSeats = widget.model.selectedSeats;
  }

  @override
  Widget build(BuildContext context) {
    final safeCheckedSeatState = seatState;
    final type = seatType;

    if (safeCheckedSeatState != null) {
      return GestureDetector(
        onTapUp: (_) {
          switch (seatState) {
            case SeatState.selected:
              {
                setState(() {
                  seatState = SeatState.unselected;
                  widget.onSeatStateChanged(rowI, colI, SeatState.unselected);
                });
              }
              break;
            case SeatState.femaleSeatSelected:
              {
                setState(() {
                  seatState = SeatState.femaleSeatUnselected;
                  widget.onSeatStateChanged(rowI, colI, SeatState.unselected);
                });
              }
              break;
            case SeatState.maleSeatSelected:
              {
                if (widget.model.selectedSeats.length == 6) {
                  Utils.toastMessage("Maximum 6 seats only allowed");
                  return;
                }
                setState(() {
                  seatState = SeatState.maleSeatUnselected;
                  widget.onSeatStateChanged(rowI, colI, SeatState.unselected);
                });
              }
              break;
            case SeatState.unselected:
              {
                if (selectedSeats.length == 6) {
                  Utils.toastMessage("Maximum 6 seats only allowed");
                  return;
                }
                setState(() {
                  seatState = SeatState.selected;
                  widget.onSeatStateChanged(rowI, colI, SeatState.selected);
                });
              }
              break;
            case SeatState.femaleSeatUnselected:
              {
                if (selectedSeats.length == 6) {
                  Utils.toastMessage("Maximum 6 seats only allowed");
                  return;
                }
                setState(() {
                  seatState = SeatState.femaleSeatSelected;
                  widget.onSeatStateChanged(rowI, colI, SeatState.selected);
                });
              }
              break;
            case SeatState.maleSeatUnselected:
              {
                if (selectedSeats.length == 6) {
                  Utils.toastMessage("Maximum 6 seats only allowed");
                  return;
                }
                setState(() {
                  seatState = SeatState.maleSeatSelected;
                  widget.onSeatStateChanged(rowI, colI, SeatState.selected);
                });
              }
              break;
            case SeatState.disabled:
            case SeatState.sold:
            case SeatState.empty:
            default:
              {}
              break;
          }
        },
        child: seatState != SeatState.empty
            ? Container(
                // color: Colors.red,
                margin: type == SeatType.seater
                    ? EdgeInsets.symmetric(vertical: 0.01.h, horizontal: 0.5.w)
                    : EdgeInsets.symmetric(vertical: 0.01.h, horizontal: 0.9.w),
                height: type == SeatType.seater ? 5.3.h : 7.h,
                width: type == SeatType.seater ? 8.5.w : 6.8.w,
                child: Center(
                  child: SvgPicture.asset(
                    _getSvgPath(safeCheckedSeatState, type),
                    height: type == SeatType.seater ? 3.5.h : 7.h,

                    // width: type == SeatType.seater ? 9.5.w : 11.w,
                    // width: type == SeatType.seater
                    //     ? widget.model.seatSvgSize.toDouble() - 15.0
                    //     : widget.model.seatSvgSize.toDouble(),
                    // fit: BoxFit.cover,
                  ),
                ),
              )
            : SizedBox(
                // color: Colors.black12,
                height: 2.5.h,
                width: 8.5.w,
                child: SizedBox(
                  height: 0.5.h,
                  // height: type == SeatType.seater
                  //     ? widget.model.seatSvgSize.toDouble()
                  //     : widget.model.seatSvgSize.toDouble() - 40.0,
                  // width: type == SeatType.seater
                  //     ? widget.model.seatSvgSize.toDouble()
                  //     : widget.model.seatSvgSize.toDouble() - 40.0,
                ),
              ),
      );
    }
    return const SizedBox();
  }

  String _getSvgPath(SeatState state, SeatType type) {
    switch (state) {
      case SeatState.unselected:
        {
          return type == SeatType.seater
              ? widget.model.seaterUnSelectedSeat
              : widget.model.sleeperUnSelectedSeat;
        }
      case SeatState.selected:
        {
          return type == SeatType.seater
              ? widget.model.seaterSelectedSeat
              : widget.model.sleeperSelectedSeat;
        }
      case SeatState.sold:
        {
          return type == SeatType.seater
              ? widget.model.seaterSoldSeat
              : widget.model.sleeperSoldSeat;
        }
      case SeatState.femaleSeatUnselected:
        {
          return type == SeatType.seater
              ? widget.model.seaterFemaleSeatUnselected
              : widget.model.sleeperFemaleSeatUnselected;
        }
      case SeatState.femaleSeatSelected:
        {
          return type == SeatType.seater
              ? widget.model.seaterFemaleSeatSelected
              : widget.model.sleeperFemaleSeatSelected;
        }
      case SeatState.femaleSeatSold:
        {
          return type == SeatType.seater
              ? widget.model.seaterFemaleSeatSold
              : widget.model.sleeperFemaleSeatSold;
        }
      case SeatState.maleSeatUnselected:
        {
          return type == SeatType.seater
              ? widget.model.seaterMaleSeatUnselected
              : widget.model.sleeperMaleSeatUnselected;
        }
      case SeatState.maleSeatSelected:
        {
          return type == SeatType.seater
              ? widget.model.seaterMaleSeatSelected
              : widget.model.sleeperMaleSeatSelected;
        }
      case SeatState.maleSeatSold:
        {
          return type == SeatType.seater
              ? widget.model.seaterMaleSeatSold
              : widget.model.sleeperMaleSeatSold;
        }
      case SeatState.disabled:
        {
          return type == SeatType.seater
              ? widget.model.seaterDisabledSeat
              : widget.model.sleeperDisabledSeat;
        }
      case SeatState.empty:
      default:
        {}
    }
  }
}
