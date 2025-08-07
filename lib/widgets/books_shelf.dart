import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';

import 'cards/cards.dart';

class BooksShelf extends StatelessWidget {
  const BooksShelf({
    super.key,
    required this.potions1,
    required this.potions2,
    required this.types,
  });

  final List<PotionType> types;
  final List<Potion> potions1;
  final List<Potion> potions2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 224.r,
      height: 317.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/png/shadow2.png',
              width: 223.r,
              height: 36.r,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 4.r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/png/shelf.png',
                  width: 205.r,
                  height: 313.r,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 25.r,
                  left: 30.r,
                  child: Column(
                    children: [
                      _buildTitle(types.first),
                      SizedBox(height: 5.r),
                      SizedBox(
                        height: 215.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(potions1.length, (index) {
                            final potion = potions1[index];
                            return RecipeBookCard(
                              name: potion.name,
                              asset: potion.bookAsset,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 25.r,
                  right: 30.r,
                  child: Column(
                    children: [
                      _buildTitle(types.last),
                      SizedBox(height: 5.r),
                      SizedBox(
                        height: 215.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(potions2.length, (index) {
                            final potion = potions2[index];
                            return RecipeBookCard(
                              name: potion.name,
                              asset: potion.bookAsset,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(PotionType type) {
    if (type == PotionType.normal) {
      return Image.asset(
        'assets/png/normal.png',
        width: 47.r,
        height: 23.r,
        fit: BoxFit.fill,
      );
    } else if (type == PotionType.common) {
      return Image.asset(
        'assets/png/common.png',
        width: 47.r,
        height: 23.r,
        fit: BoxFit.fill,
      );
    } else if (type == PotionType.rare) {
      return Image.asset(
        'assets/png/rare.png',
        width: 47.r,
        height: 23.r,
        fit: BoxFit.fill,
      );
    }

    return Image.asset(
      'assets/png/very_rare.png',
      width: 47.r,
      height: 23.r,
      fit: BoxFit.fill,
    );
  }
}
