import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ordering_app/theme/colors.dart';
import 'package:ordering_app/widgets/product_slider.dart';
import 'dart:math' as math;

class ProductDetailPage extends StatefulWidget {
  final List images;
  final String img;
  final String name;
  final String description;
  final String extract;
  final String price;
  final String time;

  const ProductDetailPage(
      {Key key,
      this.images,
      this.img,
      this.name,
      this.description,
      this.extract,
      this.price,
      this.time})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ProductSlider(
                items: widget.images,
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(LineIcons.arrow_left),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.description,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: black),
                          child: Center(
                            child: Text(
                              '-',
                              style: TextStyle(color: white),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Text('1',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 15),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: black),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(color: white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  widget.extract,
                  style: TextStyle(height: 1.3),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text("Delivery Time"),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(width: 10),
                        Text(widget.time,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.price,
                          style: TextStyle(
                              fontSize: 23.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 18,
                          child: Container(
                            width: 35,
                            height: 35,
                            child: Stack(
                              children: [
                                Icon(LineIcons.shopping_cart,
                                    color: white, size: 30),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.redAccent),
                                    child: Center(
                                        child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
