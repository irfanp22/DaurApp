import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daur_app/data/datastore/user_datastore.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/material.dart';

class StreamCatalogWidget extends StatelessWidget {
  final catalogData;

  const StreamCatalogWidget({
    Key? key,
    required this.catalogData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: UserDatastore().stream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final bool isItemAdded =
            snapshot.data!.docs.any((doc) => doc['name'] == catalogData);

        return isItemAdded
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check,
                    size: 16,
                    color: AppStyle.primaryColor,
                  ),
                  Text(
                    'ditambahkan',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                  )
                ],
              )
            : const SizedBox();
      },
    );
  }
}
