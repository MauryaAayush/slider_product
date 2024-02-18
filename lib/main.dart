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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Slider(
                min: 100,
                  max: 80000,
                  value: amount,
                  onChanged: (value) {

                  },),
              
              Text('All Product < Rs. 30000'),
              SizedBox(height:
                20,),
              Container(
                  height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.red
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
