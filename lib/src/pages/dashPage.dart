import 'dart:ui';

import 'package:clutchskins/src/models/account.dart';
import 'package:clutchskins/src/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/api.dart';

//paginas
import 'indexPage.dart';

class DashPage extends StatefulWidget {
  _DashPage createState() => _DashPage();
}

class _DashPage extends State<DashPage> {
  @override
  void initState() {
    renewToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
              title: Text("Clutch Skins"),
              centerTitle: true,
              bottom: PreferredSize(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.deepOrange, Colors.deepPurple])),
                    height: 4,
                  ),
                  preferredSize: Size.fromHeight(2))),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: new AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover)),
            child: TabBarView(children: [
              //pages
              IndexPage(),
              Text('page2'),
              Text('page3'),
              Text('page4'),
            ]),
          ),
          bottomNavigationBar: Container(
            child: TabBar(tabs: [
              Tab(icon: Icon(FontAwesome.home)),
              Tab(icon: Icon(FontAwesome.home)),
              Tab(icon: Icon(FontAwesome.home)),
              Tab(icon: Icon(FontAwesome.home)),
            ]),
          ),
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
            child: Drawer(
              child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: new BoxDecoration(
                          color: Colors.grey.shade700.withOpacity(0.5),
                          
                        ),
                        child: Column(
                          children: <Widget>[
                            DrawerHeader(

                              child: FutureBuilder<Account>(
                                future: getAccount(),
                                builder: (context,snapshot){
                                  if(snapshot.hasData){
                                    return new Column(
                                      children: <Widget>[
                                        Text("Bem vindo, "+snapshot.data.username.toUpperCase()),
                                        ListTile(
                                              leading: Icon(Icons.attach_money,size: 35.0),
                                              title: Text("Points:"),
                                              subtitle: Text(snapshot.data.points.toString()),
                                        ),
                                        Text("Criado em "+snapshot.data.createdAt.toString()),
                                      ],
                                    );
                                  }else if(snapshot.hasError){
                                    return Text('Logue-se novamente');
                                  }
                                  return Center(child: CircularProgressIndicator());
                                },
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.account_circle),
                              title: Text('Perfil'),
                              onTap: () {
                                return Fluttertoast.showToast(msg:'Profile');
                              }
                            ),
                            ListTile(
                              leading: Icon(Icons.account_balance_wallet),
                              title: Text('Adicionar saldo'),
                              onTap: () {
                                return Fluttertoast.showToast(msg:'Money');
                              }
                            ),
                            ListTile(
                              leading: Icon(FontAwesome.key),
                              title: Text('Logout'),
                              onTap: () {
                                logout();
                                Navigator.pushReplacement(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginPage()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            )
              ),
            ),
          
    );
  }
}
