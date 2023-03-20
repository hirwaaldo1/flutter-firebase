import 'package:flutter/material.dart';
import 'package:flutter_auth/responsive.dart';
import '../../components/background.dart';
import 'Login/login_screen.dart';

import 'package:flutter/material.dart';

class BlogPost {
  final String title;
  final String author;
  final String date;
  final String content;

  BlogPost(
      {required this.title,
      required this.author,
      required this.date,
      required this.content});
}

class ViewPost extends StatelessWidget {
  // const ViewPost({Key? key}) : super(key: key);
  final List<BlogPost> blogPosts = [
    BlogPost(
      title: 'First post',
      author: 'Jane Doe',
      date: 'Feb 1, 2023',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    BlogPost(
      title: 'Second post',
      author: 'John Smith',
      date: 'Feb 5, 2023',
      content:
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    BlogPost(
      title: 'Third post',
      author: 'Jane Smith',
      date: 'Feb 10, 2023',
      content:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text('All Posts'),
        ),
        body:Center(
          child: FractionallySizedBox(
          widthFactor: 0.90, // between 0 and 1
          heightFactor: 1.0,
          // padding: EdgeInsets.symmetric(horizontal: 100),
          child: ListView.builder(
            itemCount: blogPosts.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // Navigate to blog post details screen
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              blogPosts[index].title,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  blogPosts[index].author,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Text(
                                  blogPosts[index].date,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              blogPosts[index].content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ))
        );
       
  }
}

// class ViewPost extends StatelessWidget {
//   const ViewPost({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       child: SingleChildScrollView(
//         child: Responsive(
//           mobile: const MobileLoginScreen(),
//           desktop: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 20),
//                     Text(
//                       'Posts',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _buildCard(
//                           'https://via.placeholder.com/150x150.png?text=Post1',
//                           'Post 1',
//                           'Description for post 1',
//                         ),
//                         _buildCard(
//                           'https://via.placeholder.com/150x150.png?text=Post2',
//                           'Post 2',
//                           'Description for post 2',
//                         ),
//                         _buildCard(
//                           'https://via.placeholder.com/150x150.png?text=Post3',
//                           'Post 3',
//                           'Description for post 3',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCard(String imageUrl, String title, String description) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//         side: BorderSide(
//           color: Colors.black,
//           width: 1,
//         ),
//       ),
//       child: Container(
//         // width: 30 * MediaQuery.of(context).textScaleFactor,
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Image.network(
//               imageUrl,
//               width: double.infinity,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 10),
//             Text(
//               title,
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 10),
//             Text(
//               description,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
