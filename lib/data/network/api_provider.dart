import 'package:default_project/data/network/api_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/model.dart';

class ApiProvider with ChangeNotifier{


  CountryData? countryData;

  bool isLoading = false;

  getData() async {
      isLoading = true;
      notifyListeners();
    countryData = await ApiService.getCountry();
      isLoading = false;
    notifyListeners();
  }

}