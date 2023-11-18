import 'package:daur_app/data/model/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {
  final NewsItem newsItem;

  const NewsListItem({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(CupertinoIcons.calendar), // Date icon on the left
      title: Text(newsItem.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${newsItem.date.toLocal()}",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(newsItem.preview),
        ],
      ),
      trailing: const Icon(Icons.image),
      onTap: () {
        // Handle news item tap
      },
    );
  }
}
