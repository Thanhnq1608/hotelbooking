// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hotelbooking/app/manage_profile/manage_profile_controller.dart';
// import 'package:hotelbooking/app/profile/profile_controller.dart';

// class ManageProfileView extends StatelessWidget {
//   final controller = Get.put(ManageProfileController(map: Get.arguments));
//   var _fullnameController,
//       _phoneNumberController,
//       _emailController,
//       _dateOfBirthController,
//       _addressController = TextEditingController();

//   Widget _bodyManage(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height * 0.9,
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * 0.05),
//         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Positioned(
//                 top: MediaQuery.of(context).size.height * 0.05,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   height: MediaQuery.of(context).size.height * 0.76,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                             top: MediaQuery.of(context).size.height * 0.1),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         child: TextField(
//                           decoration: InputDecoration(labelText: 'Fullname'),
//                           controller: _fullnameController,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 15),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         child: TextField(
//                           decoration:
//                               InputDecoration(labelText: 'Phone Number'),
//                           controller: _phoneNumberController,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 15),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         child: TextField(
//                           decoration: InputDecoration(labelText: 'Email'),
//                           controller: _emailController,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 15),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         child: Row(
//                           children: [
//                             TextField(
//                               readOnly: true,
//                               decoration:
//                                   InputDecoration(labelText: 'Date of birth'),
//                               controller: _dateOfBirthController,
//                               onTap: () {
//                                 var result = Get.bottomSheet(CupertinoDatePicker(
//                                   initialDateTime: DateTime.now(),
//                                   mode: CupertinoDatePickerMode.date,
//                                   onDateTimeChanged: (val){
                                    
//                                   },
//                                 ));

//                               },
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 15),
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         child: TextField(
//                           decoration: InputDecoration(labelText: 'Address'),
//                           controller: _addressController,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//             Container(
//                 width: MediaQuery.of(context).size.width * 0.2,
//                 height: MediaQuery.of(context).size.width * 0.2,
//                 margin: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.01),
//                 child: Stack(
//                   children: [
//                     Obx(
//                       () => Container(
//                         decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black45,
//                                   blurRadius: 10,
//                                   offset: Offset(0, 2),
//                                   spreadRadius: 1)
//                             ],
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 image: controller.networkImage.value,
//                                 fit: BoxFit.fill)),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: Container(
//                         width: 20,
//                         height: 20,
//                         decoration: BoxDecoration(
//                             color: Colors.white, shape: BoxShape.circle),
//                         child: IconButton(
//                           padding: EdgeInsets.zero,
//                           icon: Icon(
//                             Icons.camera_alt_rounded,
//                             color: Color(0xFF8799AF),
//                             size: 15,
//                           ),
//                           onPressed: null,
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//           ],
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     _fullnameController.text = controller.fullname.value;
//     _phoneNumberController.text = controller.fullname.value;
//     _emailController.text = controller.username.value;
//     _dateOfBirthController.text = controller.dateOfBirrth.value;
//     _addressController.text = controller.address;

//     _fullnameController.addListener(() {
//       controller.fullname.value = _fullnameController.text;
//     });
//     _emailController.addListener(() {
//       controller.username.value = _emailController.text;
//     });
//     _dateOfBirthController.addListener(() {
//       controller.dateOfBirrth.value = _dateOfBirthController.text;
//     });
//     _phoneNumberController.addListener(() {
//       controller.fullname.value = _fullnameController.text;
//     });
//     _addressController.addListener(() {
//       controller.address = _addressController.text;
//     });
//     return Scaffold(
//         backgroundColor: Theme.of(context).backgroundColor,
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).primaryColor,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.white,
//             ),
//             onPressed: () => Get.toNamed('/profile'),
//           ),
//           title: const Text(
//             'Manage Profile',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(child: _bodyManage(context)),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.1,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20))),
//             )
//           ],
//         ));
//   }
// }
