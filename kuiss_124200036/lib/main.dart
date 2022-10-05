import 'package:flutter/material.dart';
import 'package:kuiss_124200036/data.dart';
import 'package:kuiss_124200036/listDetail.dart';

void main() {
  runApp(const MaterialApp(
    home: Menu(),
  ));
}

class Menu extends StatefulWidget {
  // final Menu name;
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}
// @override
// _HomeState createState() => _HomeState();

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('List Belanja'),
        centerTitle: true,
        backgroundColor: Color(0xfff9A825),
      ),
      // body: Builder(
      //    builder: (context) {
      //    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(itemBuilder:(context, index){
            final Groceries name = groceryList[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Listdetail (name : name);
                }));
              },
              child: Container(
                height: (MediaQuery.of(context).size.height)/5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.network(name.productImageUrls,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: Colors.black45,
                         colorBlendMode: BlendMode.darken,),
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textAlignLeftWhite(name.name),
                          textAlignLeftWhite(name.price)]),
                  ],
                ),
              ),
            );
          },
            itemCount: groceryList.length,
          ),
        ),
      ),
    );
    //     },
    //
    //   ),
    // );
  }
}


Widget textAlignLeftWhite(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
      color: Colors.black,
      fontSize: 30,
    ),
  );
}




