import 'package:agribank_banking/modules/authentication/update_information/update_information_binding.dart';
import 'package:agribank_banking/modules/authentication/update_information/update_information_page.dart';
import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_binding.dart';
import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_page.dart';
import 'package:agribank_banking/modules/manage_contacts/manage_contact_binding.dart';
import 'package:agribank_banking/modules/manage_contacts/manage_contact_page.dart';
import 'package:agribank_banking/modules/online_saving_money/online_saving_money_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/online_saving_money_page.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/online_deposit_settlement/online_deposit_settlement_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/online_deposit_settlement/online_deposit_settlement_page.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account/open_saving_account_binding.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account/open_saving_account_page.dart';
import 'package:agribank_banking/modules/question_answer/question_answer_binding.dart';
import 'package:agribank_banking/modules/question_answer/question_answer_page.dart';
import 'package:agribank_banking/modules/recharge_phone/recharge_phone_binding.dart';
import 'package:agribank_banking/modules/recharge_phone/recharge_phone_page.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_st/transfer_external_by_cardnum_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_st/transfer_external_by_cardnum_page.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk/transfer_external_by_accnum_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk/transfer_external_by_accnum_page.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal_detail/transfer_internal_detail_page.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_qr/transfer_by_qr_binding.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_qr/transfer_by_qr_page.dart';

import '../modules/account_information/account_information_binding.dart';
import '../modules/account_information/account_information_page.dart';
import '../modules/authentication/cccd_authentication/cccd_authentication_binding.dart';
import '../modules/authentication/cccd_authentication/cccd_authentication_page.dart';
import '../modules/authentication/login/login_binding.dart';
import '../modules/authentication/login/login_page.dart';
import '../modules/card_service/card_service_binding.dart';
import 'package:agribank_banking/modules/detail_information/detail_infomation_page.dart';
import 'package:agribank_banking/modules/detail_information/detail_information_binding.dart';
import 'package:agribank_banking/modules/face_authentication/face_authentication_binding.dart';
import 'package:agribank_banking/modules/face_authentication/face_authentication_page.dart';
import 'package:agribank_banking/modules/history_transaction/history_transaction_binding.dart';
import 'package:agribank_banking/modules/history_transaction/history_transaction_page.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal/transfer_internal_binding.dart';
import 'package:agribank_banking/modules/transfer/transfer_binding.dart';
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
      name: AppRoutes.transferInternal,
      page: () => const TransferInternalPage(),
      binding: TransferInternalBinding()
    ),
    GetPage(
      name: AppRoutes.transferDetailInternal,
      page: () => const TransferInternalDetailPage(),
      binding: TransferInternalBinding()
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
    )
  ];
}