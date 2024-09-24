import 'dart:convert';
import 'dart:developer';

import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/api_url_helper.dart';
import 'package:http/http.dart' as http;

import '../Model Helper/Location Model/area_model.dart';
import '../Model Helper/Location Model/branch_model.dart';
import '../Model Helper/Location Model/city_model.dart';
import '../Model Helper/Location Model/state_model.dart';

class GetLocationHelper {
  Future<List<StateData>> getState() async {
    try {
      final response = await http.get(
        Uri.parse(ApiHelper.stateUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        StateModel stateModel = StateModel.fromJson(data);
        List<StateData>? stateList = stateModel.data;
        log("State List -> $data");
        return stateList ?? [];
      } else {
        throw Exception('Failed to fetch state list');
      }
    } catch (e) {
      log("Error -> $e");
      throw Exception('Failed to fetch state list');
    }
  }

  Future<List<CityData>> getCity(var stateId) async {
    try {
      final response =
          await http.get(Uri.parse("${ApiHelper.cityUrl}$stateId"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        CityModel cityModel = CityModel.fromJson(data);
        List<CityData>? cityList = cityModel.data;
        log("City List ->$data");
        return cityList ?? [];
      } else {
        throw Exception('Failed to fetch city list');
      }
    }
    // on SocketException catch (e) {
    //   log('${e.message}');
    //   GetXSnackBarMsg.getWarningMsg('${e.message}');
    //   throw Exception('${e.message}');
    // }
    catch (e) {
      throw Exception('Failed to fetch City list');
    }
  }

  Future<List<AreaData>> getArea(var stateId, var cityId) async {
    try {
      final response = await http
          .get(Uri.parse("${ApiHelper.areaUrl}$stateId/$cityId"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        AreaModel areaModel = AreaModel.fromJson(data);
        List<AreaData>? areaList = areaModel.data;
        log("Area List ->$data");
        return areaList ?? [];
      } else {
        throw Exception('Failed to fetch area list');
      }
    }
    // on SocketException catch (e) {
    //   log('${e.message}');
    //   GetXSnackBarMsg.getWarningMsg('${e.message}');
    //   throw Exception('${e.message}');
    // }
    catch (e) {
      log("Error -> $e");
      throw Exception('Failed to fetch Area list');
    }
  }

  Future<List<BranchData>> getBranch(
      var stateId, var cityId, var areaId) async {
    try {
      final response = await http.get(
          Uri.parse("${ApiHelper.branchUrl}$stateId/$cityId/$areaId"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        BranchModel branchModel = BranchModel.fromJson(data);
        List<BranchData>? branchList = branchModel.data;
        log("Branch List ->$data");
        return branchList ?? [];
      } else {
        throw Exception('Failed to fetch branch list');
      }
    }
    // on SocketException catch (e) {
    //   log('${e.message}');
    //   GetXSnackBarMsg.getWarningMsg('${e.message}');
    //   throw Exception('${e.message}');
    // }
    catch (e) {
      log("Error -> $e");
      throw Exception('Failed to fetch branch list');
    }
  }
}
