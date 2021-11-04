// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// List<StaggeredTile> _generateRandomTiles(int count) {
//   final rnd = Random();
//   return List.generate(
//       count,
//       (i) => StaggeredTile.count(
//           rnd.nextInt(2) + 1, rnd.nextInt(2).toDouble() + 0.5));
// }

// List _k = [
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
//   'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
// ];

// List<Color> _generateRandomColors(int count) {
//   const List<Color> _kColors = <Color>[
//     Colors.green,
//     Colors.blue,
//     Colors.red,
//     Colors.pink,
//     Colors.indigo,
//     Colors.purple,
//     Colors.blueGrey,
//   ];
//   final rnd = Random();
//   return List.generate(count, (i) => _kColors[rnd.nextInt(_kColors.length)]);
// }

// class Random123 extends StatelessWidget {
//   Random123({Key? key})
//       : _tiles = _generateRandomTiles(_k.length).toList(),
//         _colors = _generateRandomColors(_k.length).toList(),
//         super(key: key);

//   // static const int _kItemCount = 100;
//   final List<StaggeredTile> _tiles;
//   final List<Color> _colors;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black45,
//       // appBar: PreferredSize(
//       //   preferredSize: const Size.fromHeight(50),
//       //   child: Row(
//       //     crossAxisAlignment: CrossAxisAlignment.center,
//       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //     children: [
//       //       Wrap(children: const [
//       //         Padding(
//       //           padding: EdgeInsets.only(top: 10, left: 5),
//       //           child: Icon(
//       //             Icons.home,
//       //             color: Colors.white,
//       //           ),
//       //         ),
//       //         SizedBox(
//       //           width: 5,
//       //         ),
//       //         Padding(
//       //           padding: EdgeInsets.only(top: 10),
//       //           child: Text(
//       //             'JOHN',
//       //             style: TextStyle(
//       //                 color: Color(0xff777777),
//       //                 fontFamily: 'Montserrat',
//       //                 fontWeight: FontWeight.bold,
//       //                 fontSize: 22),
//       //           ),
//       //         ),
//       //       ]),
//       //       Padding(
//       //         padding: EdgeInsets.only(right: 10),
//       //         child: Image.asset('assets/signin_logo.png'),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.contain,
//             image: AssetImage(
//               'assets/cd_logo.png',
//             ),
//           ),
//         ),
//         child: StaggeredGridView.countBuilder(
//           primary: false,
//           crossAxisCount: 2,
//           crossAxisSpacing: 4,
//           mainAxisSpacing: 4,
//           staggeredTileBuilder: _getTile,
//           itemBuilder: (context, index) => Card(
//             color: Colors.white54,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(25.0),
//               ),
//             ),
//             elevation: 10,
//             child: InkWell(
//               onTap: () {},
//               child: Stack(
//                 fit: StackFit.loose,
//                 alignment: Alignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(5.0),
//                       child: Image.network(_k[index], fit: BoxFit.contain),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           itemCount: _k.length,
//         ),
//       ),
//     );
//   }

//   StaggeredTile _getTile(int index) => _tiles[index];
// }
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// // class DashBoardMain extends StatefulWidget {
// //   const DashBoardMain({Key? key}) : super(key: key);

// //   @override
// //   _DashBoardMainState createState() => _DashBoardMainState();
// // }

// // class _DashBoardMainState extends State<DashBoardMain> {
// //   _DashBoardMainState() : crossAxisCount = 4;
// //   final List<int> _sizes = [
// //     1,
// //     2,
// //     3,
// //     1,
// //     2,
// //     1,
// //     1,
// //     1,
// //     2,
// //     4,
// //     2,
// //     1,
// //     1,
// //     2,
// //     3,
// //     1,
// //     2,
// //     4,
// //   ];

// //   int? _selectedIndex;

// //   final int crossAxisCount;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('dynamic resizing'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(4),
// //         child: StaggeredGridView.countBuilder(
// //           crossAxisCount: crossAxisCount,
// //           itemCount: _sizes.length,
// //           itemBuilder: (BuildContext context, int index) => _Example06Tile(
// //             key: ObjectKey(index),
// //             index: index,
// //             size: _sizes[index],
// //             onSizeDown: _handleSizeDown,
// //             onSizeUp: _handleSizeUp,
// //             onSelectedItemChanged: _handleSelectedItemChanged,
// //             maxSize: crossAxisCount,
// //             isSelected: _selectedIndex == index,
// //           ),
// //           staggeredTileBuilder: (int index) =>
// //               StaggeredTile.count(_sizes[index], _sizes[index].toDouble()),
// //           mainAxisSpacing: 4,
// //           crossAxisSpacing: 4,
// //         ),
// //       ),
// //     );
// //   }

// //   void _handleSizeDown(int index) {
// //     final currentSize = _sizes[index];
// //     if (currentSize > 0) {
// //       setState(() {
// //         _sizes[index] = currentSize - 1;
// //       });
// //     }
// //   }

// //   void _handleSizeUp(int index) {
// //     final currentSize = _sizes[index];
// //     if (currentSize < crossAxisCount) {
// //       setState(() {
// //         _sizes[index] = currentSize + 1;
// //       });
// //     }
// //   }

// //   void _handleSelectedItemChanged(int index) {
// //     setState(() {
// //       _selectedIndex = _selectedIndex == index ? null : index;
// //     });
// //   }
// // }

// // class _Example06Tile extends StatelessWidget {
// //   const _Example06Tile({
// //     Key? key,
// //     required this.index,
// //     required this.size,
// //     required this.onSizeDown,
// //     required this.onSizeUp,
// //     required this.onSelectedItemChanged,
// //     required this.maxSize,
// //     required this.isSelected,
// //   }) : super(key: key);

// //   final int index;
// //   final int size;
// //   final ValueChanged<int> onSizeDown;
// //   final ValueChanged<int> onSizeUp;
// //   final ValueChanged<int> onSelectedItemChanged;
// //   final int maxSize;
// //   final bool isSelected;

// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Widget> widgets = <Widget>[
// //       Padding(
// //         padding: EdgeInsets.all(isSelected ? 8.0 : 0.0),
// //         child: Card(
// //           color: Colors.green,
// //           child: InkWell(
// //             onLongPress: () => onSelectedItemChanged(index),
// //             child: Center(
// //               child: CircleAvatar(
// //                 backgroundColor: Colors.white,
// //                 child: Text('$index'),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     ];

// //     if (isSelected) {
// //       widgets.add(_buildTileButton(_kCloseTileButton));

// //       if (size > 1) {
// //         widgets.add(_buildTileButton(_kSizeDownTileButton));
// //       }

// //       if (size < maxSize) {
// //         widgets.add(_buildTileButton(_kSizeUpTileButton));
// //       }
// //     }

// //     return Stack(children: widgets);
// //   }

// //   Widget _buildTileButton(_TileButton tileButton) {
// //     return Positioned(
// //       top: tileButton.top,
// //       bottom: tileButton.bottom,
// //       left: tileButton.left,
// //       right: tileButton.right,
// //       child: GestureDetector(
// //         onTap: () => tileButton.onTap(this),
// //         child: CircleAvatar(
// //           radius: 16,
// //           backgroundColor: Colors.teal,
// //           child: Text(tileButton.text),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // final _TileButton _kSizeDownTileButton = _TileButton(
// //   text: '-',
// //   isLeft: true,
// //   isTop: false,
// //   onTap: (_Example06Tile tile) => tile.onSizeDown(tile.index),
// // );

// // final _TileButton _kSizeUpTileButton = _TileButton(
// //   text: '+',
// //   isLeft: false,
// //   isTop: false,
// //   onTap: (_Example06Tile tile) => tile.onSizeUp(tile.index),
// // );

// // final _TileButton _kCloseTileButton = _TileButton(
// //   text: 'x',
// //   isLeft: false,
// //   isTop: true,
// //   onTap: (_Example06Tile tile) => tile.onSelectedItemChanged(tile.index),
// // );

// // class _TileButton {
// //   const _TileButton({
// //     required this.text,
// //     required this.onTap,
// //     required bool isLeft,
// //     required bool isTop,
// //   })  : bottom = isTop ? null : 0.0,
// //         top = isTop ? 0.0 : null,
// //         left = isLeft ? 0.0 : null,
// //         right = isLeft ? null : 0.0;

// //   final double? bottom;
// //   final double? top;
// //   final double? left;
// //   final double? right;
// //   final String text;
// //   final ValueChanged<_Example06Tile> onTap;
// // }
