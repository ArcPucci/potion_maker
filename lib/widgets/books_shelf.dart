import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cards/cards.dart';

class BooksShelf extends StatelessWidget {
  const BooksShelf({super.key});

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
                  left: 38.r,
                  child: Image.asset(
                    'assets/png/normal.png',
                    width: 47.r,
                    height: 23.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 25.r,
                  right: 34.r,
                  child: Image.asset(
                    'assets/png/common.png',
                    width: 47.r,
                    height: 23.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 55.r,
                  left: 32.r,
                  right: 28.r,
                  bottom: 50.r,
                  child: GridView.builder(
                    itemCount: 6,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 60.r,
                      mainAxisSpacing: 15.r,
                      crossAxisSpacing: 24.r,
                    ),
                    itemBuilder: (context, index) {
                      return RecipeBookCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
