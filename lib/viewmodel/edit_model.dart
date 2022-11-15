import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:prov_pdp/service/ApiService.dart';

import '../model/Post.dart';

class EditViewModel extends ChangeNotifier{

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  void apiUpdateUsers(widget, BuildContext context, String api,Post post) {
    ApiService.UPDATE(api, ApiService.paramsPost(post))
        .then((value) => {
      Navigator.pop(context,widget.post),
      notifyListeners()
    });
  }


}