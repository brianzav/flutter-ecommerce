import 'package:flutter/material.dart';
import 'package:my_app/features/home/repository/promotion.dart';

class PromocoesView extends StatelessWidget {
  const PromocoesView({
    super.key,
    required this.promotionList,
  });
  final List<Promotion> promotionList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(
            left: 24,
          ),
          child: ColoredBox(
            color: Colors.amber,
            child: Text(
              'Promoções',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: promotionList.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 24 : 0,
                right: index == promotionList.length - 1 ? 24 : 0,
              ),
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      promotionList[index].url,
                      height: 140,
                      width: 200,
                      fit: BoxFit.cover,
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
                    const SizedBox(height: 16),
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
        ),
      ],
    );
  }
}
