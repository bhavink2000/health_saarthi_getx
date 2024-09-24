import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import '../../Model Helper/Dashboard Model/Reports Model/day_report_model.dart';
import '../../Model Helper/Dashboard Model/Reports Model/month_report_model.dart';
import '../../Model Helper/Dashboard Model/Reports Model/yers_report_model.dart';

class ChartApiCall{

  static Future<DayReportModel> fetchDayData(var monthYear) async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      var response = await http.post(
          Uri.parse(ApiHelper.dayReportUrls),
          headers: headers,
          body: {
            'month_year': monthYear.toString()
          }
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        log("Day Data->$jsonResponse");
        return DayReportModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<MonthReportModel> fetchMonthData(var year) async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      var response = await http.post(
          Uri.parse(ApiHelper.monthReportUrls),
          headers: headers,
          body: {
            'year': year.toString()
          }
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        log("Month Data->$jsonResponse");
        return MonthReportModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<YearsReportModel> fetchYearData(var fromDate, var toDate) async {
    final box = GetStorage();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };
    try {
      var response = await http.post(
          Uri.parse(ApiHelper.yearReportUrls),
          headers: headers,
          body: {
            'from_year': fromDate.toString(),
            'to_year': toDate.toString()
          }
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        log("Year Data->$jsonResponse");
        return YearsReportModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
