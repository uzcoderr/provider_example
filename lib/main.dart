import 'package:flutter/material.dart';
import 'package:prov_pdp/viewmodel/home_viewmodel.dart';
import 'package:prov_pdp/views/item_of.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    viewModel.apiGetUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Architecture Patterns'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) => Center(
              child: ListView.builder(
            itemCount: viewModel.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemsOf().itemOfList(viewModel, index, context);
            },
          )),
        ),
      ),
    );
  }
}
