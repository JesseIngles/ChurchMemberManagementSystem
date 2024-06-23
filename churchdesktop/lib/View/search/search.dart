import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xFFFAFAFA),
                  filled: true),
            )),
      ),
    );
  }
}
