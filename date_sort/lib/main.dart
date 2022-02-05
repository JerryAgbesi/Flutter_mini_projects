import 'package:flutter/material.dart';
import 'news_card.dart';
import 'news.dart';
import 'constants.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  await DotEnv.load(fileName: ".env");
  runApp(NewsSort());
}


class NewsSort extends StatelessWidget {
 NewsSort({Key? key}) : super(key: key);

  @override
  News currentNews = News();
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date sort',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(30),
            child: FutureBuilder(
              future: currentNews.fetchNews(),
              builder: (context, AsyncSnapshot<List<News>> snapshot) {
                if (snapshot.hasData) {
                  List<News>? news = snapshot.data;

                  return ListView.builder(
                      itemCount: news!.length,
                      itemBuilder: (context, index) {
                        DateTime currentDate = news[index].datePublished!;
                        if (index != 0) {
                          //if the articles are posted on the same Day
                          //return a card without the date
                          if (currentDate.day ==
                              news[index - 1].datePublished!.day) {
                            return NewsCard(
                              author: (news[index].author).toString(),
                              title: (news[index].title).toString(),
                            );
                            //
                          } else {
                            return Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      child: Divider(
                                        indent: 20,
                                        endIndent: 20,
                                        height: 5,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '${currentDate.year}- ${currentDate.month}- ${currentDate.day}',
                                      style: dateFormat,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                NewsCard(
                                  author: (news[index].author).toString(),
                                  title: (news[index].title).toString(),
                                )
                              ],
                            );
                          }
                          //if the article is the first in the list,print the date posted as well
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    indent: 20,
                                    endIndent: 20,
                                    height: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                    '${currentDate.year}- ${currentDate.month}- ${currentDate.day}',
                                    style: dateFormat),
                              ],
                            ),
                          );
                        }
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
