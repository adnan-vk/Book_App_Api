import 'package:flutter/material.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:project/controller/searchprovider.dart';
import 'package:project/view/details.dart';
import 'package:project/view/favourite.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false).loadProducts();
    final size = MediaQuery.of(context).size;
    Provider.of<BookProvider>(context, listen: false).getBooks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Books List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Favourite(),
                  ));
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Consumer<BookProvider>(
        builder: (context, value, child) {
          if (value.booklist.isNotEmpty) {
            final allBooks = value.booklist;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (value) =>
                        Provider.of<SearchProvider>(context, listen: false)
                            .search(value, context),
                    decoration: InputDecoration(
                      labelText: "Search here ...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: size.height * .4,
                      crossAxisSpacing: size.width * 0.01,
                      mainAxisSpacing: size.height * 0.01,
                    ),
                    itemBuilder: (context, index) {
                      final item = allBooks[index];
                      return SingleChildScrollView(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  title: item.title,
                                  image: item.image.toString(),
                                  description: item.description,
                                  price: item.price.toString(),
                                  author: item.author,
                                ),
                              )),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(children: [
                                  Container(
                                    width: size.width * 0.5,
                                    height: size.height * 0.3,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("${item.image}"),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      left: 180,
                                      top: 20,
                                      child: Container(
                                        color: Colors.white,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.orange,
                                            )),
                                      ))
                                ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "name : ${item.title}".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15),
                                ),
                                Text(
                                  "author : ${item.author}".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10),
                                ),
                                Text(
                                  "Type :  ${item.category}".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10),
                                ),
                                Text(
                                  "₹ : ${item.price}".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: allBooks.length,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}
