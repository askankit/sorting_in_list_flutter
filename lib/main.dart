import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> firstList =["A","B","C","D","E","F","G","H"];
  List<String> secondList = [];

_addToSecondList(int index){
  secondList.add(firstList[index]);
  firstList.removeAt(index);
  for (int i = 1; i < secondList.length; i++) {
    String temp = secondList[i];
    int j = i - 1;
    while (j >= 0 && secondList[j].compareTo(temp) > 0) {
      secondList[j + 1] = secondList[j];
      j--;
    }

    secondList[j + 1] = temp;
  }

  setState(() {
  });

}

_addToFirstList(int index){
  firstList.add(secondList[index]);
  secondList.removeAt(index);
  for (int i = 1; i < firstList.length; i++) {
    String temp = firstList[i];
    int j = i - 1;
    while (j >= 0 && firstList[j].compareTo(temp) > 0) {
      firstList[j + 1] = firstList[j];
      j--;
    }

    firstList[j + 1] = temp;
  }
  setState(() {

  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           Expanded(
             child: ListView.builder(
               itemCount: firstList.length,
               itemBuilder: (BuildContext context, int index) {
                 return  ListTile(title: Text(firstList[index],
                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                   trailing: GestureDetector(
                     onTap: (){
                       _addToSecondList(index);
                     },
                       child: const Icon(Icons.remove_circle, color: Colors.red,)),);

             },),
           ),
            Expanded(
              child: ListView.builder(
               itemCount: secondList.length,
               itemBuilder: (BuildContext context, int index) {
                 return  ListTile(title: Text(secondList[index],
                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                 trailing: GestureDetector(
                   onTap: (){
                     _addToFirstList(index);
                   },
                     child: const Icon(Icons.remove_circle, color: Colors.red,)),);

           },),
            ),


          ],
        ),
      ),
    );
  }
}
