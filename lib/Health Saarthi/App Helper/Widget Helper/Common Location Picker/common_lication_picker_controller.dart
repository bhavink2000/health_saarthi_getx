import 'dart:developer';

import 'package:get/get.dart';

import '../../Model Helper/Location Model/area_model.dart';
import '../../Model Helper/Location Model/branch_model.dart';
import '../../Model Helper/Location Model/city_model.dart';
import '../../Model Helper/Location Model/state_model.dart';
import '../../Netwok Helper/get_location_helper.dart';

class CommonLocationPickerController extends GetxController {
  GetLocationHelper locationHelper = GetLocationHelper();
  List<StateData?> stateList = [];
  RxString selectedState = ''.obs;
  RxString selectedStateId = ''.obs;
  RxBool stateLoading = false.obs;
  Future<void> fetchState() async {
    stateLoading(true);
    try {
      stateList = await locationHelper.getState();
      stateLoading(false);
    } catch (e) {
      log('Error in state load :-< $e');
      stateLoading(false);
    }
  }

  void onChangedState(value) {
    final selectedStateObject = stateList.firstWhere(
      (state) => state!.stateName == value,
      orElse: () => StateData(),
    );
    if (selectedStateObject != null) {
      cityList.clear();
      selectedCity.value = '';
      areaList.clear();
      selectedArea.value = '';
      branchList.clear();
      selectedBranch.value = '';
      selectedState.value = value;
      selectedStateId.value = '${selectedStateObject.id}';
      fetchCity(selectedStateId.value);
    }
  }

  List<CityData?> cityList = [];
  RxString selectedCity = ''.obs;
  RxString selectedCityId = ''.obs;
  RxBool cityLoading = false.obs;
  Future<void> fetchCity(stateId) async {
    cityLoading(true);
    try {
      cityList = await locationHelper.getCity(stateId);
      cityLoading(false);
    } catch (e) {
      log('Error in city load :-< $e');
      cityLoading(false);
    }
  }

  void onChangedCity(value) {
    final selectedCityObject = cityList.firstWhere(
      (city) => city!.cityName == value,
      orElse: () => CityData(), // Return an empty instance of StateData
    );
    if (selectedCityObject != null) {
      selectedCity.value = '';
      areaList.clear();
      selectedArea.value = '';
      branchList.clear();
      selectedBranch.value = '';
      selectedCity.value = value;
      selectedCityId.value = selectedCityObject.id.toString();

      // fetchBranch(selectedStateId, selectedCityId, '');

      fetchArea(selectedStateId, selectedCityId);
    }
  }

  List<AreaData?> areaList = [];
  RxString selectedArea = ''.obs;
  RxString selectedAreaId = ''.obs;
  RxBool areaLoading = false.obs;
  Future<void> fetchArea(stateId, cityId) async {
    areaLoading(true);
    try {
      areaList = await locationHelper.getArea(stateId, cityId);
      areaLoading(false);
    } catch (e) {
      log('Error in area load :-< $e');
      areaLoading(false);
    }
  }

  void onChangedArea(value) {
    final selectedAreaObject = areaList.firstWhere(
      (area) => area!.areaName == value,
      orElse: () => AreaData(), // Return an empty instance of StateData
    );
    if (selectedAreaObject != null) {
      selectedArea.value = value;
      selectedAreaId.value = selectedAreaObject.id.toString();
      fetchBranch(selectedStateId, selectedCityId, selectedAreaId);
    }
  }

  List<BranchData?> branchList = [];
  RxString selectedBranch = ''.obs;
  RxString selectedBranchId = ''.obs;
  RxBool branchLoading = false.obs;
  Future<void> fetchBranch(stateId, cityId, areaId) async {
    branchLoading(true);
    try {
      branchList = await locationHelper.getBranch(stateId, cityId, areaId);
      branchLoading(false);
    } catch (e) {
      log('Error in branch load :-< $e');
      branchLoading(false);
    }
  }

  void onChangedBranch(value) {
    final selectedBranchObject = branchList.firstWhere(
      (branch) => branch!.branchName == value,
      orElse: () => BranchData(), // Return an empty instance of StateData
    );
    if (selectedBranchObject != null) {
      selectedBranch.value = value;
      selectedBranchId.value = selectedBranchObject.id.toString();
    }
  }
}
