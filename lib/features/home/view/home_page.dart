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
            const CategoriasView(),
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

class CategoriasView extends StatelessWidget {
  const CategoriasView({super.key});

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
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => const Card(
                child: Center(child: Text('Dummy Card Text')),
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

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((HomeCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
