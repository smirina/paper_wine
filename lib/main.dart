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
    'красное',
    'игристое',
    'Пятерочка',
    'Ароматный Мир',
    'Карусель',
    'Лента',
    'к морепродуктам',
    'к пасте',
    'к мясу',
    'к суши',
    'к шашлыкам',
    'к легким закускам',
    'к доставке',
    'азиатская кухня',
    'итальянская кухня',
  ];

  List<Map<String, dynamic>> _filteredProducts = [];
  List<Map<String, dynamic>> _products = [
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

    {
      'title': 'La Linda 2016',
      'description':
          'К субботнему стейку: базовый аргентинский мальбек La Linda 2016 от уважаемого хозяйства Luigi Bosca',
      'image': 'assets/linda.jpg',
      'tags': [
        'красное', 'терпкое', 'Simple Wine ', 'Карусель', 'Ароматный Мир', 'к мясу'
      ]
    },
    {
      'title': 'Hagn Gruner Veltliner ',
      'description':
          'Легкое белое из Австрии, которое пахнет лимонной шкуркой',
      'image': 'assets/hagn.jpg',
      'tags': [
        'белое', 'сухое', 'Пятерочка', 'к морепродуктам'
      ]
    },
    
    //март
    {
      'title': 'Diemersfontein Coffee Pinotage ',
      'description':
          'Пинотаж с кофейным ароматом',
      'image': 'assets/pinotage.jpg',
      'tags': [
        'пинотаж', 'Vinissimo', 'к мясу', 'к рыбе', 'к шоколаду'
      ]
    },
    {
      'title': 'Le Grand Noir ',
      'description':
          'Нетипичное французское шардоне Le Grand Noir 2016',
      'image': 'assets/grandnoir.jpg',
      'tags': [
        'белое', 'сухое', 'Норман', 'Напитки Мира', 'Призма', 'Карусель', 'к пасте', 'к курице'
      ]
    },
    {
      'title': 'Jaume Serra Brut',
      'description':
          'Кава Jaume Serra Brut',
      'image': 'assets/jaume.jpg',
      'tags': [
        'игристое', 'сухое', 'Ароматный Мир', 'Призма', 'к морепродуктам', 'к копченому'
      ]
    },
    {
      'title': 'Segredos de Sao Miguel',
      'description':
          'Португальское красное Segredos de Sao Miguel 2016 с холодным ароматом то ли мяты, то ли эвкалипта',
      'image': 'assets/segredos.jpg',
      'tags': [
        'красное', 'сухое', 'Ароматный Мир', 'к сырам'
      ]
    },
    {
      'title': 'Seraph Touraine Sauvignon',
      'description':
          'Серьезный французский совиньон из долины Луары, который можно найти в магазинчике на «Чкаловской» (или в Prisma)',
      'image': 'assets/seraph.jpg',
      'tags': [
        'белое', 'сухое', 'Joia', 'Призма', 'к морепродуктам', 'к суши'
      ]
    },

    //апрель
    {
      'title': 'Armentia y Madrazo Сrianza',
      'description':
          'Честное испанское красное из Риохи — Armentia y Madrazo Сrianza 2014',
      'image': 'assets/armentia.jpg',
      'tags': [
        'красное', 'сухое', 'Пятерочка', 'Карусель', 'к мясу', 'итальянская кухня'
      ]
    },
    {
      'title': 'Кокур Солнечной долины',
      'description':
          'Хорошее крымское вино из местного винограда кокур белый',
      'image': 'assets/kokur.jpg',
      'tags': [
        'белое', 'сухое', 'Лента', 'Окей', 'к морепродуктам', 'к суши', 'к пасте'
      ]
    },
    {
      'title': 'Appassimento Sergetto Rosso',
      'description':
          'Итальянское красное с бархатными танинами: Appassimento Sergetto Rosso 2015',
      'image': 'assets/rosso.jpg',
      'tags': [
        'красное', 'полусухое', 'Лента', 'Итальянская кухня'
      ]
    },
    {
      'title': 'Old Coach Road',
      'description':
          'Old Coach Road 2017 — доступный и ароматный образец новозеландского совиньон блана',
      'image': 'assets/coach.jpg',
      'tags': [
        'белое', 'сухое', 'Ароматный Мир', 'Vinissimo', 'Лента', 'к легким закускам', 'к морепродуктам', 'азиатская кухня'
      ]
    },

    //май
    {
      'title': 'Montes Reserva Merlot ',
      'description':
          'Какое вино взять на природу и чем вкусно запивать шашлык?',
      'image': 'assets/montes.jpg',
      'tags': [
        'красное', 'сухое', 'РосАл', 'к шашлыкам'
      ]
    },
    {
      'title': 'Casa Bataneros Garnacha Rosé ',
      'description':
          'Розовое вино! Повторяем! Розовое вино!',
      'image': 'assets/bataneros.jpg',
      'tags': [
        'розовое', 'полусухое', 'Карусель', 'Ароматный Мир', 'Призма', 'Перекресток', 'к суши'
      ]
    },
    {
      'title': 'Puklavec & friends. Sauvignon Blanc & Pinot Grigio',
      'description':
          'Приятное белое из неожиданного региона – Словении',
      'image': 'assets/puklavec.jpg',
      'tags': [
        'белое', 'сухое', 'ДеКанто', 'к курице', 'к легким закускам', 'к морепродукам'
      ]
    },
    {
      'title': 'Dr. Willkomm Riesling Feinherb',
      'description':
          'Идеальный немецкий рислинг из «Пятерочки» по соотношению цены и качества!',
      'image': 'assets/riesling.jpg',
      'tags': [
        'белое', 'полусухое', 'Пятерочка', 'к салатам', 'азиатская кухня'
      ]
    },

   //июнь
    {
      'title': 'La Gioiosa Prosecco di Treviso',
      'description':
          'Разбираемся, что такое просекко, на примере La Gioiosa',
      'image': 'assets/gioiosa.jpg',
      'tags': [
        'игристое', 'сухое', 'Карусель', 'Окей', 'к морепродуктам'
      ]
    },
    {
      'title': 'San Valentin Garnacha',
      'description':
          'Легкое летнее красное San Valentin Garnacha 2016 — и несколько слов о гарначе',
      'image': 'assets/valentin.jpg',
      'tags': [
        'красное', 'сухое', 'Лента', 'Окей', 'Призма', 'Карусель', 'Домашняя кухня'
      ]
    },
    {
      'title': 'Bonavita Branco ',
      'description':
          'Приятнейшее португальское белое Bonavita Branco 2017',
      'image': 'assets/bonavita.jpg',
      'tags': [
        'белое', 'полусухое', 'Joia', 'Призма', 'к легким закускам', 'к сырам'
      ]
    },
    {
      'title': 'S-Naia Sauvignon Blanc',
      'description':
          'Сегодня — S-Naia из Руэды',
      'image': 'assets/naia.jpg',
      'tags': [
        'белое', 'сухое', 'Ароматный Мир', 'к курице', 'к морепродуктам', 'к суши'
      ]
    },
    {
      'title': 'Martini Rosso',
      'description':
          'Вермут — это не стыдно',
      'image': 'assets/martini.jpg',
      'tags': [
        'красное', 'Лента', 'Окей', 'Призма', 'Карусель','РосАл', 'Окей', 'Призма'
      ]
    },

    //июль
    {
      'title': 'Trapiche Torrontes',
      'description':
          'Пробуем аргентинский торронтес — бодрое сухое белое Trapiche Torrontes 2017',
      'image': 'assets/trapiche.jpg',
      'tags': [
        'белое', 'сухое', 'Лента', 'к курице', 'азиатская кухня'
      ]
    },
    {
      'title': 'Artwine Rkatsiteli Qvevri',
      'description':
          'Самое доступное оранжевое вино',
      'image': 'assets/rkatsiteli.jpg',
      'tags': [
        'оранжевое', 'Vinissimo', 'Грузинская кухня'
      ]
    },
    {
      'title': 'Nastl Klassik Zweigelt-Merlot ',
      'description':
          'Австрийское легкое красное',
      'image': 'assets/nastl.jpg',
      'tags': [
        'красное', 'сухое', 'Ашан', 'к пасте', 'к доставке',
      ]
    },
    // {
    //   'title': 'test',
    //   'description':
    //       'Российское игристое для небывалой петербургской жары',
    //   'image': 'assets/wine.jpg',
    //   'tags': [
    //     'красное', 'сухое', 'РосАл', 'Окей', 'Призма', 'к пасте', 'к доставке', 'к шашлыкам'
    //   ]
    // },

    // //август
    // {
    //   'title': 'test',
    //   'description':
    //       'test',
    //   'image': 'assets/wine.jpg',
    //   'tags': [
    //     'красное', 'сухое', 'РосАл', 'Окей', 'Призма', 'к пасте', 'к доставке', 'к шашлыкам'
    //   ]
    // },
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
              title: Text('Paper wine'),
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
