import 'package:flutter/material.dart';
import 'package:restaurantapplication/widget/authen.dart';
import 'package:restaurantapplication/widget/register.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen':(BuildContext context)=> Authen(),
  '/register':(BuildContext context) => Register(),
};
