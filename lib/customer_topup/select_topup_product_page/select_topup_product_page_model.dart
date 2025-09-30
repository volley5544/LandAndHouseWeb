import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_topup_product_page_widget.dart'
    show SelectTopupProductPageWidget;
import 'package:flutter/material.dart';

class SelectTopupProductPageModel
    extends FlutterFlowModel<SelectTopupProductPageWidget> {
  ///  Local state fields for this page.

  int? checkBoxSelected = 999;

  List<String> tempListPageState = ['1', '2', '3', '4', '5', '6', '7'];
  void addToTempListPageState(String item) => tempListPageState.add(item);
  void removeFromTempListPageState(String item) =>
      tempListPageState.remove(item);
  void removeAtIndexFromTempListPageState(int index) =>
      tempListPageState.removeAt(index);
  void insertAtIndexInTempListPageState(int index, String item) =>
      tempListPageState.insert(index, item);
  void updateTempListPageStateAtIndex(int index, Function(String) updateFn) =>
      tempListPageState[index] = updateFn(tempListPageState[index]);

  List<ProductsStruct> productData = [];
  void addToProductData(ProductsStruct item) => productData.add(item);
  void removeFromProductData(ProductsStruct item) => productData.remove(item);
  void removeAtIndexFromProductData(int index) => productData.removeAt(index);
  void insertAtIndexInProductData(int index, ProductsStruct item) =>
      productData.insert(index, item);
  void updateProductDataAtIndex(int index, Function(ProductsStruct) updateFn) =>
      productData[index] = updateFn(productData[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
