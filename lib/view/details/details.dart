// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final title;
  final description;
  final price;
  final image;
  final author;

  const DetailsPage(
      {Key? key,
      this.title,
      this.description,
      this.price,
      this.image,
      this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: const Text("BOOK DETAILS"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: image != null
                            ? DecorationImage(image: NetworkImage(image))
                            : null,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ),
                    Text(
                      author,
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w200,
                          fontSize: 20),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w200,
                          fontSize: 20),
                    ),
                    Text(
                      "₹ : $price".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w200,
                          fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height * .08,
                      width: size.width * .25,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(Icons.favorite_border)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * .65,
                      height: size.height * .08,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orange)),
                          onPressed: () {},
                          child: const Text("Add To Cart")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
