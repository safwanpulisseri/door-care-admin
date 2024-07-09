// import 'package:door_care_admin/feature/requests/view/page/verify_page.dart';
// import 'package:flutter/material.dart';
// import '../../../../core/theme/color/app_color.dart';
// import 'request_page.dart';

// class RequestHomePage extends StatefulWidget {
//   const RequestHomePage({super.key});

//   @override
//   State<RequestHomePage> createState() => _RequestHomePageState();
// }

// class _RequestHomePageState extends State<RequestHomePage> {
//   int _selectedIndex = 0;
//   final List<Widget> _pages = [
//     const RequestPage(),
//     const VerifyPage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: <Widget>[
//           Expanded(
//             child: Column(
//               children: [
//                 AppBar(
//                   title: ElevatedButton(
//                       onPressed: () {
//                         _onItemTapped(1);
//                       },
//                       child: const Text("Hai")),
//                   backgroundColor: AppColor.background,
//                 ),
//                 Expanded(
//                   child: IndexedStack(
//                     index: _selectedIndex,
//                     children: _pages,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
