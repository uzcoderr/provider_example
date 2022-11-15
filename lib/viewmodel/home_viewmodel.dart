import 'package:flutter/material.dart';
import 'package:prov_pdp/model/Post.dart';
import 'package:prov_pdp/screens/edit_post_screen.dart';
import 'package:prov_pdp/service/ApiService.dart';

class HomeViewModel extends ChangeNotifier{

  List<Post> posts = [];

  void apiGetUsers() {
    ApiService.GET(ApiService.GET_API, ApiService.paramsEmpty())
        .then((value) => {
        posts = value!,
        notifyListeners(),
    });
  }

  Future<bool?> apiDeleteUsers(String api) {
    return ApiService.DELETE(api, ApiService.paramsEmpty());
  }


  void nextPage(BuildContext context,Post post,int index) async{

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostUpdateScreen(post: post, index: index)),
    );

    posts[index] = result;
    notifyListeners();

  }

  Future<bool?> removePost(index) {
    var response = apiDeleteUsers("${ApiService.GET_API}/$index");
    posts.removeAt(index);
    notifyListeners();
    return response;
  }

}