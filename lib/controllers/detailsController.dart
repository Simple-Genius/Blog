import 'dart:convert';
import 'package:blog_app/models/DetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class DetailsController extends GetxController{
 var detailsModel;

  var url = 'https://newsapi.org/v2/top-headlines?country=US&apiKey=1f50d8d8695c47f38395269c2fd868fe';


  var title = "Daily news".obs;
  getData() async {
    http.Response response = await http.get(Uri.parse(url));

    //print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      detailsModel = DetailsModel.fromJson(data).obs as DetailsModel?;

    }
    else{

    }
  }

}