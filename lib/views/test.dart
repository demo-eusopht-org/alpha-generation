// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:noble_vintage/model/product_model.dart';
//
// import '../controller/user_controller.dart';
//
// class Test extends StatefulWidget {
//   const Test({super.key});
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   // final userController = Get.find<UserController>();
//   final userController = Get.put(UserController());
//   ProductModel? productModel;
//   Future<void> init() async {
//     productModel = await userController.userProducts();
//     print('title${productModel?.description}');
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     init();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             productModel?.title ?? '',
//             style: TextStyle(
//               color: Colors.pink,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
