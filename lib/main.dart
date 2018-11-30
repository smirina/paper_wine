import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/products.dart';
import './pages/product.dart';

//void main() => runApp(MyApp());

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [
              {
                'title': 'Prosecco Decordi Brut',
                'description': 'Decordi Brut – сбалансированное просекко для вечеринки',
                'image': 'assets/prosecco.png',
                'tags': ['игристое', 'Vinissimo', 'Ароматный Мир', 'ваниль', 'к легким закускам']
              },
              {
                'title': 'Urban Riesling 2016',
                'description': 'Немецкий Urban Riesling 2016 года',
                'image': 'assets/urban_riesling.png',
                'tags': ['белое', 'полусухое', 'рислинг', 'Ашан', 'азиатская кухня']
              },
              {
                'title': 'Promesa Carmenere Reserva 2014',
                'description': 'Promesa Carmenere Reserva 2014, чилийское красное из «Пятерочки»!',
                'image': 'assets/promesa.png',
                'tags': ['крвсное', 'сухое', 'к мясу', 'Ашан', 'Пятерочка']
              },
              {
                'title': 'Губернаторское голубок 2016',
                'description': 'Русское вино от винодельни «Ведерников»: недостаточно хорошее для своей цены 😕',
                'image': 'assets/vedernikov.png',
                'tags': ['красное', 'сухое', 'Карусель']
              },
              {
                'title': 'Douglas Green 2016',
                'description': 'Douglas Green 2016 из ЮАР, небанальное белое для спокойного вечера',
                'image': 'assets/douglas.png',
                'tags': ['белое', 'сухое', 'Ароматный Мир', 'к морепродуктам', 'к суши', 'к пасте']
              },
              ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image'], _products[index]['description']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products),
        );
      },
    );
  }
}
