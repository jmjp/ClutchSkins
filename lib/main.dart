import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/pages/loginPage.dart';
import 'src/pages/dashPage.dart';



bool _isAuthenticated = false;

void main() async {
  _isAuthenticated = await check();
  runApp(MyApp());
  
}
Future<bool> check() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  if(token != null){
     return true;
  }else{
    return false;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(builder: (_) {
              return _isAuthenticated ? DashPage() :LoginPage();
            });
      },
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

