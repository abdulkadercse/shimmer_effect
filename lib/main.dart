import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shimmer Effect',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool enable = true;

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }
  loadData()async{
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      enable=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Effect"),centerTitle: true,
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
              if(enable){
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                    title: Container(
                      height: 10,

                      color: Colors.white,
                    ),
                    subtitle: Container(
                      height: 10,

                      color: Colors.white,
                    ),
                  ),
                );
              }else{
                return const ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("Abdul kader"),
                  subtitle:  Text("Flutter Developer"),
                );
              }
            }),
          ),

        ],
      ),
    );
  }
}
