import 'package:agribank_banking/modules/manage_contacts/screens/detail_contact/detail_contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';

class DetailContactPage extends GetWidget<DetailContactController> {
  const DetailContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'DANH BẠ TÀI KHOẢN/THẺ',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(width16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(width16),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(width16)),
                  child: Column(
                    children: [
                      WidgetInput(
                        text: 'Loại giao dịch',
                        controller: controller.controllerType,
                        // enable: false,
                        suffixIcon: GestureDetector(
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
                                          borderRadius:
                                          BorderRadius.circular(width16)),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: width * 0.9,
                                            height: height60,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFF67D10),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(width16),
                                                    topLeft:
                                                    Radius.circular(width16))),
                                            child: Center(
                                                child: Text(
                                                  "Loại giao dịch",
                                                  style: Styles.baseNotoSansTS.copyWith(
                                                      fontSize: 18,
                                                      color: white,
                                                      fontWeight: FontWeight.w600),
                                                )),
                                          ),
                                          SizedBox(
                                            height: height8,
                                          ),
                                          ...controller.types.map((e) => InkWell(
                                            onTap: () {
                                              controller.indexType.value =
                                                  controller.types.indexOf(e);
                                              controller.controllerType.text =
                                                  e.title;
                                              Get.back();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(width8),
                                              child: Text(
                                                e.title,
                                                style: Styles.baseNotoSansTS
                                                    .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w600),
                                              ),
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  useSafeArea: true);
                            },
                            child: const Icon(Icons.keyboard_arrow_down)),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      // Obx(
                      //       () => controller.indexType.value == 1
                      //       ? WidgetInput(
                      //     text: 'Ngân hàng',
                      //     // controller: controller.controllerType,
                      //     // enable: false,
                      //     suffixIcon: GestureDetector(
                      //         onTap: () {
                      //           Get.dialog(
                      //               Dialog(
                      //                 insetPadding: EdgeInsets.zero,
                      //                 backgroundColor: Colors.transparent,
                      //                 child: Container(
                      //                   width: width * 0.9,
                      //                   height: height * 0.3,
                      //                   decoration: BoxDecoration(
                      //                       color: Colors.white,
                      //                       borderRadius:
                      //                       BorderRadius.circular(
                      //                           width16)),
                      //                   child: Column(
                      //                     children: [
                      //                       Container(
                      //                         width: width * 0.9,
                      //                         height: height60,
                      //                         decoration: BoxDecoration(
                      //                             color:
                      //                             const Color(0xFFF67D10),
                      //                             borderRadius: BorderRadius
                      //                                 .only(
                      //                                 topRight: Radius
                      //                                     .circular(
                      //                                     width16),
                      //                                 topLeft:
                      //                                 Radius.circular(
                      //                                     width16))),
                      //                         child: Center(
                      //                             child: Text(
                      //                               "Ngân hàng",
                      //                               style: Styles.baseNotoSansTS
                      //                                   .copyWith(
                      //                                   fontSize: 18,
                      //                                   color: white,
                      //                                   fontWeight:
                      //                                   FontWeight.w600),
                      //                             )),
                      //                       ),
                      //                       SizedBox(
                      //                         height: height8,
                      //                       ),
                      //                       ...controller.types
                      //                           .map((e) => InkWell(
                      //                         onTap: () {
                      //                           controller.indexType
                      //                               .value =
                      //                               controller.types
                      //                                   .indexOf(e);
                      //                           controller
                      //                               .controllerType
                      //                               .text = e.title;
                      //                           Get.back();
                      //                         },
                      //                         child: Container(
                      //                           padding:
                      //                           EdgeInsets.all(
                      //                               width8),
                      //                           child: Text(
                      //                             e.title,
                      //                             style: Styles
                      //                                 .baseNotoSansTS
                      //                                 .copyWith(
                      //                                 fontSize:
                      //                                 16,
                      //                                 fontWeight:
                      //                                 FontWeight
                      //                                     .w600),
                      //                           ),
                      //                         ),
                      //                       ))
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //               useSafeArea: true);
                      //         },
                      //         child: const Icon(Icons.keyboard_arrow_down)),
                      //   )
                      //       : Container(),
                      // ),
                      WidgetInput(
                        onPress: () {},
                        enable: false,
                        text: 'Họ tên',
                        controller: controller.controllerName,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      WidgetInput(
                        onPress: () {},
                        enable: false,
                        text: 'Số thẻ/Số TK',
                        controller: controller.controllerAccount,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height16,
                ),
                ButtonPrimaryText(
                    onTab: () async {
                      await controller.updateContact();
                    },
                    margin: EdgeInsets.all(width16),
                    padding: EdgeInsets.all(width16),
                    radius: 30,
                    fontWeightText: FontWeight.w600,
                    sizeText: 18,
                    colorBackground: const Color(0xFFF67D10),
                    colorText: white,
                    textPrimary: 'Cập nhật')
              ],
            ),
          )),
    );
  }
}
