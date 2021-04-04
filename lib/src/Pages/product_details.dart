import 'package:flutter/material.dart';
import 'package:practice/src/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_old_price;
  final product_detail_new_price;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.redAccent,
        title: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => new Home()));},
            child: Text('medSupply', style: TextStyle(color: Colors.white),)),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,),
              onPressed: (){}),
        ],
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture),
                ),
              footer:  new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("\$${widget.product_detail_old_price}",
                        style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),)
                      ),
                      Expanded(
                          child: new Text("\$${widget.product_detail_new_price}",
                          style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.red),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //============ qty button============
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose the quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),)
                            ],
                          );
                        });
                  },
                color: Colors.white,
                textColor: Colors.grey,
                  elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Qty")
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),),
              )
            ],
          ),

          //========= button for buy,add to cart and wishlist ============
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.lightGreen,
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: new Text("Buy Now"),
                 ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red,), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,), onPressed: (){}),
            ],
          ),

          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product name", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand", style: TextStyle(color: Colors.grey),),),

              // === remember to create the product brand
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text("Brand X"),)
            ],
          ),

//       ADD THE PRODUCT CONDITION
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text("NEW"),)
            ],
          ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Similar Products"),
        ),
//     ======== similar products section ===========
          Container(
            height: 340.0,
            child: Similar_products(),
          )

        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
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
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: topselling_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Similar_single_prod(
            product_name: topselling_list[index]['name'],
            product_pic: topselling_list[index]['picture'],
            product_old_price: topselling_list[index]['old_price'],
            product_price: topselling_list[index]['price'],
          );
        }
    );
  }
}

class Similar_single_prod extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_old_price;
  final product_price;

  Similar_single_prod({
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

