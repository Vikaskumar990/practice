import 'package:flutter/material.dart';
import 'package:practice/src/Pages/product_details.dart';
import 'package:practice/src/Pages/product_details.dart';

class TopSelling extends StatefulWidget {
  @override
  _TopSellingState createState() => _TopSellingState();
}

class _TopSellingState extends State<TopSelling> {
  var topselling_list =[
    {
      "name": "syrup",
      "picture": "assets/images/bottle.png",
      "old_price": 180,
      "price": 150,
    },
    {
      "name": "tablet",
      "picture": "assets/images/img1.jpg",
      "old_price": 120,
      "price": 100,
    },
    {
      "name": "tablet",
      "picture": "assets/images/product.png",
      "old_price": 150,
      "price": 120,
    },
    {
      "name": "syrup",
      "picture": "assets/images/bottle.png",
      "old_price": 220,
      "price": 180,
    },
    {
      "name": "tablet",
      "picture": "assets/images/img1.jpg",
      "old_price": 150,
      "price": 120,
    },
    {
      "name": "tablet",
      "picture": "assets/images/product.png",
      "old_price": 175,
      "price": 145,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: topselling_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod_selling(
              product_name: topselling_list[index]['name'],
              product_pic: topselling_list[index]['picture'],
              product_old_price: topselling_list[index]['old_price'],
              product_price: topselling_list[index]['price'],
            ),
          );
        }
        );
  }
}

class Single_prod_selling extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_old_price;
  final product_price;

  Single_prod_selling({
    this.product_name,
    this.product_pic,
    this.product_old_price,
    this.product_price,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).push(
                      new MaterialPageRoute(
                        //here we are passing the values of the product to product details page
                          builder: (context) => new ProductDetails(
                            product_detail_name: product_name,
                            product_detail_new_price: product_price,
                            product_detail_old_price: product_old_price,
                            product_detail_picture: product_pic,
                          ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: new Row(children: <Widget>[
                  Expanded(
                    child: new Text(product_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  ),
                  new Text("\$${product_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                ],)
              ),
              child: Image.asset(product_pic,
              fit: BoxFit.cover,)),
            ),
      )),
    );
  }
}
