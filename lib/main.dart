import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF085EA1),
      ));
 runApp(const Slider_list());
}

class Slider_list extends StatefulWidget {
  const Slider_list({super.key});

  @override
  State<Slider_list> createState() => _Slider_listState();
}

double amount = 500;

class _Slider_listState extends State<Slider_list> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,

          title: Text("Product List",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),),
          elevation: 10,shadowColor: Colors.black,
          centerTitle: true,
          actions: [
            Icon(
              Icons.apps,
              color: Colors.white,
              size: 28,
            )
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Slider(
                min: 100,
                  max: 80000,
                  value: amount,
                  onChanged: (value) {

                  },),
              
              Text('All Product < Rs. 30000',
              style: TextStyle(
                 fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height:
                20,),
              Container(
                  height: 90,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 5),
                      blurRadius: 3
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
