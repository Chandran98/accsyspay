import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../provider/bus_provider.dart';
import '../utils/hover_message.dart';

class Seat {
  final int row;
  final int column;
  final String totalFare;
  final String baseFare;
  final String serviceFarePercentage;
  final String serviceFareAmount;
  final String ladiesSeat;
  final String maleSeat;
  final String seatNo;
  final String available;

  Seat({
    this.row,
    this.column,
    this.totalFare,
    this.baseFare,
    this.serviceFarePercentage,
    this.serviceFareAmount,
    this.ladiesSeat,
    this.maleSeat,
    this.seatNo,
    this.available,
  });
}

List<Seat> parseSeats(String jsonString) {
  final List jsonData = json.decode(jsonString);
  return jsonData.map((seatData) {
    return Seat(
      row: int.parse(seatData['row']),
      column: int.parse(seatData['column']),
      totalFare: seatData['total_fare'],
      baseFare: seatData['base_fare'],
      serviceFarePercentage: seatData['service_fare_percentage'],
      serviceFareAmount: seatData['service_fare_amount'],
      ladiesSeat: seatData['ladiesSeat'],
      maleSeat: seatData['maleSeat'],
      seatNo: seatData['seatNo'],
      available: seatData['available'],
    );
  }).toList();
}

class BusSeatSelectionScreen extends StatefulWidget {
  @override
  _BusSeatSelectionScreenState createState() => _BusSeatSelectionScreenState();
}

class _BusSeatSelectionScreenState extends State<BusSeatSelectionScreen> {
  List<Seat> seats = [];

  @override
  void initState() {
    super.initState();
    // Replace jsonString with the actual JSON string you provided
    List<Map<String, String>> jsonString = [
      {
        "row": "0",
        "column": "2",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L9",
        "available": "true"
      },
      {
        "row": "1",
        "column": "2",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L8",
        "available": "true"
      },
      {
        "row": "0",
        "column": "0",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L7",
        "available": "true"
      },
      {
        "row": "1",
        "column": "0",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L6",
        "available": "true"
      },
      {
        "row": "3",
        "column": "8",
        "total_fare": "997.50",
        "base_fare": "950.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "47.50",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L5",
        "available": "true"
      },
      {
        "row": "3",
        "column": "6",
        "total_fare": "997.50",
        "base_fare": "950.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "47.50",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L4",
        "available": "true"
      },
      {
        "row": "3",
        "column": "4",
        "total_fare": "997.50",
        "base_fare": "950.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "47.50",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L3",
        "available": "true"
      },
      {
        "row": "3",
        "column": "2",
        "total_fare": "997.50",
        "base_fare": "950.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "47.50",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L2",
        "available": "true"
      },
      {
        "row": "0",
        "column": "8",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L15",
        "available": "true"
      },
      {
        "row": "1",
        "column": "8",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L14",
        "available": "true"
      },
      {
        "row": "0",
        "column": "6",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L13",
        "available": "true"
      },
      {
        "row": "1",
        "column": "6",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L12",
        "available": "true"
      },
      {
        "row": "0",
        "column": "4",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L11",
        "available": "true"
      },
      {
        "row": "1",
        "column": "4",
        "total_fare": "945.00",
        "base_fare": "900.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "45.00",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L10",
        "available": "false"
      },
      {
        "row": "3",
        "column": "0",
        "total_fare": "997.50",
        "base_fare": "950.00",
        "service_fare_percentage": "5.0000",
        "service_fare_amount": "47.50",
        "ladiesSeat": "false",
        "maleSeat": "false",
        "seatNo": "L1",
        "available": "true"
      }
    ];
    seats = parseSeats(jsonEncode(jsonString));
    init();
  }

  int highestColumn = 0;
  int highestRow = 0;

  List<int> misisngnumbers = [];

  List<int> rows = [];
  List<int> columns = [];
  List<Seat> selectedseat = [];

  void init() {
    for (var i in seats) {
      final row = i.row;
      final column = i.column;
      rows.add(row);
      columns.add(column);
      if (row > highestRow) {
        highestRow = row;
      }
      if (column > highestColumn) {
        highestColumn = column;
      }
    }
    misisngnumbers = findMissingNumbers(removeDuplicates(rows));
  }

  List<int> removeDuplicates(List<int> numbers) {
    Set<int> uniqueNumbers = Set<int>.from(numbers);
    return uniqueNumbers.toList();
  }

  List<int> findMissingNumbers(List<int> numbers) {
    List<int> missingNumbers = [];

    for (int i = 0; i < numbers.length + 1; i++) {
      if (!numbers.contains(i)) {
        missingNumbers.add(i);
      }
    }

    return missingNumbers;
  }

  bool isExist(x) {
    bool missedrow = false;
    for (var k in misisngnumbers) {
      if (x == k) {
        missedrow = true;
      }
    }
    return missedrow;
  }

  bool found(searchElement) {
    return seats.any((element) =>
        element.row == searchElement[0] && element.column == searchElement[1]);
  }

  Seat seatsInRowAndColumn(searchElement) {
    return seats.firstWhere((element) =>
        element.row == searchElement[0] && element.column == searchElement[1]);
  }

  isSelectedSeat(searchElement) {
    // print(searchElement[0]);
    return selectedseat.any((element) =>
        element.row == searchElement[0] && element.column == searchElement[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bus Seat Selection'),
        ),
        body: Column(
          children: <Widget>[
            for (int i = 0; i < seats.length; i++)
              Row(
                children: <Widget>[
                  for (int x = 0; x < highestRow + misisngnumbers.length; x++)
                    Expanded(
                      child: isExist(x) || !found([x, i])
                          ? Container()
                          : Container(
                              height: 60,
                              margin: const EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  Seat seat = seatsInRowAndColumn([x, i]);
                                  print(seat.seatNo);
                                  if (isSelectedSeat([x, i])) {
                                    print("$x$i");
                                    selectedseat.remove(seat);
                                    print("object");
                                    print(selectedseat.remove(seat));
                                  } else {
                                    print("$x$i");
                                    selectedseat.add(seat);
                                    
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  color: isSelectedSeat([x, i])
                                      ? Colors.green
                                      : Colors.grey,
                                  height: 10,
                                  width: 10,
                                  child: Center(
                                      child: Text(
                                          seatsInRowAndColumn([x, i]).seatNo)),
                                ),
                              ),
                            ),
                    ),
                ],
              ),
            const Text("Selected Seat"),
            Wrap(
              children: [for (var i in selectedseat) Text(" ${i.seatNo} ,")],
            )
          ],
        ));
  }
}
