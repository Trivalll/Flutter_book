import 'package:book_design_app/models/book_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/book-details-screen';

  @override
  Widget build(BuildContext context) {
    final bookId = ModalRoute.of(context)!.settings.arguments as String;
    final bookData = Provider.of<BookData>(context).bookItems.firstWhere((book) => book.id == bookId);
    final appBar = AppBar(title: Text(bookData.title), centerTitle: true,);
    final scale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Image.network(
              bookData.imageUrl,
              fit: BoxFit.cover,
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.5,
            ),
          ),
          Column(
            children: [
              Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.47,
                  margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25),),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.5), offset: const Offset(-4, -4), blurRadius: 4,),
                    BoxShadow(color: Colors.grey.withOpacity(0.6), offset: const Offset(4, 4), blurRadius: 4,),
                  ]
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(bookData.title, style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800, color: Colors.indigo[900]), textScaleFactor: 0.7,),
                                Text('${bookData.price} €', style: TextStyle(fontSize: 28 * scale, fontWeight: FontWeight.w800, color: Colors.indigo[900]), textScaleFactor: 0.7,),
                              ],
                            ),
                          ),
                          Text(bookData.description, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800), textScaleFactor: 0.8,),
                          SizedBox(height: MediaQuery.of(context).size.height < 550 ? 15 : 30),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ElevatedButton(

                              onPressed: () {},
                              child: const Text('Buy', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
