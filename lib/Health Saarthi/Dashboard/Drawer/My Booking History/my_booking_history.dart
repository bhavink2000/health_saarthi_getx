import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/font_&_color_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/loading_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:intl/intl.dart';
import 'Controller/my_booking_history_controller.dart';

class MyBookingHistory extends StatelessWidget {
  const MyBookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyBookingHistoryController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorHelper.hsPrimeOne,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Text(
            'My Booking',
            style: TextStyle(
                fontFamily: FontHelper.montserratMedium,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: ColorHelper.hsPrime),
                      child: TextField(
                        controller: controller.fromDate,
                        readOnly: true,
                        style: const TextStyle(
                            fontFamily: FontHelper.montserratRegular,
                            color: Colors.white,
                            fontSize: 14),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            border: InputBorder.none,
                            labelText: "Start Date",
                            labelStyle: TextStyle(
                                fontFamily: FontHelper.montserratLight,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            controller.fromDate.text = formattedDate;
                          } else {}
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: ColorHelper.hsPrime),
                      child: TextField(
                        controller: controller.toDate,
                        readOnly: true,
                        style: const TextStyle(
                            fontFamily: FontHelper.montserratRegular,
                            color: Colors.white,
                            fontSize: 14),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            border: InputBorder.none,
                            labelText: "To Date",
                            labelStyle: TextStyle(
                                fontFamily: FontHelper.montserratLight,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            controller.toDate.text = formattedDate;
                          } else {}
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.fromDate.text.isEmpty ||
                            controller.toDate.text.isEmpty) {
                          SnackBarHelper.getWarningMsg('Please enter dates');
                        } else {
                          // Map data = {
                          //   'from_date': controller.fromDate.text,
                          //   'to_date': controller.toDate.text,
                          // };
                          // print("Map ->$data");
                          controller.fetchBookingHistory();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: ColorHelper.hsPrime),
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                              fontFamily: FontHelper.montserratMedium,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Obx(() => controller.isLoading.value
                    ? SizedBox(
                        height: Get.height / 1.5,
                        child: const CenterLoading(),
                      )
                    : controller.bookingHistoryModel.value.bookingData!
                            .bookingItems!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.bookingHistoryModel.value
                                .bookingData?.bookingItems?.length,
                            itemBuilder: (context, index) {
                              var bookingH = controller.bookingHistoryModel
                                  .value.bookingData?.bookingItems![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  shadowColor:
                                      ColorHelper.hsGrey.withOpacity(0.5),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      title: Text(
                                          bookingH!.pharmacyPatient!.name!,
                                          style: const TextStyle(
                                              fontFamily:
                                                  FontHelper.montserratMedium,
                                              letterSpacing: 1,
                                              fontSize: 16)),
                                      subtitle: Text(
                                          "Booking No :- ${bookingH.bookingCode!}",
                                          style: const TextStyle(
                                              fontFamily:
                                                  FontHelper.montserratRegular,
                                              letterSpacing: 1,
                                              fontSize: 12)),
                                      childrenPadding:
                                          const EdgeInsets.fromLTRB(
                                              10, 5, 10, 5),
                                      children: [
                                        showRowContent('Mobile Number',
                                            '${bookingH.pharmacyPatient!.mobileNo}'),
                                        const SizedBox(height: 5),
                                        showRowContent('Gross Amount',
                                            '\u{20B9}${bookingH.grossAmount ?? 0}'),
                                        const SizedBox(height: 5),
                                        showRowContent('Net Amount',
                                            '\u{20B9}${bookingH.netAmount ?? 0}'),
                                        const SizedBox(height: 5),
                                        showRowContent('Earning Amount',
                                            '\u{20B9}${bookingH.pharmacyDiscountAmount ?? 0}'),
                                        const SizedBox(height: 5),
                                        showRowContent(
                                            'Date', '${bookingH.createAt}'),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Booking Status ",
                                              style: TextStyle(
                                                  fontFamily: FontHelper
                                                      .montserratMedium,
                                                  letterSpacing: 1,
                                                  fontSize: 14),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: ColorHelper.hsPrime),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 10, 5),
                                              child: Text(
                                                  bookingH.status == 0
                                                      ? '${bookingH.bookingStatus!.s0}'
                                                      : bookingH.status == 1
                                                          ? '${bookingH.bookingStatus!.s1}'
                                                          : bookingH.status == 2
                                                              ? '${bookingH.bookingStatus!.s2}'
                                                              : bookingH.status ==
                                                                      3
                                                                  ? '${bookingH.bookingStatus!.s3}'
                                                                  : '${bookingH.bookingStatus!.s4}',
                                                  style: const TextStyle(
                                                      fontFamily: FontHelper
                                                          .montserratRegular,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              "No booking data",
                              style: TextStyle(
                                  fontFamily: FontHelper.montserratMedium,
                                  fontWeight: FontWeight.bold,
                                  color: ColorHelper.hsPrime,
                                  letterSpacing: 1),
                            ),
                          )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showRowContent(var lebal, var value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$lebal ",
          style: const TextStyle(
              fontFamily: FontHelper.montserratMedium,
              letterSpacing: 1,
              fontSize: 14),
        ),
        Text('$value',
            style: const TextStyle(
                fontFamily: FontHelper.montserratRegular,
                letterSpacing: 1,
                fontSize: 12)),
      ],
    );
  }
}
