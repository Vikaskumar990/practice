import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "syrup",
      "picture": "assets/images/bottle.png",
      "price": 150,
      "quantity": 1,
    },
    {
      "name": "tablet",
      "picture": "assets/images/img1.jpg",
      "price": 100,
      "quantity": 1,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index){
          return Single_cart_product(
            cart_product_name: Products_on_the_cart[index]["name"],
            cart_product_pic: Products_on_the_cart[index]["picture"],
            cart_product_price: Products_on_the_cart[index]["price"],
            cart_product_qty: Products_on_the_cart[index]["quantity"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_pic;
  final cart_product_price;
  final cart_product_qty;

  Single_cart_product({
    this.cart_product_name,
    this.cart_product_pic,
    this.cart_product_price,
    this.cart_product_qty,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//   ======= LEADING SECTION ========
        leading: new Image.asset(cart_product_pic, width: 80.0,
        height: 80.0,),

//  =========== TITLE SECTION ============
        title: new Text(cart_product_name),

//   ======== SUBTITLE SECTION ========
        subtitle: new Column(
          children: <Widget>[
// ======== THIS SECTION FOR THE PRICE OF THE PRODUCT =======
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              "\$${cart_product_price}",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),),
          )

          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
            new Text("$cart_product_qty"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})
          ],
        ),
      ),
    );
  }

/*  void addQuantity(){
    cart_product_qty = cart_product_qty + 1;
  }*/
}

