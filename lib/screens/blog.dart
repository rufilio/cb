import 'package:Bliss/screens/blog_details.dart';
import 'package:Bliss/widgets/post_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Post {
  final String title;
  final String image;
  final String author;
  final String date;
  final String info;
  final String filter;

  Post(
      {required this.title,
      required this.image,
      required this.author,
      required this.info,
      required this.filter,
      required this.date});
}

class BlogPage extends StatefulWidget {
  static List<String> previousSearch = [];

  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<Post> posts = [];

  List<bool> isSelected = [];
  List<String> filters = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
    loadCategories();
  }

  Future<void> loadPosts() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('blogs').get();

      List<DocumentSnapshot> documents = querySnapshot.docs;

      setState(() {
        posts = documents.map((doc) {
          DateTime date = doc['date'] is Timestamp
              ? (doc['date'] as Timestamp).toDate()
              : DateTime.parse(doc['date']);

          String formattedDate = DateFormat('yyyy-MM-dd').format(date);

          return Post(
            title: doc['title'],
            image: doc['image'],
            author: doc['author'],
            info: doc['info'],
            filter: doc['filter'],
            date: formattedDate,
          );
        }).toList();
      });
    } catch (error) {
      print('Error al cargar datos desde Firestore: $error');
    }
  }

  Future<void> loadCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('categories').get();

      List<DocumentSnapshot> documents = querySnapshot.docs;

      isSelected.clear();
      filters.clear();

      isSelected.add(true);
      filters.add('All');

      for (var document in documents) {
        String categoryName = document['name'];

        if (!filters.contains(categoryName)) {
          isSelected.add(false);
          filters.add(categoryName);
        }
      }
      setState(() {});
    } catch (error) {
      print('Error al cargar datos desde Firestore: $error');
    }
  }

  List<Post> getFilteredPosts(String category) {
    if (category.toLowerCase() == 'all') {
      return posts;
    } else {
      return posts.where((post) => post.filter.contains(category)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: filters.length,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          flexibleSpace: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: filters.map((filter) {
              return Tab(
                text: filter,
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: filters.map((filter) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: getFilteredPosts(filter).length,
              itemBuilder: (context, index) {
                final post = getFilteredPosts(filter)[index];
                return PostCellWidget(
                  title: post.title,
                  image: post.image,
                  author: post.author,
                  date: post.date,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsPage(
                          title: post.title,
                          image: post.image,
                          info: post.info,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
