import 'package:flutter/material.dart';
import 'package:my_app/features/home/promotion.dart';

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
