import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/modules/home/home_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/BottomNavigation.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xFFF0F0F0), shape: BoxShape.circle),
          child: const Icon(
            Icons.search,
            color: Color(0xFF246e38),
          ),
        ),
        title: Image.asset(
          'assets/images/agribank_logo.png',
          height: height160,
        ),
        centerTitle: true,
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Color(0xFFF0F0F0), shape: BoxShape.circle),
                child: const Icon(
                  Icons.menu,
                  color: Color(0xFF246e38),
                ),
              ),
            );
          }),
        ],
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: height225,
                        ),
                        Image.asset(
                          'assets/images/background.jpg',
                          width: width,
                          height: height180,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: height75,
                              width: width75,
                              padding: EdgeInsets.all(width8),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFc96a0a),
                                    shape: BoxShape.circle),
                                child: Icon(Icons.person,
                                    color: white, size: width45),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width24, vertical: height8),
                        decoration: BoxDecoration(
                            color: const Color(0xFFff7700),
                            gradient: const LinearGradient(colors: [
                              Color(0xFFd47c24),
                              Color(0xFFc96a0a),
                            ]),
                            borderRadius: BorderRadius.circular(width16)),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(color: white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(width8),
                      child: const Divider(
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.accountInformation);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: height60,
                                width: width60,
                                padding: EdgeInsets.all(width16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFf2f2f2),
                                    borderRadius:
                                        BorderRadius.circular(width25)),
                                child: Image.asset('assets/icons/ic_wallet.png', width: width40, height: height40,),
                              ),
                              SizedBox(
                                height: height4,
                              ),
                              const Text(
                                "Tài khoản",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: height60,
                              width: width60,
                              padding: EdgeInsets.all(width16),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFf2f2f2),
                                  borderRadius: BorderRadius.circular(width25)),
                              child: Image.asset('assets/icons/ic_qr_scan.png'),
                            ),
                            SizedBox(
                              height: height4,
                            ),
                            const Text(
                              "QR Pay",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.cardService);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: height60,
                                width: width60,
                                padding: EdgeInsets.all(width16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFf2f2f2),
                                    borderRadius:
                                        BorderRadius.circular(width25)),
                                child: Image.asset('assets/icons/ic_card.png')
                              ),
                              SizedBox(
                                height: height4,
                              ),
                              const Text(
                                "Dịch vụ thẻ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    CarouselSlider.builder(
                      itemCount: controller.banners.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Image.asset(controller.banners[itemIndex]),
                      options: CarouselOptions(
                        height: height241,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tài chính',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Xem thêm',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.deepOrange),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          SizedBox(
                            width: width,
                            // height: height110 * 3,
                            child: GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_transfer_money.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Chuyển khoản',
                                    onClick: () {
                                      Get.toNamed(AppRoutes.transfer);
                                    },
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_phone.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Nạp tiền điện thoại',
                                    onClick: () {
                                      Get.toNamed(AppRoutes.rechargePhone);
                                    },
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_invoice.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Thanh toán hóa đơn',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_buy_card.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Mua mã thẻ',
                                    onClick: () {
                                      Get.toNamed(AppRoutes.buyPhoneCard);
                                    },
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_picky_money.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Tiền gửi trực tuyến',
                                    onClick: () {
                                      Get.toNamed(AppRoutes.onlineSavingMoney);
                                    },
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_stock.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Nạp tiền chứng khoán',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_add_money.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Nạp tiền dịch vụ',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_lucky_money.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Gửi tiền mừng',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_kieu_hoi.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Nhận tiền kiều hối',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_money_bag.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Trả nợ',
                                    onClick: () {},
                                  ),

                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
              height: height54,
              padding: EdgeInsets.all(width8),
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItem(
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Color(0xFF246e38),
                    ),
                    text: const Text('Home',
                        style:
                            TextStyle(color: Color(0xFF246e38), fontSize: 12)),
                    onClick: () {
                      print('a');
                    },
                  ),
                  BottomNavigationItem(
                    icon: const Icon(Icons.notifications_none_outlined),
                    text:
                        const Text('Thông báo', style: TextStyle(fontSize: 12)),
                    onClick: () {
                      Get.toNamed(AppRoutes.notification);
                    },
                  ),
                  BottomNavigationItem(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    text: const Text('Mua sắm', style: TextStyle(fontSize: 12)),
                    onClick: () {
                      Get.bottomSheet(Container(
                        margin: EdgeInsets.only(
                            bottom: width16, left: width16, right: width16),
                        padding: EdgeInsets.all(width16),
                        height: height36 * 10,
                        width: width100,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(width32)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mua sắm',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: height8,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                children: [
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_transfer_money.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Chuyển khoản',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_phone.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Nạp tiền điện thoại',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_invoice.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Thanh toán hóa đơn',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_buy_card.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Mua mã thẻ',
                                    onClick: () {},
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_picky_money.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Tiền gửi trực tuyến',
                                    onClick: () {
                                      Get.toNamed(AppRoutes.onlineSavingMoney);
                                    },
                                  ),
                                  FunctionItem(
                                    icon: Image.asset(
                                      'assets/icons/ic_stock.png',
                                      height: height40,
                                      width: width40,
                                    ),
                                    text: 'Nạp tiền chứng khoán',
                                    onClick: () {},
                                  ),
                                ]),
                          ],
                        ),
                      ));
                    },
                  ),
                  BottomNavigationItem(
                    icon: const Icon(Icons.sports_golf),
                    text:
                        const Text('Sân Golf', style: TextStyle(fontSize: 12)),
                    onClick: () {},
                  ),
                  BottomNavigationItem(
                    icon: const Icon(Icons.history),
                    text: const Text('Lịch sử GD',
                        style: TextStyle(fontSize: 12)),
                    onClick: () {
                      Get.toNamed(AppRoutes.historyTransaction);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      endDrawer: buildDrawer(),
    );
  }

  Container buildDrawer() {
    return Container(
      width: width * 0.8,
      height: height * 0.8,
      margin: EdgeInsets.only(top: width32, right: width16, bottom: width16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(width16)),
      child: Column(
        children: [
          Container(
            height: height200,
            width: width,
            padding: EdgeInsets.all(width16),
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(width16),
                    topLeft: Radius.circular(width16))),
            child: Column(
              children: const [
                Icon(
                  Icons.account_circle,
                  color: white,
                  size: 80,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.wallet_membership_sharp,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Cài đặt Soft OTP',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.message,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Nhận tin biến động số dư',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.fingerprint,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Cài đặt vân tay',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.calculate_outlined,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Cài đặt hạn mức',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.language,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Cài đặt ngôn ngữ',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.lock,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Đổi mật khẩu',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.vpn_key_outlined,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Cấp/Đổi mã PIN',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.wallet_membership_sharp,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Quản lý danh bạ',
                onClick: () {
                  Get.toNamed(AppRoutes.manageContact);
                },
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.shopping_bag,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Quản lý đầu tư',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.info,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Thông tin ứng dụng',
                onClick: () {},
              ),
              DrawerNavigationItem(
                icons: const Icon(
                  Icons.question_mark_sharp,
                  color: Colors.deepOrangeAccent,
                ),
                title: 'Hỏi và đáp',
                onClick: () {
                  Get.toNamed(AppRoutes.questionAnswer);
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}

class FunctionItem extends StatelessWidget {
  const FunctionItem({
    required this.text,
    required this.icon,
    required this.onClick,
    Key? key,
    this.background,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final Function() onClick;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(top: width8, right: width8, left: width8),
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(width16)),
        child: Column(
          children: [
            icon,
            SizedBox(
              height: height8,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Styles.baseNotoSansTS
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w400,),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerNavigationItem extends StatelessWidget {
  const DrawerNavigationItem({
    Key? key,
    required this.icons,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  final Widget icons;
  final String title;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: width16, vertical: height16),
            child: Row(
              children: [
                icons,
                SizedBox(
                  width: width16,
                ),
                Text(title)
              ],
            ),
          ),
          const Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
