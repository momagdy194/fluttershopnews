import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shopnew/Api/api_utl.dart';
import 'package:shopnew/Api/authantiction.dart';
import 'package:shopnew/product/product_category.dart';
import 'package:http/http.dart' as http;
import 'package:shopnew/product/product_tag.dart';
import 'package:shopnew/utility/country.dart';
import 'package:shopnew/utility/country_city.dart';
import 'package:shopnew/utility/country_state.dart';

class HelperApi {
  Future<List< ProductCategory>> fetchCategory(int page) async {
    String url = ApiUtil.CATEGORY + '?page=' + page.toString();
    http.Response response = await http.get(url, headers: header);

    switch (response.statusCode) {
      case 200:
        List<ProductCategory> catogries = [];
        if(response.statusCode==200){
          var body = jsonDecode(response.body);
          for (var item in body['data']) {
            ProductCategory catogerty = ProductCategory.fromJson(item);
            catogries.add(catogerty);
            print((item));
          }}
        return catogries;
    }
  }



  Future<List<ProductTag>>fetchTags(int page) async{
    String url = ApiUtil.TAGS + '?page=' + page.toString();

    http.Response response =await http.get(url,headers: header);
List<ProductTag>tag=[];
      if(response.statusCode==200){
        var body=jsonDecode(response.body);
        var data=body['data'];
        for(var item in data){
          tag.add(ProductTag.fromJson(item));
        }
        return tag;
      }
  }
  Future<List<Country>> fetchCountries(int page) async {
    String url = ApiUtil.COUNTRIES + '?page=' + page.toString();      http.Response response=await http.get(url,headers: header);
      List <Country> country=[];
      if(response.statusCode==200){
        var body=jsonDecode(response.body);
        var data=body['data'];
        for(var item in data){
          country.add(Country.fromJson(item));
        }return country;
      }
    }

    Future<List<CountryState>> fetchStates(int countery, int page) async {
      String url = ApiUtil.STATES(countery) + '?page=' + page.toString();
      http.Response response = await http.get(url, headers: header);
      List<CountryState> States = [];

      switch (response.statusCode) {
        case 200:
          var body = jsonDecode(response.body);
          for (var item in body['data']) {
            States.add(CountryState.fromJson(item));
          }
          break;
      }
      return States;
    }
    Future<List<CountryCity>> fetchCities(int countery, int page) async {
      String url = ApiUtil.CITIES(countery) + '?page=' + page.toString();
      http.Response response = await http.get(url, headers: header);
      List<CountryCity> City = [];

      switch (response.statusCode) {
        case 200:
          var body = jsonDecode(response.body);
          for (var item in body['data']) {
            City.add(CountryCity.fromJson(item));
          }
          break;
      }
      return City;
    }

}
