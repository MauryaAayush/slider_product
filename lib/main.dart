import 'package:flutter/material.dart';

void main()
{
 runApp(const Slider_list());
}

class Slider_list extends StatefulWidget {
  const Slider_list({super.key});

  @override
  State<Slider_list> createState() => _Slider_listState();
}

class _Slider_listState extends State<Slider_list> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product List",style: TextStyle(
            color: Colors.blueAccent,
          ),),

        ),
        body: Container(),
      ),
    );
  }
}
