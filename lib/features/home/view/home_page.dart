import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/home/cubit/home_cubit.dart';
import 'package:my_app/features/home/repository/categories_list.dart';
import 'package:my_app/features/home/repository/promotion_list.dart';
import 'package:my_app/features/home/view/widgets/category_view.dart';
import 'package:my_app/features/home/view/widgets/gourmet_widget.dart';
import 'package:my_app/features/home/view/widgets/promocoes_view.dart';

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 253),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesView(
              categoryList: categoriesList,
            ),
            PromocoesView(promotionList: promotionList),
            const GourmetRestaurants()
          ],
        ),
      ),
    );
  }
}
