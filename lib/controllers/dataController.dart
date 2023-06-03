import 'dart:convert';
import 'package:blog_app/models/NewsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class DataController extends GetxController{
  NewsModel? newsModel;


  var url = 'https://newsapi.org/v2/top-headlines?country=US&apiKey=1f50d8d8695c47f38395269c2fd868fe';

  getData() async {
   http.Response response = await http.get(Uri.parse(url));

   if (response.statusCode == 200) {
     var data = jsonDecode(response.body);
     newsModel = NewsModel.fromJson(data);

   }
   else{
     print("There was an error here");
   }
  }
}