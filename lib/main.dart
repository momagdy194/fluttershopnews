import 'package:flutter/material.dart';
import 'package:shopnew/Api/product_api.dart';
import './product/product.dart';
//import 'api/products_api.dart';

void main (){
  runApp(GeneralShop());
}

class GeneralShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "General Shop",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ProductApi productsApi = ProductApi();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("General Shop"),
      ),
      body: FutureBuilder(
        future: productsApi.fetchProducts(1),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapShot){
          switch(snapShot.connectionState){

            case ConnectionState.none:
              return _error('nothing happend!!!');
              break;
            case ConnectionState.waiting:
              return _loding();
              break;
            case ConnectionState.active:
              return _loding();
              break;
            case ConnectionState.done:
              if(snapShot.hasError){
                return _error(snapShot.error);
              }else{
                if(! snapShot.hasData){
                  return _error('No data');
                }else{
                  return ListView.builder(itemBuilder:(BuildContext context, int position){
                    return _drawProduct(snapShot.data[position]);
                  },
                    itemCount: snapShot.data.length,
                  );
                }
              }
              break;
          }
          return Container();
        },
      ),
    );
  }

  _drawProduct(Product product){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(product.product_title.toString()),
      ),
    );
  }

  _error(String error){
    return Container(
      child: Center(
        child: Text(error),
      ),
    );
  }
  _loding(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}