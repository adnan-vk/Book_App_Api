import 'package:flutter/material.dart';
import 'package:project/controller/userprovider.dart';
import 'package:provider/provider.dart';

class detailsPage extends StatelessWidget {
  const detailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                // image: DecorationImage(image: NetworkImage('${}'))
              ),
            )
          ],
        ),
      ),
    );
  }
}