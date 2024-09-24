import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/loading_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/snakebar_helper.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Package%20List/Package%20Item%20Details/package_items_details.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/Dashboard/Bottom%20Menu%20Screens/Home%20Menu/Test%20List/Test%20Item%20Details/test_items_details.dart';
import 'package:http/http.dart' as http;

import '../../App Helper/Netwok Helper/api_url_helper.dart';
import '../../App Helper/font_&_color_helper.dart';

class GlobalSearch extends SearchDelegate {
  String? accessToken;
  GlobalSearch({Key? key, this.accessToken});
  int currentIndex = 0;
  var jsonData;

  Future<List?> getGlobalData(var index) async {
    final url = Uri.parse(ApiHelper.globalSearchUrls);
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final body = {'search': query};
    final response = await http.post(url, headers: headers, body: body);
    var jsonResponse = json.decode(response.body);
    var bodyStatus = jsonResponse['status'];

    if (bodyStatus == 400) {
      var bodyMsg = jsonResponse['massage'];
      SnackBarHelper.getWarningMsg('$bodyMsg');
    } else {
      if (response.statusCode == 200) {
        jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final itemList = jsonData['data']['data'] as List<dynamic>;
        return itemList;
      } else {
        throw Exception('Failed to load items');
      }
    }
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  List<Widget> buildActions(BuildContext context) => [
        query.isNotEmpty
            ? IconButton(
                onPressed: () {
                  showResults(context);
                },
                icon: const Icon(Icons.search))
            : Container()
      ];

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<dynamic>?>(
        future: getGlobalData(currentIndex + 1),
        builder:
            (BuildContext? context, AsyncSnapshot<List<dynamic>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CenterLoading();
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(child: Text('Error: $error'));
          } else if (snapshot.hasData && snapshot.data != null) {
            final items = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              itemCount: items!.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: item['is_package'] == 1
                                ? ColorHelper.hsPrime.withOpacity(0.5)
                                : ColorHelper.hsPrime.withOpacity(0.5),
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text("${item['service_name']}",
                              style: const TextStyle(
                                  fontFamily: FontHelper.montserratMedium,
                                  fontSize: 15,
                                  color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Divider(color: hsOne,thickness: 1),
                              SizedBox(
                                  width: Get.width / 1.5,
                                  child: Text(
                                    "${item['specimen_volume']}",
                                    style: const TextStyle(
                                        fontFamily:
                                            FontHelper.montserratRegular,
                                        letterSpacing: 0.5,
                                        color: Colors.black87,
                                        fontSize: 12),
                                  )),
                              Row(
                                children: [
                                  Text("\u{20B9}${item['mrp_amount']}",
                                      style: TextStyle(
                                          fontFamily:
                                              FontHelper.montserratMedium,
                                          fontSize: 18,
                                          color: ColorHelper.hsBlack)),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      if (item['is_package'] == 1) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             PackageItemDetails(
                                        //               packageId: item['id'],
                                        //               accessToken: accessToken,
                                        //             )));
                                        Get.to(() => PackageItemsDetails(
                                            packageId: item['id']));
                                      } else {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             TestItemDetails(
                                        //               testId: item['id'],
                                        //               accessToken: accessToken,
                                        //             )));
                                        Get.to(() => TestItemDetails(
                                            testId: item['id']));
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: item['is_package'] == 1
                                              ? ColorHelper.hsPrime
                                              : ColorHelper.hsPrime),
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 8, 15, 8),
                                      child: const Text("+ Know More",
                                          style: TextStyle(
                                              fontFamily:
                                                  FontHelper.montserratRegular,
                                              fontSize: 13,
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: Text(
              'No data available',
              style: TextStyle(
                  fontFamily: FontHelper.montserratMedium,
                  fontWeight: FontWeight.bold),
            ));
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
