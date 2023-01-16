import 'dart:convert';

import 'package:untitled/Shopping_Cart/Item_List.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


List<Item_List> item_list = <Item_List>[];
List<Item_List> _cartList = <Item_List>[];
List<Item_List> total_cartitem = <Item_List>[];
var product_price=0;
List<bool> show_delete= <bool>[];
var ceckout_amount=0;

class My_App extends StatelessWidget {
  const My_App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Place order'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Items_in_Cart();
  }
  void Items_in_Cart()
  {
    var list= <Item_List>[
      Item_List(1,'Mango',30,'assets/image/mango.png'),
      Item_List(2,'Bananas',20,'assets/image/bananas.png'),
      Item_List(3,'Orange',50,'assets/image/orange.png'),
      Item_List(4,'Alpanzo',30,'assets/image/mango.png'),
      Item_List(5,'Chiniya bananas',30,'assets/image/bananas.png'),
      Item_List(6,'Lemon',30,'assets/image/orange.png'),
      Item_List(7,'Classic Mango',30,'assets/image/mango.png')];
    setState(() {
      item_list=list;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orangeAccent,
                Colors.orange,
                Colors.redAccent,
              ],
            ),
          ),
        ),
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Cart(_cartList),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }
  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: item_list.length,
        itemBuilder: (context, index) {
          var item = item_list[index];
          return Card(
              elevation:10,
            //  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              shadowColor: Colors.black,
              color: Colors.white,
              child: Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     Container(
                       margin: EdgeInsets.symmetric(horizontal: 15),
                       padding: EdgeInsets.only(bottom: 5),
                       child:  Image.asset(
                         item.Image,
                       ),
                     ),
                      Text(
                        item.Name,
                        textAlign: TextAlign.center,

                        style: GoogleFonts.abrilFatface(
                          textStyle: TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 15),
                        ),
                      ),



                      Text('Price :-  ₹ '+
                        item.Cost.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.pink
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        )
                            : Text('Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.purple,
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item)) {
                              _cartList.add(item);
                              total_cartitem.add(item);

                              show_delete.add(true);
                            } else {
                              // _cartList.remove(item);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
class Cart extends StatefulWidget {
    final List<Item_List> _cart;
    Cart(this._cart);
    @override
    _CartState createState() => _CartState(this._cart);
  }
class _CartState extends State<Cart> {
  _CartState(this._cart);
  List<Item_List> _cart;
  @override
  void initState() {
    for (var p in _cartList) {
      product_price = product_price +p.Cost;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
        centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orangeAccent,
              Colors.orange,
              Colors.redAccent,
            ],
          ),
        ),
      ),
      title: Text('My Cart'),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 8.0),
          child: GestureDetector(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  size: 36.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    child: Text(
                      total_cartitem.length.toString() ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],

  ),

  body:Column(

    children: [
      Expanded(
        child: ListView.builder(
    shrinkWrap: true,
    itemCount: _cartList.length,
    itemBuilder: (context, index) {
      var item = _cartList[index];
      return
         Card(
             elevation: 10,
             margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
             shadowColor: Colors.orangeAccent,
             color: Colors.white,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 10),
               child: Row(
                 children: [
                   Padding(padding: EdgeInsets.only(right: 10),
                     child: Image.asset(item.Image,
                       width: 80,
                       height: 80,
                     ),
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(item.Name,
                         style: TextStyle(color: Colors.indigo, fontSize: 15,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Text('Price :- '+item.Cost.toString(),
                         style: TextStyle(color: Colors.black54, fontSize: 12,
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                     ],
                   ),
                   Row( mainAxisSize: MainAxisSize.min,
                     children: <Widget>[
                       IconButton(
                         icon: Icon(Icons.remove),
                         onPressed: () {
                           setState(() {
                             if(_cartList[index].counter==1)
                             {
                               _cartList[index].counter=0;
                               product_price = product_price -item.Cost;
                               show_delete[index]=false;
                               total_cartitem.remove(item);
                             }
                             else {
                               if(_cartList[index].counter>1)
                             {
                               _cartList[index].counter--;
                               product_price = product_price -item.Cost;
                               total_cartitem.remove(item);
                             }
                             }

                           });
                         },
                         color: Colors.green,
                       ),

                       Text(_cartList[index].counter.toString()),
                       IconButton(
                         icon: Icon(Icons.add),
                         color: Colors.green,
                         onPressed: () {
                           setState(() {
                             _cartList[index].counter++;
                             product_price = product_price +item.Cost;
                             total_cartitem.add(item);
                             show_delete[index]=true;
                           });
                         },
                       ),
                     ],
                   ),
                   Visibility(
             visible: show_delete[index]? false: true,
              child:     Padding(padding: EdgeInsets.only(left: 10),
                   child: IconButton(
                     color: Colors.red,
                     icon: Icon(Icons.delete),
                     onPressed: (){
                       setState(() {
                         _cartList.remove(item);
                         show_delete[index]=true;
                       });
                     },
                   ),
              ),
           ),
                 ],
               ),
             )
         );
      },
        ),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child:  Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub-Total',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),),
            Text(product_price.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),)
          ],
        ),
      ),

      GestureDetector(
        onTap: () {
          ceckout_amount=product_price;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Payment_screen()),
          );
        },
       child: Container(
          margin: EdgeInsets.only(top: 10),
          width: double.maxFinite,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orangeAccent,
                Colors.orange,
                Colors.redAccent,
                Colors.orange,
                Colors.orangeAccent,
              ],
            ),
          ),

          child: Text('Proceed to Pay',textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),

          ),
        ),
      ),
    ],
  ),
  );
  }
  }

  class Payment_screen extends StatefulWidget
  {
    const Payment_screen({super.key});
    @override
    State createState()=> Cart_Payment();
  }

  class Cart_Payment extends State <Payment_screen> {
    late Razorpay _razorpay;

    @override
    void initState() {
      super.initState();
      _razorpay = Razorpay();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    }

    @override
    void dispose() {
      super.dispose();
      _razorpay.clear();
    }

    void openCheckout() async {
      var options = {
        'key': 'rzp_test_fmoMNXDAuGlEMd',
        "amount": ceckout_amount*100, // Convert Paisa to Rupees
        'currency': "INR",
        'name': 'Astuti Singh Rajput',
        'description': 'Payment',
        'prefill': {'contact': '7857915199',    'email': 'astuti23121997@gmail.com'},
        'external': {
          'wallets': ['paytm']
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    void _handlePaymentSuccess(PaymentSuccessResponse response) {
      Fluttertoast.showToast(
          msg: "SUCCESS: ${response.paymentId}");
    }
    void _handlePaymentError(PaymentFailureResponse response) {
      Fluttertoast.showToast(
          msg: "ERROR: " + response.code.toString() + " - " + "${response.message}");
    }
    void _handleExternalWallet(ExternalWalletResponse response) {
      Fluttertoast.showToast(
          msg: "EXTERNAL_WALLET: " + "${response.walletName}");
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orangeAccent,
                Colors.orange,
                Colors.redAccent,
              ],
            ),
          ),
        ),

        title:const Text('Payment Screen'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [

          Container(

          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: const Text('Proceed to pay',
                    style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: (){openCheckout();}
              ),
            ],
          )




        ],

      ),
    );

  }
      }











