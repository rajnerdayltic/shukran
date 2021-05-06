import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                'Your cart',
                style: GoogleFonts.poppins(fontSize: 20.0, color: Colors.black),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(
                            'https://i2.wp.com/www.shukranngrp.com/wp-content/uploads/2021/03/Crystal-Water-500-ML-%E2%80%93-12-Pieces-Shrink-Wrap-1.png?fit=300%2C300&ssl=1'),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crystal 500ml Wrap',
                        style: GoogleFonts.poppins(
                            fontSize: 15.0, color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'د.إ5.50',
                        style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: Colors.black,
                                size: 15.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '1',
                              style: GoogleFonts.poppins(
                                  fontSize: 15.0, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.blueAccent,
                                size: 15.0,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
