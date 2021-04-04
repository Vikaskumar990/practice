import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// my own imports
import 'package:practice/src/horizontal_listview.dart';
import 'package:practice/src/top_selling.dart';
import 'package:practice/src/Pages/cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 // var selectedOptionIndex = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
       // Image.asset('images/cashback.jpg'),
        images: [
          AssetImage('assets/images/cashback.jpg'),
          AssetImage('assets/images/medicineoff.jpg'),
          AssetImage('assets/images/sale.jpg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.redAccent,
        title: Text('medSupply', style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_basket_outlined, color: Colors.white,),
              onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //  Header part of drawer
            new UserAccountsDrawerHeader(accountName: Text('medSupply'),
              accountEmail: Text('medsupply792@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),

              ),
              decoration: new BoxDecoration(
                  color: Colors.brown
              ),
            ),
            // body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Shop by Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Your Cart'),
                leading: Icon(Icons.shopping_basket_outlined),
              ),
            ),

            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('CONTACT US'),
                //  leading: Icon(Icons.widgets_outlined),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('LEGAL'),
                // leading: Icon(Icons.widgets_outlined),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('FAQs'),
                // leading: Icon(Icons.widgets_outlined),
              ),
            ),
          ],
        )
        ,elevation: 0,),
      body: new Column(
        children: <Widget>[
          // image carousel begins here
          image_carousel,
          // padding widget
          new Padding(padding: const EdgeInsets.all(4.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Shop by Catogories')),),

          // Horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Top Selling')),),

          //grid view begins here
          
            Flexible(child: TopSelling()),


        ],
      ),
      //bottomNavigationBar: _buildBottomNavigationBar(),

      // bottom navigation begins here
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          activeIcon: Icon(Icons.dashboard),
          label: 'Category',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),

      ],),
    );
  }
}

/*Widget _buildBottomNavigationBar(){
  List<String> bottomNavigationOptions = [
    'Home',
    'Categories',
    'Favorites',
    'Profile'
  ];
  List<IconData> bottomNavigationBarIcons =[
    Icons.home_outlined,
    Icons.dashboard_outlined,
    Icons.favorite_border,
    Icons.person_outlined,
  ];
  List<IconData> bottomNavigationBarFillIcons = [
    Icons.home,
    Icons.dashboard,
    Icons.favorite,
    Icons.person,
  ];
  return Container(
    height: 80,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: List.generate(bottomNavigationOptions.length, (index) {
        var selectedOptionIndex = 0;
        if (index == selectedOptionIndex) {
          return
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptionIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        bottomNavigationBarFillIcons[index],
                        color: Colors.green,
                      ),
                      Center(
                        child: Text(bottomNavigationOptions[index],
                          style: TextStyle(color: Colors.green,fontWeight:FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ));
        }
        return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptionIndex = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    bottomNavigationBarIcons[index],
                    color: Colors.black,
                  ),
                  Center(
                    child: Text(bottomNavigationOptions[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ));
      }),
    ),
  );
}*/



