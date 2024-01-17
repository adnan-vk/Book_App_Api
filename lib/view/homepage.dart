import 'package:flutter/material.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Provider.of<BookProvider>(context, listen: false).getBooks();

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<BookProvider>(
        builder: (context, value, child) {
          if (value.booklist.isNotEmpty) {
            final allBooks = value.booklist;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: size.width * .05,
                mainAxisSpacing: size.height * .06,
              ),
              itemBuilder: (context, index) {
                final item = allBooks[index];
                return Card(
                  child: Column(
                    children: [Text(item.title)],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}
