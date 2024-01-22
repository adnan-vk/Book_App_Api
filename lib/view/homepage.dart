import 'package:flutter/material.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:project/controller/shrdprfprovider.dart';
import 'package:project/view/loginscreen.dart';
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
    final prov = Provider.of<ShrdProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: TextFormField(
          decoration: InputDecoration(label: Text("search here")),
        ),
        backgroundColor: Colors.grey,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Books List",
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.w500, fontSize: 40),
        ),
        actions: [
          IconButton(
            onPressed: () {
              prov.clearToken();
              prov.clearUserId();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
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
        padding: const EdgeInsets.all(15),
        color: Colors.grey,
        child: Consumer<BookProvider>(
          builder: (context, value, child) {
            if (value.booklist.isNotEmpty) {
              final allBooks = value.booklist;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                  crossAxisSpacing: size.width * .03,
                  mainAxisSpacing: size.height * .02,
                ),
                itemBuilder: (context, index) {
                  final item = allBooks[index];
                  return Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 9,
                        child: Container(
                          width: size.width * .4,
                          height: size.width * .5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage("${item.image}")),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: size.width * .2,
                                  height: size.height * .2,
                                  decoration: BoxDecoration(),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 10,),
                      Container(
                        width: size.width * .25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Text(
                              "₹ : ${item.price}".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w200),
                            ),
                            Text(
                              "Type :  ${item.category}".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      )
                    ],
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
