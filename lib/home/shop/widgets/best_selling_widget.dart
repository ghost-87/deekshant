import 'package:flutter/material.dart';
import 'package:deekshant_app/model/product_model.dart';
import 'package:deekshant_app/values/assets.dart';
import 'package:deekshant_app/values/base_colors.dart';
import 'package:deekshant_app/widgets/product_grid_item.dart';

class BestSellingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Best Selling',
                  style: const TextStyle(
                    color: BaseColors.gray1,
                    fontSize: 24,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: const TextStyle(
                    color: BaseColors.accentColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        BestSellingProductWidget(),
      ],
    );
  }
}

class BestSellingProductWidget extends StatefulWidget {
  @override
  _BestSellingProductWidgetState createState() =>
      _BestSellingProductWidgetState();
}

class _BestSellingProductWidgetState extends State<BestSellingProductWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Axis animationDirection;

  List<ProductModel> _products = [
    ProductModel(JPGs.storeImg1, 'Big Bazar', 'Super Mall, Snack', '4.2'),
    ProductModel(JPGs.storeImg2, 'R Mall', 'Beverages', '3.9'),
    ProductModel(JPGs.storeImg3, 'Ravi Fruits Shop', 'Fruits', '4.3'),
    ProductModel(JPGs.storeImg4, 'Kavya Vegetables', 'Vegetables', '3.9'),
    ProductModel(JPGs.storeImg5, 'Vijay Juices', 'Juices & Salad', '4.1'),
    ProductModel(JPGs.storeImg6, 'Ram Grocery', 'Grocery', '3.8'),
    ProductModel(JPGs.storeImg7, 'Fresh Fruits', 'Fruits & Vegetables', '4.1'),
    ProductModel(JPGs.storeImg8, 'Herbs', 'Herbs', '3.1'),
    ProductModel(JPGs.storeImg9, 'Snack Time Shop', 'Snacks & Drinks', '4.6'),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.6,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _products.length,
        padding: const EdgeInsets.symmetric(horizontal: 16) +
            EdgeInsets.only(bottom: 178),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (_, index) {
          _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval(
                (0.5 / _products.length) * index,
                1,
                curve: Curves.easeOut,
              ),
            ),
          );
          _animationController.forward();
          return AnimatedBuilder(
            animation: _animationController,
            builder: (_, child) {
              return FadeTransition(
                opacity: _animation,
                child: Transform(
                  transform: animationDirection == Axis.horizontal
                      ? Matrix4.translationValues(
                          50 * (1.0 - _animation.value),
                          0.0,
                          0.0,
                        )
                      : Matrix4.translationValues(
                          0.0,
                          50 * (1.0 - _animation.value),
                          0.0,
                        ),
                  child: child,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: BaseColors.gray),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      child: Container(
                        child: Icon(Icons.bookmark, color: Colors.blue),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          _products[index].productImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            _products[index].productName,
                            style: const TextStyle(
                              color: BaseColors.gray1,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            _products[index].quantity,
                            style: const TextStyle(
                              color: BaseColors.darkGray,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue),
                          Text(
                            _products[index].amount + '/5',
                            style: const TextStyle(
                              color: BaseColors.gray1,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Material(
        color: BaseColors.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              color: BaseColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
