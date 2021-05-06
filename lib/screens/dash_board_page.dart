import 'package:flutter/material.dart';
import 'package:shukran/widgets_pages/home_categories..dart';
import 'package:shukran/widgets_pages/product_card.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class SortBy {
  String value;
  String text;
  String sortOrder;

  SortBy({@required this.value, @required this.text, @required this.sortOrder});
}

class _DashBoardPageState extends State<DashBoardPage> {
  final _sortByOptions = [
    SortBy(value: 'popularity', text: 'Popularity', sortOrder: 'asc'),
    SortBy(value: 'modified', text: 'Latest', sortOrder: 'asc'),
    SortBy(value: 'price', text: 'Price Low to High', sortOrder: 'desc'),
    SortBy(value: 'price', text: 'Price High to Low', sortOrder: 'desc'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _productsFilter(),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
                // itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productsFilter() {
    return Container(
      height: 51.0,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFE6E6EC),
                filled: true,
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE6E6EC),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: PopupMenuButton(
              onSelected: (sortBy) {},
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item,
                    child: Container(
                      child: Text(item.text),
                    ),
                  );
                }).toList();
              },
              icon: Icon(
                Icons.tune,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
