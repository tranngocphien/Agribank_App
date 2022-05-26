import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_theme.dart';

class AccountInformationWidget extends StatefulWidget {
  final List<BankAccountEntity> accounts;
  final int indexSelected;
  final Function(int) onPress;
  const AccountInformationWidget(
      {Key? key,
      required this.accounts,
      required this.onPress,
      required this.indexSelected})
      : super(key: key);

  @override
  State<AccountInformationWidget> createState() =>
      _AccountInformationWidgetState();
}

class _AccountInformationWidgetState extends State<AccountInformationWidget> {
  bool isHideMoney = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height160,
      width: width,
      padding: EdgeInsets.all(width8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width16), color: white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.credit_card,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(
                width: width16,
              ),
              Text(
                'Tài khoản thanh toán',
                style: Styles.baseNotoSansTS
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: height32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.accounts[widget.indexSelected].accountNumber,
                style: Styles.baseNotoSansTS
                    .copyWith(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              GestureDetector(
                child: const Icon(Icons.keyboard_arrow_down),
                onTap: () {
                  Get.dialog(
                      Dialog(
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width16)),
                          child: Column(
                            children: [
                              Container(
                                width: width * 0.9,
                                height: height60,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF67D10),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(width16),
                                        topLeft: Radius.circular(width16))),
                                child: Center(
                                    child: Text(
                                  "Tài khoản nguồn",
                                  style: Styles.baseNotoSansTS.copyWith(
                                      fontSize: 18,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              SizedBox(
                                height: height8,
                              ),
                              ...widget.accounts.map((e) => GestureDetector(
                                    onTap: () {
                                      widget.onPress(widget.accounts.indexOf(e));
                                      Get.back();
                                    },
                                    child: AccountItem(
                                      account: e,
                                      isSelected: widget.accounts.indexOf(e) ==
                                          widget.indexSelected,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      useSafeArea: true);
                },
              )
            ],
          ),
          SizedBox(
            height: height32,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Số dư:',
                style: Styles.baseNotoSansTS.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Text(
                isHideMoney
                    ? "${widget.accounts[widget.indexSelected].money} VND"
                    : '*******',
                style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 16,
                    color: const Color(0xFFF67D10),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isHideMoney = !isHideMoney;
                    });
                  },
                  child: Icon(
                      isHideMoney ? Icons.visibility_off : Icons.visibility))
            ],
          )
        ],
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  const AccountItem({
    required this.account,
    required this.isSelected,
    Key? key,
  }) : super(key: key);
  final BankAccountEntity account;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Icon(
          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
          color: const Color(0xFFF67D10),
        ),
        const SizedBox(
          width: 32,
        ),
        Text(
          account.accountNumber,
          style: Styles.baseNotoSansTS.copyWith(
              color: black, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
