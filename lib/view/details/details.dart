// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project/theme/app_colors.dart';
import 'package:project/widgets/widgets.dart';

AppColors appcolor = AppColors();

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
            title: text(data: "BOOK DETAILS")),
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
                    text(
                        data: title,
                        color: appcolor.orange,
                        size: 30,
                        weight: FontWeight.w900),
                    text(
                        data: author,
                        color: appcolor.orange,
                        weight: FontWeight.w200,
                        size: 20),
                    text(
                        data: description,
                        color: appcolor.orange,
                        weight: FontWeight.w200,
                        size: 20),
                    text(
                        data: "₹ : $price",
                        color: appcolor.orange,
                        weight: FontWeight.w200,
                        size: 20),
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
                          child: text(data: "Add To Cart")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
