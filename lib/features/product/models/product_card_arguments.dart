import 'package:team1_khayat/features/product/models/accessory_product_model.dart';
import 'package:team1_khayat/features/product/models/fabric_product_model.dart';

class ProductCardArgument
{
  final bool isFabric;
  final FabricProductModel? fabricProductModel;
  final AccessoryProductModel? accessoryProductModel;

  ProductCardArgument({required this.isFabric,  this.fabricProductModel,  this.accessoryProductModel});

}