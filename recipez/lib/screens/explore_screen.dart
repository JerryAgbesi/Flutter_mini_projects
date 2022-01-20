import 'package:flutter/material.dart';
import 'package:recipez/components/components.dart';
import 'package:recipez/models/models.dart';
import 'package:recipez/api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _controller;

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the bottom');
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the top');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: mockService.getExploreData(),
    );
  }
}


// class ExploreScreen extends StatelessWidget {
//   ExploreScreen({Key? key}) : super(key: key);

//   final mockService = MockFooderlichService();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (context, AsyncSnapshot<ExploreData> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
//               const SizedBox(
//                 height: 16,
//               ),
//               FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
//             ],
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//       future: mockService.getExploreData(),
//     );
//   }
// }

