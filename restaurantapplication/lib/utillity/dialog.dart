import 'package:flutter/material.dart';
import 'package:restaurantapplication/utillity/my_style.dart';

Future<Null> normalDialog(BuildContext context, String string)async{
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: Image.asset('assets/images/logo.png'),
          title: Text('Sorry !',
            style: MyStyle().redBoldStyle(),
          ),
          subtitle: Text(string),
        ),
        children: [TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK')
        )
        ],
      )
  );
}
