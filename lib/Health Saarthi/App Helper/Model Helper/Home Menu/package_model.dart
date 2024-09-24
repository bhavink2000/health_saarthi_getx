class PackageModel {
  int? status;
  PackageData? packageData;
  CartData? cartData;

  PackageModel({this.status, this.packageData, this.cartData});

  PackageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    packageData = json['data'] != null ? PackageData.fromJson(json['data']) : null;
    cartData = json['cartData'] != null
        ? CartData.fromJson(json['cartData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (packageData != null) {
      data['data'] = packageData!.toJson();
    }
    if (cartData != null) {
      data['cartData'] = cartData!.toJson();
    }
    return data;
  }
}

class PackageData {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  PackageData(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  PackageData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  int? id;
  int? costCenterId;
  dynamic userId;
  int? stateId;
  int? cityId;
  int? areaId;
  int? sufalamServiceId;
  String? serviceCode;
  String? serviceName;
  String? applicableGender;
  int? isPackage;
  int? isProfile;
  String? tatDays;
  String? tatHours;
  String? tatMinutes;
  String? serviceClassification;
  String? collect;
  String? specimenVolume;
  String? specimenPreparation;
  String? storageTemperature;
  String? maxDiscountPercentageAllow;
  dynamic vendorServiceCode;
  String? patientPreparation;
  int? isPopularPackage;
  dynamic popularPackageSerialNumber;
  String? serviceImage;
  dynamic serviceImage1;
  dynamic serviceImage2;
  String? orderingInfo;
  String? reported;
  String? notes;
  String? limitation;
  String? mrpAmount;
  String? b2bDiscountPercentage;
  String? b2bDiscountAmount;
  String? totalAmount;
  String? discountAmount;
  String? netAmount;
  String? visitorAmount;
  int? isB2bB2cPrice;
  dynamic displayPrice;
  int? isAppRegistrationAllow;
  int? isMobileNoCompulsoryinRegistration;
  int? isHomeVisitNotApplicable;
  int? isAddressCompulsoryinRegistration;
  dynamic serviceDescription;
  String? clinicalReference;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? encTestManagementId;
  String? createAt;
  int? bookedStatus;
  String? mrp;
  State? state;
  City? city;
  Area? area;
  TestPackages? testPackages;

  Data(
      {this.id,
        this.costCenterId,
        this.userId,
        this.stateId,
        this.cityId,
        this.areaId,
        this.sufalamServiceId,
        this.serviceCode,
        this.serviceName,
        this.applicableGender,
        this.isPackage,
        this.isProfile,
        this.tatDays,
        this.tatHours,
        this.tatMinutes,
        this.serviceClassification,
        this.collect,
        this.specimenVolume,
        this.specimenPreparation,
        this.storageTemperature,
        this.maxDiscountPercentageAllow,
        this.vendorServiceCode,
        this.patientPreparation,
        this.isPopularPackage,
        this.popularPackageSerialNumber,
        this.serviceImage,
        this.serviceImage1,
        this.serviceImage2,
        this.orderingInfo,
        this.reported,
        this.notes,
        this.limitation,
        this.mrpAmount,
        this.b2bDiscountPercentage,
        this.b2bDiscountAmount,
        this.totalAmount,
        this.discountAmount,
        this.netAmount,
        this.visitorAmount,
        this.isB2bB2cPrice,
        this.displayPrice,
        this.isAppRegistrationAllow,
        this.isMobileNoCompulsoryinRegistration,
        this.isHomeVisitNotApplicable,
        this.isAddressCompulsoryinRegistration,
        this.serviceDescription,
        this.clinicalReference,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encTestManagementId,
        this.createAt,
        this.bookedStatus,
        this.mrp,
        this.state,
        this.city,
        this.area,
        this.testPackages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    costCenterId = json['cost_center_id'];
    userId = json['user_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    sufalamServiceId = json['sufalam_service_id'];
    serviceCode = json['service_code'];
    serviceName = json['service_name'];
    applicableGender = json['applicable_gender'];
    isPackage = json['is_package'];
    isProfile = json['is_profile'];
    tatDays = json['tat_days'];
    tatHours = json['tat_hours'];
    tatMinutes = json['tat_minutes'];
    serviceClassification = json['service_classification'];
    collect = json['collect'];
    specimenVolume = json['specimen_volume'];
    specimenPreparation = json['specimen_preparation'];
    storageTemperature = json['storage_temperature'];
    maxDiscountPercentageAllow = json['max_discount_percentage_allow'];
    vendorServiceCode = json['vendor_service_code'];
    patientPreparation = json['patient_preparation'];
    isPopularPackage = json['is_popular_package'];
    popularPackageSerialNumber = json['popular_package_serial_number'];
    serviceImage = json['service_image'];
    serviceImage1 = json['service_image_1'];
    serviceImage2 = json['service_image_2'];
    orderingInfo = json['ordering_info'];
    reported = json['reported'];
    notes = json['notes'];
    limitation = json['limitation'];
    mrpAmount = json['mrp_amount'];
    b2bDiscountPercentage = json['b2b_discount_percentage'];
    b2bDiscountAmount = json['b2b_discount_amount'];
    totalAmount = json['total_amount'];
    discountAmount = json['discount_amount'];
    netAmount = json['net_amount'];
    visitorAmount = json['visitor_amount'];
    isB2bB2cPrice = json['is_b2b_b2c_price'];
    displayPrice = json['display_price'];
    isAppRegistrationAllow = json['is_app_registration_allow'];
    isMobileNoCompulsoryinRegistration =
    json['is_mobile_no_compulsoryin_registration'];
    isHomeVisitNotApplicable = json['is_home_visit_not_applicable'];
    isAddressCompulsoryinRegistration =
    json['is_address_compulsoryin_registration'];
    serviceDescription = json['service_description'];
    clinicalReference = json['clinical_reference'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    encTestManagementId = json['enc_test_management_id'];
    createAt = json['create_at'];
    bookedStatus = json['booked_status'];
    mrp = json['mrp'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
    testPackages = json['test_packages'] != null
        ? TestPackages.fromJson(json['test_packages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cost_center_id'] = costCenterId;
    data['user_id'] = userId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['sufalam_service_id'] = sufalamServiceId;
    data['service_code'] = serviceCode;
    data['service_name'] = serviceName;
    data['applicable_gender'] = applicableGender;
    data['is_package'] = isPackage;
    data['is_profile'] = isProfile;
    data['tat_days'] = tatDays;
    data['tat_hours'] = tatHours;
    data['tat_minutes'] = tatMinutes;
    data['service_classification'] = serviceClassification;
    data['collect'] = collect;
    data['specimen_volume'] = specimenVolume;
    data['specimen_preparation'] = specimenPreparation;
    data['storage_temperature'] = storageTemperature;
    data['max_discount_percentage_allow'] = maxDiscountPercentageAllow;
    data['vendor_service_code'] = vendorServiceCode;
    data['patient_preparation'] = patientPreparation;
    data['is_popular_package'] = isPopularPackage;
    data['popular_package_serial_number'] = popularPackageSerialNumber;
    data['service_image'] = serviceImage;
    data['service_image_1'] = serviceImage1;
    data['service_image_2'] = serviceImage2;
    data['ordering_info'] = orderingInfo;
    data['reported'] = reported;
    data['notes'] = notes;
    data['limitation'] = limitation;
    data['mrp_amount'] = mrpAmount;
    data['b2b_discount_percentage'] = b2bDiscountPercentage;
    data['b2b_discount_amount'] = b2bDiscountAmount;
    data['total_amount'] = totalAmount;
    data['discount_amount'] = discountAmount;
    data['net_amount'] = netAmount;
    data['visitor_amount'] = visitorAmount;
    data['is_b2b_b2c_price'] = isB2bB2cPrice;
    data['display_price'] = displayPrice;
    data['is_app_registration_allow'] = isAppRegistrationAllow;
    data['is_mobile_no_compulsoryin_registration'] =
        isMobileNoCompulsoryinRegistration;
    data['is_home_visit_not_applicable'] = isHomeVisitNotApplicable;
    data['is_address_compulsoryin_registration'] =
        isAddressCompulsoryinRegistration;
    data['service_description'] = serviceDescription;
    data['clinical_reference'] = clinicalReference;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_test_management_id'] = encTestManagementId;
    data['create_at'] = createAt;
    data['booked_status'] = bookedStatus;
    data['mrp'] = mrp;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (area != null) {
      data['area'] = area!.toJson();
    }
    if (testPackages != null) {
      data['test_packages'] = testPackages!.toJson();
    }
    return data;
  }
}

class State {
  int? id;
  String? stateName;
  String? encStateId;
  String? createAt;

  State({this.id, this.stateName, this.encStateId, this.createAt});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateName = json['state_name'];
    encStateId = json['enc_state_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_name'] = stateName;
    data['enc_state_id'] = encStateId;
    data['create_at'] = createAt;
    return data;
  }
}

class City {
  int? id;
  String? cityName;
  String? encCityId;
  String? createAt;

  City({this.id, this.cityName, this.encCityId, this.createAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['city_name'];
    encCityId = json['enc_city_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city_name'] = cityName;
    data['enc_city_id'] = encCityId;
    data['create_at'] = createAt;
    return data;
  }
}

class Area {
  int? id;
  String? areaName;
  String? encAreaId;
  String? createAt;

  Area({this.id, this.areaName, this.encAreaId, this.createAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaName = json['area_name'];
    encAreaId = json['enc_area_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['area_name'] = areaName;
    data['enc_area_id'] = encAreaId;
    data['create_at'] = createAt;
    return data;
  }
}

class TestPackages {
  int? id;
  int? sufalamPackageId;
  int? sufalamServiceId;
  int? testManagementsId;
  String? serviceName;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? encTestPackageId;
  String? createAt;

  TestPackages(
      {this.id,
        this.sufalamPackageId,
        this.sufalamServiceId,
        this.testManagementsId,
        this.serviceName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encTestPackageId,
        this.createAt});

  TestPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sufalamPackageId = json['sufalam_package_id'];
    sufalamServiceId = json['sufalam_service_id'];
    testManagementsId = json['test_managements_id'];
    serviceName = json['service_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    encTestPackageId = json['enc_test_package_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sufalam_package_id'] = sufalamPackageId;
    data['sufalam_service_id'] = sufalamServiceId;
    data['test_managements_id'] = testManagementsId;
    data['service_name'] = serviceName;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_test_package_id'] = encTestPackageId;
    data['create_at'] = createAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class CartData {
  dynamic count;
  dynamic amount;

  CartData({this.count, this.amount});

  CartData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['amount'] = amount;
    return data;
  }
}