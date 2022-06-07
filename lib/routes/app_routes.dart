class AppRoutes {
  static const home = '/home';

  /// authentication
  static const faceAuthentication = '/faceAuthentication';
  static const login = '/login';
  static const cccdAuthentication = '/cccdAuthentication';

  static const updateInformation = '/updateInformation';

  /// notification
  static const notification = '/notification';
  static const accountInformation = '/accountInformation';
  static const cardService = '/cardService';
  static const historyTransaction = '/historyTransaction';
  static const detailInformation = '/detailInformation';

  /// transfer money
  static const transfer = '/transfer';
  static const transferInternal = '/transferInternal';
  static const transferDetailInternal = '/transferDetailInternal';
  static const transferExAccNumber = '/transferExAccNumber';
  static const transferExAccNumberDetail = '/transferExAccNumberDetail';
  static const transferExCardNumber = '/transferExCardNumber';
  static const transferExQr = '/transferQR';
  static const confirmTransaction = '/confirmTransaction';
  static const confirmTransactionPassword = '/confirmTransactionPassword';

  /// recharge phone money
  static const rechargePhone = '/rechargePhone';
  static const payInvoice = '/payInvoice';
  static const buyPhoneCard = '/buyPhoneCard';

  /// manage contact
  static const manageContact = '/manageContact';
  static const manageContactAccount = '/manageContactAccount';
  static const manageInvoice = '/manageInvoice';
  static const manageRecharge = '/manageCharge';
  static const manageCreditCard = '/manageCreditCard';
  static const createContact = '/createContact';

  /// online saving money
  static const onlineSavingMoney = '/onlineSavingMoney';
  static const openSavingAccount = '/openSavingAccount';
  static const openSavingAccountDetail = '/openSavingAccountDetail';
  static const onlineDepositSettlement = '/onlineDepositSettlement';

  /// question and answer
  static const questionAnswer = '/questionAnswer';

  /// otp
  static const softOTP = '/softOTP';
  static const turnOnPin = '/turnOnPin';
  static const updatePin = '/updatePin';
  static const enterOldPin = '/enterOldPin';

}