import 'package:flutter/material.dart';
import 'package:prov_pdp/service/ApiService.dart';
import 'package:prov_pdp/viewmodel/edit_model.dart';

import '../model/Post.dart';

class PostUpdateScreen extends StatefulWidget {
  final Post post;
  final int index;

  const PostUpdateScreen({Key? key, required this.post, required this.index})
      : super(key: key);

  @override
  State<PostUpdateScreen> createState() => _PostUpdateScreenState();
}

class _PostUpdateScreenState extends State<PostUpdateScreen> {

  EditViewModel viewModel = EditViewModel();

  @override
  void initState() {
    viewModel.title.text = widget.post.title;
    viewModel.body.text = widget.post.body;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(50),
            alignment: Alignment.center,
            width: double.infinity,
            child: const Text(
              'Post',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'User Id',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: widget.post.userId.toString(),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Id',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: widget.post.id.toString(),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Title',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: TextField(
                    onChanged: (txt) {
                      widget.post.title = txt;
                    },
                    controller: viewModel.title,
                    decoration: InputDecoration(
                      hintText: 'title',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Body',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: TextField(
                    onChanged: (txt) {
                      widget.post.body = txt;
                    },
                    controller: viewModel.body,
                    decoration: InputDecoration(
                      hintText: 'body',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.apiUpdateUsers(widget,context,
                  "${ApiService.GET_API}/${widget.index}", widget.post);
            },
            child: const Text('submit'),
          )
        ],
      ),
    );
  }
}
