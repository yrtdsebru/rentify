import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class AddingProductView extends StatelessWidget {
  const AddingProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Add Product');

  }
}