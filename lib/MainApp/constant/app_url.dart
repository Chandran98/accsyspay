class AppURl {
  static var baseurl = "https://accsyspay.com/api/v1/";
  static var registerUrl = baseurl + "registerUser";
  static var loginUrl = baseurl + "loginUser";
  static var bannerUrl = baseurl + "bannerUrl";
  static var sendLoginOTP = baseurl + "sendLoginOTP";
  static var optCheckUrl = baseurl + "sendCode";
  static var verifiedUrl = baseurl + "getVerified";
  static var getProfileInfo = baseurl + "getProfileInfo";
  static var profileUpdate = baseurl + "profileUpdate";
  static var verifyPin = baseurl + "verifyPin";
  static var updatePasswordUrl = baseurl + "updatePassword";
  static var addWallet = baseurl + "addWallet";
  static var walletHistory = baseurl + "walletHistory";
  static var serviceHistory = baseurl + "serviceHistory?user_id=";
  static var walletBalance = baseurl + "getBalance?user_id=";
  static var forgotVerification = baseurl + "getForgotVerificationCode";
  static var voucherCheck = baseurl + "voucherCheck";
  static var voucherToWallet = baseurl + "voucherToWallet";
  static var fetchOperator = baseurl + "getAllbMobileOperator";
  static var getOperator = baseurl + "getAllbMobileOperatorList";
  static var getCircle = baseurl + "getAllbMobileCircleList";
  static var prePaidOffer = baseurl + "getAllbMobileOffer";
  static var prePaidPlan = baseurl + "getAllbMobilePrepaidPlan";
  static var payRecharge = baseurl + "getAllbMobileRechargePay";
  static var postPaidPlan = baseurl + "getAllbPostPaidFetch";
  static var utilityOperator = baseurl + "getAllbUtilityOperators";
  static var fetchBiller = baseurl + "getMCBillers";
  static var fetchAmount = baseurl + "getMCFetchAmount";
  static var billerParams = baseurl + "getMCBillerParameters";
  static var payBills = baseurl + "getMCBillPayment";
  static var charges = baseurl + "getHandlingCharges";
  static var razorScanPay = baseurl + "createContractRZ";
  static var dthOperatorList = baseurl + "getAllbDTHOperatorList";
  static var fetchDthAcc = baseurl + "getAllbDTHAccountInfo";
  static var fetchDthPlan = baseurl + "getAllbDTHPlan";
  static var payDthRecharge = baseurl + "getAllbDTHRechargePay";
  static var seatSellerCities = baseurl + "seatSellerCities";
  static var seatSellerAvailableTrip = baseurl + "seatSellerAvailableTrip";
  static var seatSellerSeatLayout = baseurl + "seatSellerSeatLayout";
  static var seatSellerBlockTicket = baseurl + "seatSellerBlockTicket";
  static var seatSellerBookTicket = baseurl + "seatSellerBookTicket";
  static var seatSellerCancelTicketData = baseurl + "seatSellerCancelTicketData";
  static var seatSellerCancelTicket = baseurl + "seatSellerCancelTicket?user_id=";
  static var seatSellerPrintTicket = baseurl + "seatSellerPrintTicket";
  static var busBookingHistory = baseurl + "busBookingHistory";
}
