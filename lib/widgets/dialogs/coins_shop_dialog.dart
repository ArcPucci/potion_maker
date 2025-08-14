import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/repositories/repositories.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../models/purch_class_total_cas.dart' show PurchClassTotalCas;
import '../../utils/utils.dart';

class CoinsShopDialog extends StatefulWidget {
  const CoinsShopDialog({super.key});

  @override
  State<CoinsShopDialog> createState() => _CoinsShopDialogState();
}

class _CoinsShopDialogState extends State<CoinsShopDialog> {
  int _index = 0;
  final value = Get.find<AppConfigController>();

  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final iapConnection = InAppPurchase.instance;
  late List<PurchClassTotalCas> products;

  Future<void> _onPurchaseUpdate(
    List<PurchaseDetails> purchaseDetailsList,
  ) async {
    for (var purchaseDetails in purchaseDetailsList) {
      await _handlePurchase(purchaseDetails);
    }
  }

  Future<void> _handlePurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.pendingCompletePurchase) {
      await iapConnection.completePurchase(purchaseDetails);
      buy();
      setState(() {});
    }
  }

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  Future<void> loadPurchases() async {
    const Set<String> coins = {
      'com.example.potionMaker_first_purchase',
      'com.example.potionMaker_second_purchase',
      'com.example.potionMaker_third_purchase',
      'com.example.potionMaker_fourth_purchase',
    };
    final response = await iapConnection.queryProductDetails(coins);
    for (var element in response.notFoundIDs) {
      debugPrint('Purchase $element not found');
    }
    products = response.productDetails
        .map((e) => PurchClassTotalCas(e))
        .toList();
  }

  Future<void> buyLuckyAppsPurch(PurchClassTotalCas product) async {
    try {
      final iapConnectionFortune = InAppPurchase.instance;
      final newIAPpurchaseParam = PurchaseParam(
        productDetails: product.productDetails,
      );
      await iapConnectionFortune.buyConsumable(
        purchaseParam: newIAPpurchaseParam,
      );
    } catch (e) {
      debugPrint("ERROR: $e");
    }
  }

  final controller = ScrollController();
  static final double _thumbHeight = 20.r;
  double _thumbPosition = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_updateThumbPosition);
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
    );
    loadPurchases();
  }

  void _updateThumbPosition() {
    double maxScrollExtent = controller.position.maxScrollExtent;
    double viewHeight = controller.position.viewportDimension - 10.r;

    if (maxScrollExtent > 0) {
      setState(() {
        _thumbPosition =
            (controller.offset / maxScrollExtent) * (viewHeight - _thumbHeight);
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_updateThumbPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SizedBox(
              width: 342.r,
              height: 338.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/png/letter_bg_3.png',
                          width: 290.r,
                          height: 313.r,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 76.r,
                          left: 58.r,
                          right: 60.r,
                          bottom: 65.r,
                          child: GridView.builder(
                            controller: controller,
                            itemCount: ShopRepo.coinsList.length,
                            physics: ClampingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 109.r,
                                  mainAxisSpacing: 14.r,
                                  crossAxisSpacing: 22.r,
                                ),
                            itemBuilder: (context, index) {
                              final coin = ShopRepo.coinsList[index];
                              return CoinCard(
                                coinsModel: coin,
                                onBuy: () {
                                  _index = index;
                                  buyLuckyAppsPurch(products[index]);
                                },
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 77.r + _thumbPosition,
                          right: 50.r,
                          child: Container(
                            width: 5.sp,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: Color(0xFF01C28B),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.r,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [Color(0xFF01C23B), Color(0xFF00571D)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(bounds);
                            },
                            child: Text(
                              "SHOP COIN",
                              style: AppTextStyles.ls36.copyWith(
                                fontSize: 36.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Image.asset(
                      'assets/png/close.png',
                      width: 43.r,
                      height: 43.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void buy() {
    value.addCoins(ShopRepo.coinsList[_index].quantity);
  }
}
