import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class myfavouriteitemscreen extends StatefulWidget {
  const myfavouriteitemscreen({super.key});

  @override
  State<myfavouriteitemscreen> createState() => _myfavouriteitemscreenState();
}

class _myfavouriteitemscreenState extends State<myfavouriteitemscreen> {
  @override
  Widget build(BuildContext context) {
     print('build');
    final favouriteProvider = Provider.of<favouriteitemprovider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Favourite App")),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const myfavouriteitemscreen()));
            },
            child: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selecteditem.length,
                itemBuilder: (context, index) {
                  return Consumer<favouriteitemprovider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: (() {
                        if (value.selecteditem.contains(index)) {
                          value.removeitem(index);
                        } else {
                          value.additem(index);
                          //favouriteProvider.additem(index);
                          //favouriteProvider.selecteditem.add(index);
                          //selecteditem.add(index);
                        }

                        setState(() {});
                      }),
                      title: Text("Item ${(index + 1).toString()}"),
                      trailing: Icon(
                          //selecteditem.contains(index) ? Icons.favorite: Icons.favorite_border_outlined),
                          //favouriteProvider.selecteditem.contains(index) ? Icons.favorite: Icons.favorite_border_outlined),
                          value.selecteditem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined),
                    );
                  });
                  // ListTile(
                  //   onTap: (() {
                  //     favouriteProvider.additem(index);
                  //     //favouriteProvider.selecteditem.add(index);
                  //     //selecteditem.add(index);
                  //     setState(() {});
                  //   }),
                  //   title: Text("Item ${(index + 1).toString()}"),
                  //   trailing: Icon(
                  //    //selecteditem.contains(index) ? Icons.favorite: Icons.favorite_border_outlined),
                  //    favouriteProvider.selecteditem.contains(index) ? Icons.favorite: Icons.favorite_border_outlined),
                  // );
                }),
          ),
        ],
      ),
    );
  }
}