import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/home/category.dart';
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
                    name: 'Comidas',
                    url:
                        'https://www.istoedinheiro.com.br/wp-content/uploads/sites/17/2019/08/din1135-sustenta5.jpg'),
                Category(
                    name: 'Lanches',
                    url:
                        'https://img.freepik.com/fotos-premium/classico-cheeseburger-com-carne-de-queijo-bacon-tomate-cebola-e-alface-isolado-no-fundo-branco_183587-963.jpg'),
                Category(
                    name: 'Pizza',
                    url: 'https://www.pngmart.com/files/1/Pepperoni-Pizza.png'),
              ],
            ),
            PromocoesView(
              promotionList: [
                Promotion(
                    name: 'Promo 1',
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSykY9ZDB3QYHKVYoc5q7yXsFKlT7vtYrs-Mg&usqp=CAU'),
                Promotion(
                    name: 'Promo 2',
                    url:
                        'https://static-images.ifood.com.br/image/upload/t_medium/pratos/a3e32426-7659-484b-9309-bf3249bcaf62/202106301645_1VSY_i.jpg'),
                Promotion(
                    name: 'Promo 3',
                    url:
                        'https://blog.consumer.com.br/wp-content/uploads/2020/02/ifood-loop.jpg'),
                Promotion(
                    name: 'Promo 4',
                    url:
                        'https://i1.wp.com/surgiu.com.br/wp-content/uploads/2018/08/Mc-iFood-mcdiafeliz180824_121012.jpg?resize=1280%2C720'),
                Promotion(
                    name: 'Promo 5',
                    url:
                        'https://gkpb.com.br/wp-content/uploads/2019/08/cropped-ifood-oferecera-pratos-de-R-1-para-novos-usuarios-geek-publicitario.jpg.png'),
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
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index2) => Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
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
                      categoryList[index2].name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 71, 75, 80),
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
            height: 150,
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
                      width: 150,
                      child: Image.network(
                        promotionList[index].url,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: const Text(
                              'Whoops!',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      promotionList[index].name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 71, 75, 80),
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
