  // Padding(
  //                       padding: EdgeInsets.all(16.0),
  //                       child: Container(
  //                         height: 250,
  //                         decoration: BoxDecoration(
  //                             color:
  //                                 theme.darkTheme ? Colors.black : Colors.white,
  //                             borderRadius: BorderRadius.circular(8)),
  //                         // color: Colors.red.shade100,
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(16.0),
  //                           child: Column(
  //                             children: [
                          
  //                               Expanded(
  //                                   flex: 1,
  //                                   child: Container(
  //                                     child: Row(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Expanded(flex: 2,
  //                                           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
  //                                             children: [
  //                                               Text(
  //                                                 "Total Balance (Rs.)",
  //                                                 style: GoogleFonts.inter(
  //                                                     // color: Colors.grey,
  //                                                     fontSize: 16,
  //                                                     fontWeight: FontWeight.w700),
  //                                               ),
  //                                               Row(
  //                                                 children: [
  //                                                   Container(
  //                                                     child: Text(
  //                                                       balance == "null"
  //                                                           ? "-----"
  //                                                           : balance
  //                                                               ? "₹ ${balanceProvider.balance.toString() == "null" ? "0" : balanceProvider.balance}"
  //                                                               : "₹ ......",
  //                                                       style: GoogleFonts.inter(
  //                                                           // color: Colors.black,
  //                                                           fontSize: 18,
  //                                                           fontWeight:
  //                                                               FontWeight.w700),
  //                                                     ),
  //                                                   ),
  //                                                   IconButton(
  //                                                     onPressed: () {
  //                                                       setState(() {
  //                                                         balance = !balance;
  //                                                       });
  //                                                     },
  //                                                     icon: balance
  //                                                         ? const Icon(
  //                                                             FeatherIcons.eye,
  //                                                             size: 20,
  //                                                           )
  //                                                         : const Icon(
  //                                                             FeatherIcons.eyeOff,
  //                                                             size: 20,
  //                                                           ),
  //                                                   )
  //                                                 ],
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       Expanded(flex: 1,
  //                                           child: Container(
  //                                             decoration: BoxDecoration(
  //                                                 color: PrimaryColor,
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(8)),
  //                                             child: Padding(
  //                                               padding: EdgeInsets.all(6.0),
  //                                               child: Text(
  //                                                 "Active Balance",
  //                                                 style: GoogleFonts.inter(
  //                                                     color: Colors.white,
  //                                                     fontSize: 13,
  //                                                     fontWeight: FontWeight.w500),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         )
  //                                       ],
  //                                     ),
  //                                   )),
  //                               Expanded(flex: 2,
  //                                 child: Container(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(flex: 2,child: Container(color: white,child:   Row(
  //                                                 crossAxisAlignment:
  //                                                     CrossAxisAlignment.start,
  //                                                 children: [
  //                                                  Column(mainAxisAlignment: MainAxisAlignment.center,children: [ Text(
  //                                                     "Income",
  //                                                     style: GoogleFonts.inter(
  //                                                         // color: Colors.grey,
  //                                                         fontSize: 16,
  //                                                         fontWeight:
  //                                                             FontWeight.w700),
  //                                                   ),
  //                                                   spacer10Height,
  //                                                   Row(
  //                                                     children: [
  //                                                       Container(
  //                                                         height: 20,
  //                                                         width: 20,
  //                                                         decoration: BoxDecoration(
  //                                                             color:
  //                                                                 Colors.green,
  //                                                             borderRadius:
  //                                                                 BorderRadius
  //                                                                     .circular(
  //                                                                         2)),
  //                                                         child: const Center(
  //                                                           child: Icon(
  //                                                             CupertinoIcons
  //                                                                 .arrow_up_right,
  //                                                             color: white,
  //                                                             size: 20,
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                       spacer10Width,
  //                                                       Text(
  //                                                         // balance == "null"
  //                                                         //     ? "-----"
  //                                                         //     :
  //                                                         balance
  //                                                             ? "₹ ${balanceProvider.totalInflowAmount.toString() == "null" ? "0" : balanceProvider.totalInflowAmount}"
  //                                                             : "₹ ......",
  //                                                         style:
  //                                                             GoogleFonts.inter(
  //                                                                 // color: Colors.black,
  //                                                                 fontSize: 14,
  //                                                                 fontWeight:
  //                                                                     FontWeight
  //                                                                         .w700),
  //                                                       ),
  //                                                     ],
  //                                                   ),
  //                                               ],),
                                                
  //                                               spacer20Width,
  //                                               Column(
  //                                                 crossAxisAlignment:
  //                                                     CrossAxisAlignment.start,
  //                                                     mainAxisAlignment: MainAxisAlignment.center,
  //                                                 children: [
  //                                                   Text(
  //                                                     "Expenses",
  //                                                     style: GoogleFonts.inter(
  //                                                         // color: Colors.grey,
  //                                                         fontSize: 16,
  //                                                         fontWeight:
  //                                                             FontWeight.w700),
  //                                                   ),
  //                                                   spacer10Height,
  //                                                   Row(
  //                                                     children: [
  //                                                       Container(
  //                                                         height: 20,
  //                                                         width: 20,
  //                                                         decoration: BoxDecoration(
  //                                                             color: Colors.red,
  //                                                             borderRadius:
  //                                                                 BorderRadius
  //                                                                     .circular(
  //                                                                         2)),
  //                                                         child: const Center(
  //                                                           child: Icon(
  //                                                             CupertinoIcons
  //                                                                 .arrow_down_left,
  //                                                             color: white,
  //                                                             size: 20,
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                       spacer10Width,
  //                                                       Text(
  //                                                         // balance == "null"
  //                                                         //     ? "-----"
  //                                                         //     :
  //                                                         balance
  //                                                             ? "₹ ${balanceProvider.totalOutflowAmount.toString() == "null" ? "0" : balanceProvider.totalOutflowAmount}"
  //                                                             : "₹ ......",
  //                                                         style:
  //                                                             GoogleFonts.inter(
  //                                                                 // color: Colors.black,
  //                                                                 fontSize: 14,
  //                                                                 fontWeight:
  //                                                                     FontWeight
  //                                                                         .w600),
  //                                                       ),
  //                                                     ],
  //                                                   ),
  //                                                 ],
  //                                               ),
  //                                             ])),),
  //                                       Expanded(flex: 1,child: Container(color: white,child: TransactionChart(),))
                                        
  //                                     ],
  //                                   ),
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),