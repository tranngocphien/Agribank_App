import 'package:agribank_banking/modules/account_information/screens/detail_saving_account/detail_saving_account_binding.dart';
import 'package:agribank_banking/modules/authentication/change_password/change_password_binding.dart';
import 'package:agribank_banking/modules/authentication/change_password/change_password_page.dart';
import 'package:agribank_banking/modules/authentication/update_information/update_information_binding.dart';
import 'package:agribank_banking/modules/authentication/update_information/update_information_page.dart';
import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_binding.dart';
import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_page.dart';
import 'package:agribank_banking/modules/card_service/screens/card_info/card_info_binding.dart';
import 'package:agribank_banking/modules/card_service/screens/card_info/card_info_page.dart';
import 'package:agribank_banking/modules/card_service/screens/detail_card_info/detail_card_info_binding.dart';
import 'package:agribank_banking/modules/card_service/screens/detail_card_info/detail_card_info_page.dart';
import 'package:agribank_banking/modules/card_service/screens/lock_card/lock_card_binding.dart';
import 'package:agribank_banking/modules/card_service/screens/lock_card/lock_card_page.dart';
import 'package:agribank_banking/modules/history_transaction/screens/detail_history_transaction/detail_history_transaction_binding.dart';
import 'package:agribank_banking/modules/history_transaction/screens/detail_history_transaction/detail_history_transaction_page.dart';
import 'package:agribank_banking/modules/info_app/info_app_binding.dart';
import 'package:agribank_banking/modules/info_app/info_app_page.dart';
import 'package:agribank_banking/modules/information_lookup/information_lookup_page.dart';
import 'package:agribank_banking/modules/information_lookup/screens/lookup_address/lookup_address_binding.dart';
import 'package:agribank_banking/modules/information_lookup/screens/lookup_rate/lookup_rate_binding.dart';
import 'package:agribank_banking/modules/information_lookup/screens/lookup_rate/lookup_rate_page.dart';
import 'package:agribank_banking/modules/manage_contacts/manage_contact_binding.dart';
import 'package:agribank_banking/modules/manage_contacts/manage_contact_page.dart';
import 'package:agribank_banking/modules/manage_contacts/screens/account_contacts/account_contacts_binding.dart';
import 'package:agribank_banking/modules/manage_contacts/screens/account_contacts/account_contacts_page.dart';
import 'package:agribank_banking/modules/manage_contacts/screens/create_account_contact/create_account_contact_binding.dart';
import 'package:agribank_banking/modules/manage_contacts/screens/create_account_contact/create_account_contact_page.dart';
import 'package:agribank_banking/modules/manage_contacts/screens/detail_contact/detail_contact_binding.dart';
import 'package:agribank_banking/modules/manage_contacts/screens/detail_contact/detail_contact_page.dart';
import 'package:agribank_banking/modules/online_saving_money/online_saving_money_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/online_saving_money_page.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/finish_saving_account/finish_saving_account_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/finish_saving_account/finish_saving_account_controller.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/finish_saving_account/finish_saving_account_page.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/online_deposit_settlement/online_deposit_settlement_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/online_deposit_settlement/online_deposit_settlement_page.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account/open_saving_account_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account/open_saving_account_page.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account_detail/open_saving_account_detail_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account_detail/open_saving_account_detail_page.dart';
import 'package:agribank_banking/modules/question_answer/question_answer_binding.dart';
import 'package:agribank_banking/modules/question_answer/question_answer_page.dart';
import 'package:agribank_banking/modules/question_answer/screens/detail_faq_category/detail_faq_category_binding.dart';
import 'package:agribank_banking/modules/question_answer/screens/detail_faq_category/detail_faq_category_page.dart';
import 'package:agribank_banking/modules/recharge_phone/recharge_phone_binding.dart';
import 'package:agribank_banking/modules/recharge_phone/recharge_phone_page.dart';
import 'package:agribank_banking/modules/soft_otp/screens/forgot_pin/forgot_pin_binding.dart';
import 'package:agribank_banking/modules/soft_otp/screens/forgot_pin/forgot_pin_page.dart';
import 'package:agribank_banking/modules/soft_otp/screens/set_pin/set_pin_binding.dart';
import 'package:agribank_banking/modules/soft_otp/screens/set_pin/set_pin_page.dart';
import 'package:agribank_banking/modules/soft_otp/screens/turn_off_pin/turn_off_binding.dart';
import 'package:agribank_banking/modules/soft_otp/screens/turn_off_pin/turn_off_page.dart';
import 'package:agribank_banking/modules/soft_otp/screens/update_pin/old_pin_page.dart';
import 'package:agribank_banking/modules/soft_otp/screens/update_pin/update_pin_binding.dart';
import 'package:agribank_banking/modules/soft_otp/screens/update_pin/update_pin_page.dart';
import 'package:agribank_banking/modules/soft_otp/soft_otp_binding.dart';
import 'package:agribank_banking/modules/soft_otp/soft_otp_page.dart';
import 'package:agribank_banking/modules/transfer/screens/confirm_transaction/confirm_transaction_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/confirm_transaction/confirm_transaction_page.dart';
import 'package:agribank_banking/modules/transfer/screens/confirm_transaction_password/confirm_transaction_password_bindings.dart';
import 'package:agribank_banking/modules/transfer/screens/confirm_transaction_password/confirm_transaction_password_page.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_st/transfer_external_by_cardnum_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_st/transfer_external_by_cardnum_page.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk/transfer_external_by_accnum_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk/transfer_external_by_accnum_page.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk_detail/transfer_external_by_accnum_detail_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk_detail/transfer_external_by_accnum_detail_page.dart';
import 'package:agribank_banking/modules/transfer/screens/result_finish_saving/result_finish_saving_page.dart';
import 'package:agribank_banking/modules/transfer/screens/result_open_saving/result_open_saving_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/result_phone/result_phone_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/result_phone/result_phone_page.dart';
import 'package:agribank_banking/modules/transfer/screens/result_transaction/result_transaction_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/result_transaction/result_transaction_page.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal_detail/transfer_internal_detail_page.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_qr/transfer_by_qr_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_qr/transfer_by_qr_page.dart';

import '../modules/account_information/account_information_binding.dart';
import '../modules/account_information/account_information_page.dart';
import '../modules/account_information/screens/detail_saving_account/detail_saving_account_page.dart';
import '../modules/authentication/cccd_authentication/cccd_authentication_binding.dart';
import '../modules/authentication/cccd_authentication/cccd_authentication_page.dart';
import '../modules/authentication/login/login_binding.dart';
import '../modules/authentication/login/login_page.dart';
import '../modules/authentication/register/register_binding.dart';
import '../modules/authentication/register/register_page.dart';
import '../modules/card_service/card_service_binding.dart';
import 'package:agribank_banking/modules/detail_information/detail_infomation_page.dart';
import 'package:agribank_banking/modules/detail_information/detail_information_binding.dart';
import 'package:agribank_banking/modules/face_authentication/face_authentication_binding.dart';
import 'package:agribank_banking/modules/face_authentication/face_authentication_page.dart';
import 'package:agribank_banking/modules/history_transaction/history_transaction_binding.dart';
import 'package:agribank_banking/modules/history_transaction/history_transaction_page.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal/transfer_internal_binding.dart';
import 'package:agribank_banking/modules/transfer/transfer_binding.dart';
import '../modules/information_lookup/screens/lookup_address/lookup_address_page.dart';
import '../modules/information_lookup/screens/lookup_currency/lookup_currency_binding.dart';
import '../modules/information_lookup/screens/lookup_currency/lookup_currency_page.dart';
import '../modules/transfer/screens/result_finish_saving/result_finish_saving_binding.dart';
import '../modules/transfer/screens/result_open_saving/result_open_saving_page.dart';
import '../modules/transfer/screens/transfer_internal_detail/transfer_internal_detail_binding.dart';
import '../modules/transfer/screens/update_limit_trans/update_limit_trans_binding.dart';
import '../modules/transfer/screens/update_limit_trans/update_limit_trans_page.dart';
import '../modules/transfer/transfer_page.dart';
import 'package:get/get.dart';
import '../modules/card_service/card_service_page.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/notification/notification_binding.dart';
import '../modules/notification/notification_page.dart';
import '../modules/transfer/screens/transfer_internal/transfer_internal_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.faceAuthentication,
      page: () => const FaceAuthenticationPage(),
      binding: FaceAuthenticationBinding()
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: AppRoutes.cccdAuthentication,
      page: () => const CccdAuthenticationPage(),
      binding: CccdAuthenticationBinding()
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding()
    ),
    GetPage(
      name: AppRoutes.accountInformation,
      page: () => const AccountInformationPage(),
      binding: AccountInformationBinding()
    ),
    GetPage(
      name: AppRoutes.detailSavingAccount,
      page: () => const DetailSavingAccountPage(),
      binding: DetailSavingAccountBinding()
    ),
    GetPage(
      name: AppRoutes.cardService,
      page: () => const CardServicePage(),
      binding: CardServiceBinding()
    ),
    GetPage(
      name: AppRoutes.historyTransaction,
      page: () => const HistoryTransactionPage(),
      binding: HistoryTransactionBinding()
    ),
    GetPage(
      name: AppRoutes.detailHistoryTransaction,
      page: () => const DetailHistoryTransactionPage(),
      binding: DetailHistoryTransactionBinding()
    ),
    GetPage(
      name: AppRoutes.detailInformation,
      page: () => const DetailInformationPage(),
      binding: DetailInformationBinding()
    ),
    GetPage(
      name: AppRoutes.transfer,
      page: () => const TransferPage(),
      binding: TransferBinding()
    ),
    GetPage(
      name: AppRoutes.updateLimitTrans,
      page: () => const UpdateLimitTransPage(),
      binding: UpdateLimitTransBinding()
    ),
    GetPage(
      name: AppRoutes.transferInternal,
      page: () => const TransferInternalPage(),
      binding: TransferInternalBinding()
    ),
    GetPage(
      name: AppRoutes.transferDetailInternal,
      page: () => const TransferInternalDetailPage(),
      binding: TransferInternalDetailBinding()
    ),
    GetPage(
      name: AppRoutes.transferExQr,
      page: () => const TransferByQrPage(),
      binding: TransferByQrBinding()
    ),
    GetPage(
        name: AppRoutes.transferExCardNumber,
        page: () => const TransferExByCardNumberPage(),
        binding: TransferExternalByCardNumberBinding()
    ),
    GetPage(
        name: AppRoutes.transferExAccNumber,
        page: () => const TransferExByAccNumberPage(),
        binding: TransferExternalByAccNumberBinding()
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding()
    ),
    GetPage(
      name: AppRoutes.updateInformation,
      page: () => const UpdateInformationPage(),
      binding: UpdateInformationBinding()
    ),
    GetPage(
      name: AppRoutes.rechargePhone,
      page: () => const RechargePhonePage(),
      binding: RechargePhoneBinding()
    ),
    GetPage(
      name: AppRoutes.manageContact,
      page: () => const ManageContactPage(),
      binding: ManageContactBinding()
    ),
    GetPage(
      name: AppRoutes.manageContactAccount,
      page: () => const AccountContactsPage(),
      binding: AccountContactsBinding()
    ),
    GetPage(
      name: AppRoutes.onlineSavingMoney,
      page: () => const OnlineSavingMoneyPage(),
      binding: OnlineSavingMoneyBinding()
    ),
    GetPage(
      name: AppRoutes.openSavingAccount,
      page: () => const OpenSavingAccountPage(),
      binding: OpenSavingAccountBinding()
    ),
    GetPage(
      name: AppRoutes.openSavingAccountDetail,
      page: () => const OpenSavingAccountDetailPage(),
      binding: OpenSavingAccountDetailBinding()
    ),
    GetPage(
      name: AppRoutes.onlineDepositSettlement,
      page: () => const OnlineDepositSettlementPage(),
      binding: OnlineDepositSettlementBinding()
    ),
    GetPage(
      name: AppRoutes.buyPhoneCard,
      page: () => const BuyCardPhonePage(),
      binding: BuyCardPhoneBinding()
    ),
    GetPage(
      name: AppRoutes.questionAnswer,
      page: () => const QuestionAnswerPage(),
      binding: QuestionAnswerBinding()
    ),
    GetPage(
      name: AppRoutes.detailFAQCategory,
      page: () => const DetailFaqCategoryPage(),
      binding: DetailFaqCategoryBinding()
    ),
    GetPage(
      name: AppRoutes.confirmTransaction,
      page: () => const ConfirmTransactionPage(),
      binding: ConfirmTransactionBinding()
    ),
    GetPage(
      name: AppRoutes.confirmTransactionPassword,
      page: () => const ConfirmTransactionPasswordPage(),
      binding: ConfirmTransactionPasswordBinding()
    ),
    GetPage(
      name: AppRoutes.transferExAccNumberDetail,
      page: () => const TransferExternalByAccNumDetailPage(),
      binding: TransferExternalByAccNumberDetailBinding()
    ),
    GetPage(
      name: AppRoutes.softOTP,
      page: () => const SoftOPTPage(),
      binding: SoftOTPBinding()
    ),
    GetPage(
      name: AppRoutes.turnOnPin,
      page: () => const SetPinPage(),
      binding: SetPinBinding()
    ),
    GetPage(
      name: AppRoutes.enterOldPin,
      page: () => const OldPinPage()
    ),
    GetPage(
      name: AppRoutes.turnOffPin,
      page: () => const TurnOffPage(),
      binding: TurnOffBinding()
    ),
    GetPage(
      name: AppRoutes.updatePin,
      page: () => const UpdatePinPage(),
      binding: UpdatePinBinding()
    ),
    GetPage(
      name: AppRoutes.createContact,
      page: () => const CreateAccountContactPage(),
      binding: CreateAccountContactBinding()
    ),
    GetPage(
      name: AppRoutes.detailContact,
      page: () => const DetailContactPage(),
      binding: DetailContactBinding()
    ),
    GetPage(
      name: AppRoutes.infoApp,
      page: () => const InfoAppPage(),
      binding: InfoAppBinding(),
    ),
    GetPage(
      name: AppRoutes.cardInfo,
      page: () => const CardInfoPage(),
      binding: CardInfoBinding()
    ),
    GetPage(
      name: AppRoutes.cardInfoDetail,
      page: () => const DetailCardInfoPage(),
      binding: DetailCardInfoBinding()
    ),
    GetPage(
      name: AppRoutes.lockCard,
      page: () => const LockCardPage(),
      binding: LockCardBinding()
    ),
    GetPage(
      name: AppRoutes.resultTransaction,
      page: () => const ResultTransactionPage(),
      binding: ResultTransactionBinding()
    ),
    GetPage(
      name: AppRoutes.resultPhoneMoney,
      page: () => const ResultPhonePage(),
      binding: ResultPhoneBinding()
    ),
    GetPage(
      name: AppRoutes.resultOpenSaving,
      page: () => const ResultOpenSavingPage(),
      binding: ResultOpenSavingBinding()
    ),
    GetPage(
      name: AppRoutes.finishSavingAccount,
      page: () => const FinishSavingAccountPage(),
      binding: FinishSavingAccountBinding()
    ),
    GetPage(
      name: AppRoutes.resultFinishSaving,
      page: () => const ResultFinishSavingPage(),
      binding: ResultFinishSavingBinding()
    ),
    GetPage(
      name: AppRoutes.forgotPin,
      page: () => const ForgotPinPage(),
      binding: ForgotPinBinding()
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding()
    ),
    GetPage(
      name: AppRoutes.lookupInformation,
      page: () => const InformationLookUpPage(),
      binding: LookupRateBinding()
    ),
    GetPage(
      name: AppRoutes.lookupRate,
      page: () => const LookupRatePage(),
      binding: LookupRateBinding()
    ),
    GetPage(
        name: AppRoutes.lookupCurrency,
        page: () => const LookupCurrencyPage(),
        binding: LookupCurrencyBinding()
    ),
    GetPage(
        name: AppRoutes.lookupAddress,
        page: () => const LookupAddressPage(),
        binding: LookupAddressBinding()
    ),


  ];
}