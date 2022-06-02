/// APIConstants
class APIConstants {
  ///Base URL
  static const baseURL = 'https://demo1451999.software';

  /// auth
  static const login = '/auth/login';


  /// user
  static const listBankAccount = '/user/get_list_bank_account';


  /// transaction
  static const sendMoney = '/transaction/send_money';
  static const sendMoneyInterbank = '/transaction/send_money_interbank';
  static const rechargePhone = '/transaction/recharge_phone';
  static const buyCodePhone = '/transaction/buy_code_phone';
  static const historyTransaction = '/transaction/get_history';
  static const openSavingAccount ='/transaction/open_saving_account';

  /// contact
  static const getListContact = '/contact/get_list';
  static const addContact = '/contact/create';
  static const deleteContact = '/contact/delete';

  /// cycle
  static const getCycles = '/cycle/get_list';

  /// notification
  static const getNotifications = '/notification/get_list_notification';

}
