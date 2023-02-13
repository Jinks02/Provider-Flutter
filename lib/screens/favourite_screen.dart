import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/provider/favourite_item_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final favouriteItemProviderObj =
        // Provider.of<FavouriteItemProvider>(context,listen: false);
    print("entire tree");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return ListTile(
                      onTap: () {
                        print("only consumer");
                        if (value.getSelectedItemList.contains(index)) {
                          value.removeSelectedItem(index);
                        }
                        else{
                          value.addSelectedItem(index);
                        }
                      },
                      title: Text("item $index"),
                      trailing: value.getSelectedItemList
                          .contains(index)
                          ? Icon(Icons.favorite_outlined)
                          : Icon(Icons.favorite_outline),
                    );
                  },

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
