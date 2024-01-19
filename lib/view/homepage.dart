import 'package:flutter/material.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:project/controller/shrdprfprovider.dart';
import 'package:project/view/bottombar.dart';
import 'package:project/view/loginscreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Provider.of<BookProvider>(context, listen: false).getBooks();
    final prov = Provider.of<ShrdProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Books List",
          style: TextStyle(
              color: Colors.yellow, fontWeight: FontWeight.w900, fontSize: 35),
        ),
        actions: [
          IconButton(
            onPressed: () {
              prov.clearToken();
              prov.clearUserId();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        // color: Colors.black87,
        child: Consumer<BookProvider>(
          builder: (context, value, child) {
            if (value.booklist.isNotEmpty) {
              final allBooks = value.booklist;
              return ListView.builder(
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // crossAxisCount: 2,
                // childAspectRatio: 0.8,
                // crossAxisSpacing: size.width * .05,
                // mainAxisSpacing: size.height * .04,
                // ),
                itemBuilder: (context, index) {
                  final item = allBooks[index];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.white54,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: size.width * .3,
                                  height: size.height * .3,
                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                          image:
                                              NetworkImage("${item.image}"))),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Text(
                                  "${item.title}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Author :  ${item.author}",
                                  style: const TextStyle(),
                                ),
                                Text(
                                  "Type :  ${item.category}".toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  "₹ : ${item.price}".toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w200),
                                ),
                                // Text(
                                //   "${item.description}",
                                //   style: const TextStyle(),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: allBooks.length,
              );
            } else {
              return const Center(child: Text("No data"));
            }
          },
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
