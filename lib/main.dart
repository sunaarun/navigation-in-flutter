import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' :(context)=>PageOne(),
        PageTwo.page: (context)=>PageTwo(),
      },
      //home: PageOne()
    );
  }
}
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Move with push only"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTwo()));
            },
          ),
          ElevatedButton(
            child: Text("Move with push Named "),
            onPressed: (){
               Navigator.pushNamed(context,PageTwo.page );
            },
          ),
          ElevatedButton(
            child: Text("Move with push Replacement"),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PageTwo()));

            },
          ),
          ElevatedButton(
            child: Text("Move with Navigator.of"),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PageTwo()));
            },
          )
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  static String page = "second";
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Center(
          child: TextButton(child: Text(" Page Two"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )
    );
  }
}
