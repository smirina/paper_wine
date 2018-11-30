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
  Set<String> _userTags = Set();
  List<String> _basicTags = [
    'белое',
    'полусухое',
    'красное',
    'сухое',
    'Пятерочка',
    'Vinissimo',
    'Ароматный Мир',
    'к морепродуктам',
    'к пасте'
  ];

  List<Map<String, dynamic>> _filteredProducts = [];
  List<Map<String, dynamic>> _products = [
    {
      'title': 'Prosecco Decordi Brut',
      'description': 'Decordi Brut – сбалансированное просекко для вечеринки',
      'image': 'assets/prosecco.png',
      'tags': [
        'игристое',
        'Vinissimo',
        'Ароматный Мир',
        'ваниль',
        'к легким закускам'
      ]
    },
    {
      'title': 'Urban Riesling 2016',
      'description': 'Немецкий Urban Riesling 2016 года',
      'image': 'assets/urban_riesling.png',
      'tags': ['белое', 'полусухое', 'рислинг', 'Ашан', 'азиатская кухня']
    },
    {
      'title': 'Promesa Carmenere Reserva 2014',
      'description':
          'Promesa Carmenere Reserva 2014, чилийское красное из «Пятерочки»!',
      'image': 'assets/promesa.png',
      'tags': ['красное', 'сухое', 'к мясу', 'Ашан', 'Пятерочка']
    },
    {
      'title': 'Губернаторское голубок 2016',
      'description':
          'Русское вино от винодельни «Ведерников»: недостаточно хорошее для своей цены 😕',
      'image': 'assets/vedernikov.png',
      'tags': ['красное', 'сухое', 'Карусель']
    },
    {
      'title': 'Douglas Green 2016',
      'description':
          'Douglas Green 2016 из ЮАР, небанальное белое для спокойного вечера',
      'image': 'assets/douglas.png',
      'tags': [
        'белое',
        'сухое',
        'Ароматный Мир',
        'к морепродуктам',
        'к суши',
        'к пасте'
      ]
    },
    {
      'title': 'Azumbre verdejo',
      'description':
          'Azumbre verdejo 2016: интересное белое, прославившееся на всю Испанию и за её пределами',
      'image': 'assets/azumbre.png',
      'tags': [
        'белое', 'сухое', 'Vinissimo', 'к морепродуктам'
      ]
    },
    {
      'title': 'Hardy’s Legacy Red',
      'description':
          'Hardy’s Legacy Red: красное из Австралии с ароматом спелых ягод',
      'image': 'assets/hardy.png',
      'tags': [
        'красное', 'сухое', 'РосАл', 'Окей', 'Призма', 'к пасте', 'к доставке', 'к шашлыкам'
      ]
    },
  ];

  void initState() {
    super.initState();
    _filteredProducts = _products;
  }

  void _filterProducts() {
    setState(() {
      _filteredProducts = _products
          .where((i) => i['tags'].toSet().containsAll(_userTags))
          .toList();
    });
  }

  void _toggleFilter(element) {
    setState(() {
      if (_userTags.contains(element)) {
        _userTags.remove(element);
      } else {
        _userTags.add(element);
      }
    });
    print(_userTags);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            accentColor: Colors.redAccent),
        home: Scaffold(
            appBar: AppBar(
              title: Text('EasyList'),
            ),
            body: ListView(
              children: [
                Wrap(
                    children: _basicTags
                        .map(
                          (element) => RaisedButton(
                            
                                onPressed: () {
                                  _toggleFilter(element);
                                  _filterProducts();
                                },
                                child: Text(element),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: _userTags.contains(element) ? Colors.amber : Colors.red,
                                splashColor: Colors.redAccent,
                                textColor: Colors.white,
                              ),
                        )
                        .toList()),
                Column(
                    children: _filteredProducts
                        .map(
                          (element) => Card(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(element['image']),
                                    Container(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          element['description'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey,
                                            fontSize: 20.0,
                                          ),
                                          softWrap: true,
                                          
                                        )),
                                  ],
                                ),
                              ),
                        )
                        .toList()),
              ],
            )));
  }
}
