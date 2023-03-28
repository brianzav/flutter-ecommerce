import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/home/cubit/home_cubit.dart';
import 'package:my_app/features/home/promotion.dart';
import 'package:my_app/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            CategoriesView(
              categoryList: [
                Category(
                    nome: 'Comidas',
                    url:
                        'https://www.istoedinheiro.com.br/wp-content/uploads/sites/17/2019/08/din1135-sustenta5.jpg'),
              ],
            ),
            PromocoesView(
              promotionList: [
                Promotion(
                    name: 'Hamburguer',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSykY9ZDB3QYHKVYoc5q7yXsFKlT7vtYrs-Mg&usqp=CAU'),
                Promotion(
                    name: 'Pizza',
                    url:
                        'https://static-images.ifood.com.br/image/upload/t_medium/pratos/a3e32426-7659-484b-9309-bf3249bcaf62/202106301645_1VSY_i.jpg'),
                Promotion(
                    name: 'Lanches',
                    url:
                        'https://www.circuitodenoticias.com.br/up/img/1621351538864.jpeg'),
                Promotion(
                    name: 'Hamburguer',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSykY9ZDB3QYHKVYoc5q7yXsFKlT7vtYrs-Mg&usqp=CAU'),
                Promotion(
                    name: 'Hamburguer',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSykY9ZDB3QYHKVYoc5q7yXsFKlT7vtYrs-Mg&usqp=CAU'),
                Promotion(
                    name: 'Hamburguer',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSykY9ZDB3QYHKVYoc5q7yXsFKlT7vtYrs-Mg&usqp=CAU'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.categoryList,
  });

  final List<Category> categoryList;

  @override
  Widget build(BuildContext context) {
    var url;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Categorias',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index2) => Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        categoryList[index2].url,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: const Text(
                              'Whoops!',
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      categoryList[index2].name.toLowerCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PromocoesView extends StatelessWidget {
  const PromocoesView({
    super.key,
    required this.promotionList,
  });
  final List<Promotion> promotionList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Promoções',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: promotionList.length,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        promotionList[index].url,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: const Text(
                              'Whoops!',
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      promotionList[index].name.toLowerCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
