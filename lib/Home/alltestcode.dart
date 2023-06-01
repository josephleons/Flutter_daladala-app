// import 'package:flutter/material.dart';
//
//
// class MyListView extends StatefulWidget {
//   @override
//   _MyListViewState createState() => _MyListViewState();
// }
//
// class _MyListViewState extends State<MyListView> {
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _textController = TextEditingController();
//   List<String> items = List.generate(100, (index) => 'Item $index');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextField(
//             controller: _textController,
//             decoration: InputDecoration(
//               hintText: 'Search',
//             ),
//             onChanged: (text) {
//               // Do something with the search text
//             },
//           ),
//           Expanded(
//             child: Scrollbar(
//               controller: _scrollController,
//               child: ListView.builder(
//                 controller: _scrollController,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return Dismissible(
//                     key: UniqueKey(),
//                     onDismissed: (direction) {
//                       setState(() {
//                         items.removeAt(index);
//                       });
//                     },
//                     background: Container(color: Colors.red),
//                     child: ListTile(
//                       title: Text(items[index]),
//                       subtitle: Text('Subtitle $index'),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
