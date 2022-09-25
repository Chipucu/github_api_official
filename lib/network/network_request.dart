import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:github_api_app/model/user_detail.dart';
import 'package:github_api_app/model/users.dart';
import 'package:http/http.dart' as http;
class NetworkRequest {
  // request list of user from Github API
  static const String urlToGetUsers = "https://api.github.com/users";
  static List<Users> parseUsers(String responseBody){
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<Users> users = list.map((model) => Users.fromJson(model)).toList();
    return users;
  }

  static Future<List<Users>> fetchUsers({int page=1}) async{
    final response = await http.get(Uri.parse(urlToGetUsers));
    if(response.statusCode==200){
      return compute(parseUsers,response.body);
    }
    else if (response.statusCode==404){
      throw Exception("Not Found");
    }
    else throw Exception("Can't get list of user");
  }


  // fetch User Detail

  static UserDetail parseUserDetail(String responseBody){
    var detail = jsonDecode(responseBody) as dynamic;
    // UserDetail usersDetail = detail.map((model2) => UserDetail.fromJson(detail));
    UserDetail usersDetail = UserDetail.fromJson(detail);
    print("parse json( type text) to model class at: \n ${DateTime.now().millisecondsSinceEpoch}" );
    print("---------------");
    return usersDetail;
  }

  static Future<UserDetail> fetchUserDetail(String urlDetail) async{
    final response_detail = await http.get(Uri.parse(urlDetail));
    if(response_detail.statusCode==200){
      print("fetch success $urlDetail at:\n ${DateTime.now().millisecondsSinceEpoch}" );
      // print(response_detail.body);
      return compute(parseUserDetail,response_detail.body);
    }
    else if (response_detail.statusCode==404){
      throw Exception("Not Found");
    }
    else throw Exception("Can't get detail of user");
  }

}

