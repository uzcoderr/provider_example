import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:prov_pdp/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

class ItemsOf{

  Widget itemOfList(HomeViewModel viewModel,int index,BuildContext context,key){
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (doNothing){
              viewModel.removePost(index);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (doNothing){
              viewModel.nextPage(context, viewModel.posts[index], index);
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Update',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                viewModel.posts[index].title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                viewModel.posts[index].body,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Divider(),
          ],
        ),
      ),
    );
  }

}
