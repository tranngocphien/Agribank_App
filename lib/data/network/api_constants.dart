/// APIConstants
class APIConstants {
  ///Base URL
  // static const baseURL = 'https://demo1451999.software';
  static const baseURL = 'https://api.manhyellow.online';

  /// auth
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const changePassword = '/auth/changePassword';

  /// verify
  static const verifyOCR = '/verify/ocr_facematch';


  /// user
  static const listBankAccount = '/user/get_list_bank_account';
  static const listSavingAccount = '/user/get_list_saving_account';
  static const updateLimitTrans = '/user/update_trans_limit';


  /// transaction
  static const sendMoney = '/transaction/send_money';
  static const sendMoneyInterbank = '/transaction/send_money_interbank';
  static const rechargePhone = '/transaction/recharge_phone';
  static const buyCodePhone = '/transaction/buy_code_phone';
  static const historyTransaction = '/transaction/get_history';
  static const openSavingAccount ='/transaction/open_saving_account';
  static const finishSavingAccount = '/transaction/finish_saving_money';
  static const getUserNameTransactionInternal = '/transaction/get_user_transaction_internal';
  static const getUserNameTransactionInterbank = '/transaction/get_user_transaction_interbank';

  /// contact
  static const getListContact = '/contact/get_list';
  static const addContact = '/contact/create';
  static const deleteContact = '/contact/delete';
  static const updateContact = '/contact/update';

  /// cycle
  static const getCycles = '/cycle/get_list';
  static const getCurrency = '/currency_price/get_list';

  /// notification
  static const getNotifications = '/notification/get_list_notification';

  /// soft otp
  static const turnOn = '/soft_otp/turn_on';
  static const turnOff = '/soft_otp/turn_off';
  static const updatePin = '/soft_otp/update';
  static const forgotOTP = '/soft_otp/forget';

  /// info app
  static const infoApp = '/get_info_app';
  static const getListAddress = '/address/get_list';

  /// faq
  static const getListCategory = '/faq/get_list_category';
  static const getListFaq = '/faq/get_list';

  /// card
  static const getListCard = '/physical_card/get_list';
  static const updateCard = '/physical_card/update';

}
