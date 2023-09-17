import 'package:flutter/material.dart';
import 'package:predition_admin/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ADMIN")),
      body: Column(
        children: [
          _buildTextInputBox("Title"),
          _buildTextInputBox("Sub Title"),
          _buildTextInputBox("Medium Title"),
          _buildTextInputBox("Small Title"),
        ],
      ),
    );
  }

  Widget _buildTextInputBox(String title) {
    HomePageProvider homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextFormField(
              key: UniqueKey(),
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (value) => homePageProvider.onChangeTextBox(value, ""),
            ),
          ),
        ],
      ),
    );
  }
}
