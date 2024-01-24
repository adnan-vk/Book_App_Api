import 'package:flutter/material.dart';
import 'package:project/controller/book_provider.dart';
import 'package:project/controller/search_provider.dart';
import 'package:project/view/details/details.dart';
import 'package:project/view/favourite/favourite.dart';
import 'package:project/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SearchProvider>(context, listen: false);
    prov.loadBooks();
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
                  ),
                );
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
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: textformfield(
                  labeltext: "Search here ...",
                  onchange: (value) =>
                      Provider.of<SearchProvider>(context, listen: false)
                          .search(value, context),
                )),
            const SizedBox(
              height: 10,
            ),
            Consumer2<SearchProvider, BookProvider>(
                builder: (context, searchvalue, value, child) {
              if (searchvalue.searchedList.isEmpty) {
                if (value.booklist.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: size.height * .4,
                        crossAxisSpacing: size.width * 0.01,
                        mainAxisSpacing: size.height * 0.01,
                      ),
                      itemBuilder: (context, index) {
                        final item = value.booklist[index];
                        if (prov.searchedList.isEmpty) {
                          item;
                        }
                        prov.searchedList[index];
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
                              ),
                            ),
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
                                      ),
                                    )
                                  ]),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  text(
                                      data:
                                          "name : ${item.title}".toUpperCase(),
                                      color: appcolor.orange,
                                      weight: FontWeight.w900,
                                      size: 15),
                                  text(
                                      data: "author : ${item.author}"
                                          .toUpperCase(),
                                      color: appcolor.orange,
                                      size: 10,
                                      weight: FontWeight.w200),
                                  text(
                                      data: "Type :  ${item.category}"
                                          .toUpperCase(),
                                      color: appcolor.orange,
                                      weight: FontWeight.w200,
                                      size: 10),
                                  text(
                                      data: "₹ : ${item.price}".toUpperCase(),
                                      color: appcolor.orange,
                                      size: 10,
                                      weight: FontWeight.w200)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: prov.searchedList.length,
                    ),
                  );
                } else {
                  return const Center(child: Text("No data"));
                }
              } else {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: size.height * .4,
                      crossAxisSpacing: size.width * 0.01,
                      mainAxisSpacing: size.height * 0.01,
                    ),
                    itemBuilder: (context, index) {
                      final item = searchvalue.searchedList[index];
                      if (prov.searchedList.isEmpty) {
                        item;
                      }
                      prov.searchedList[index];
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
                            ),
                          ),
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
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                text(
                                    data: "name : ${item.title}".toUpperCase(),
                                    color: appcolor.orange,
                                    weight: FontWeight.w900,
                                    size: 15),
                                text(
                                    data:
                                        "author : ${item.author}".toUpperCase(),
                                    color: appcolor.orange,
                                    size: 10,
                                    weight: FontWeight.w200),
                                text(
                                    data: "Type :  ${item.category}"
                                        .toUpperCase(),
                                    color: appcolor.orange,
                                    weight: FontWeight.w200,
                                    size: 10),
                                text(
                                    data: "₹ : ${item.price}".toUpperCase(),
                                    color: appcolor.orange,
                                    size: 10,
                                    weight: FontWeight.w200)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: prov.searchedList.length,
                  ),
                );
              }
            }),
          ],
        ));
  }
}