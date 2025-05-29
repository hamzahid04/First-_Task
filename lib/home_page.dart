import 'package:firsttask/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {

  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  void _Increment(){
    setState(() {
      count++;
    });
  }
  void _Decrement(){
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
      body: _body(),
    );
  }

  Column _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('$count',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButtons(btnName: 'Increment',
                onPressed: _Increment),
            SizedBox(width: 10),
            MyButtons(btnName: 'Decrement',
                onPressed: _Decrement)
          ],
        )
      ],
    );
  }

  Drawer _drawer() {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(Icons.favorite,
                color: Colors.white,)
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HOME'),
          )
        ],
      )
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('First Task',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (context) {
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },
              icon: Icon(Icons.menu));
        }
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: (){
              SystemNavigator.pop();
            },
            child: Icon(Icons.exit_to_app,
              color: Colors.black,),
          ),
        )
      ],
    );
  }
}
