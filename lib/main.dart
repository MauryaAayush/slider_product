import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slider_product/utils/ProductList.dart';

void main() {
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


class _Slider_listState extends State<Slider_list> {

  double amount = 0;

  List selectedProducts = [];

 int Totalprice ()
 {
   int total = 0;

  for(var item in selectedProducts)
    {
    int price = item['price'];
    total = total + price;
    }
   return total;

 }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Product List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          elevation: 10,
          shadowColor: Colors.black,
          centerTitle: true,
          actions: const [
            Icon(
              Icons.apps,
              color: Colors.white,
              size: 28,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Slider(
                min: 0,
                max: 10000,
                value: amount,
                divisions: 100,
                activeColor: Colors.blueAccent,
                onChanged: (value) {
                  amount = value;

                  selectedProducts = data.where((item) => item['price'] < amount).toList();

                  setState(() {});
                },
              ),
              Text(
                'All Product < Rs. ${amount.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView(
                      children: List.generate(
                          data.length,
                          (index) => (data[index]['price'] < amount)
                              ? Our_Product(index)
                              : Container())
                  )
              ),

              Container(
                  height: height * 0.15,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.red,
                          height: 50,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total price',
                                style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                '\$${Totalprice()}',
                                style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          height: height * 0.068,
                          width: width * 0.59,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Checkout',
                                style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),

                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.black,
                                size: 25,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget Our_Product(int index) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        height: 90,
        width: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 5),
                  blurRadius: 3)
            ]),
        child: ListTile(
          leading: Text(
            '${data[index]['id']}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          title: Text(
            data[index]['name'],
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            data[index]['title'],
            style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Rs.${data[index]['price']}',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
