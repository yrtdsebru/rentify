import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';


@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Home');

  }
}