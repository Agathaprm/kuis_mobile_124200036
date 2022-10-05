import 'package:flutter/material.dart';
import 'package:kuiss_124200036/data.dart';
import 'package:url_launcher/url_launcher.dart';

class Listdetail extends StatefulWidget {
  final Groceries name;
  const Listdetail({Key? key, required this.name}) : super(key: key);

  @override
  State<Listdetail> createState() => _DetailPageState();
}

class _DetailPageState extends State<Listdetail> {

//  @override
// String textList(List list) {
//   String text = '';
//   for (int i = 0; i < list.length; i++) {
//     if (i == 0) {
//       text = list[i];
//     } else {
//       text = text + ', ' + list[i];
//     }
//   }
//   return text;
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
          backgroundColor: Color(0xfff9A825),
        ),
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Container(
                    child: Image.network(widget.name.productImageUrls,height: 300, fit: BoxFit.fill,),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8, top: 20),
                    child: Text(
                      widget.name.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child:
                        Text(widget.name.price,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL(widget.name.productUrl);
                          },
                          child: const Text('Shop'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            // primary: Colors.red,
                            // fixedSize: const Size.fromWidth(100.0),
                          ),
                        ),
                      ),
                      Groceries('Stock ', widget.name.stock),
                      const SizedBox(height: 10,),
                      Groceries('Discount ', widget.name.discount),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                              'Deskripsi ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 4,),
                      Text(widget.name.description),
                    ],
                  )
                ],
              )
            ),
        )
    );
  }

  Widget Groceries(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
            '$key: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
        ),
        Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            )
        ),
      ],
    );
  }

  void _launchURL(_url) async {
    if(!await launch(_url)) throw 'Could not launch $_url';
  }

}

