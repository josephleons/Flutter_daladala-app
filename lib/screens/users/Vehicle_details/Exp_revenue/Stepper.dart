// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:vms/widgets/appIconWidgets.dart';
// import 'package:vms/widgets/bigtext_widget.dart';
// import 'package:vms/util/dimension.dart';
// import '../../../../util/colors.dart';
//
// class expandForm extends StatefulWidget {
//   const expandForm({Key? key}) : super(key: key);
//
//   @override
//   State<expandForm> createState() => _expandFormState();
// }
//
// class _expandFormState extends State<expandForm> {
//
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();
//   // _activeStept 0
//   final _PartNameController = TextEditingController();
//   final _PartNumberController = TextEditingController();
//   final _PartCostController = TextEditingController();
//   final _ManufactureController = TextEditingController();
//   final _SupplierController = TextEditingController();
//   final _DescriptionController = TextEditingController();
//
//   // _activeStep 1
//   final _vehicleController = TextEditingController();
//   final _laborController = TextEditingController();
//   final _serviceNameController = TextEditingController();
//   final _serviceCostController = TextEditingController();
//   final _serviceDescController = TextEditingController();
//   final _uploadController = TextEditingController();
//   bool isComplete = false;
//   String? selectedValue ;
//
//   int _activeStepIndex = 0;
//   // Widget screen
//   List<Step> stepList() => [
//     Step(
//       state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
//       isActive: _activeStepIndex >= 0,
//       title: const BigText(text: 'Car'),
//       content: Column(
//         children: [
//           //choose vehicles
//           TextFormField(
//             controller: _PartNameController,
//             decoration: const InputDecoration(
//               labelText: 'Car ID',
//             ),
//             validator: validateText,
//           ),
//           SizedBox(
//             height: Dimension.height20,
//           ),
//           TextFormField(
//             controller: _PartNameController,
//             decoration: const InputDecoration(
//               labelText: 'Make',
//             ),
//             validator: validateText,
//           ),
//           // labor cost
//           SizedBox(
//             height: Dimension.height20,
//           ),
//           TextFormField(
//             controller: _PartNameController,
//             decoration: const InputDecoration(
//               labelText: 'Model',
//             ),
//             validator: validateText,
//           ),
//           SizedBox(height: Dimension.height20),
//         ],
//       ),
//     ),
//     // Service Stepper
//     Step(
//       state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
//       isActive: _activeStepIndex >= 1,
//       title: const BigText(text: 'Driver Info'),
//       content: Column(
//         children: [
//           //choose vehicles
//           TextFormField(
//             controller: _vehicleController,
//             decoration: const InputDecoration(
//               labelText: 'Driver Details',
//             ),
//             validator: validateText,
//           ),
//           // labor cost
//           SizedBox(
//             height: Dimension.height20,
//           ),
//           TextFormField(
//             controller: _vehicleController,
//             decoration: const InputDecoration(
//               labelText: 'Owner Details',
//             ),
//             validator: validateText,
//           ),
//           SizedBox(
//             height: Dimension.height20,
//           ),
//           TextFormField(
//             controller: _vehicleController,
//             decoration: const InputDecoration(
//               labelText: 'Amount',
//             ),
//             validator: validateText,
//           ),
//         ],
//       ),
//     ),
//     Step(
//         state: StepState.complete,
//         isActive: _activeStepIndex >= 2,
//         title: const BigText(text: 'Confirm'),
//         content: SizedBox(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: Dimension.height45,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     BigText(
//                         text: "Amount", color: AppColors.textColor),
//                     BigText(
//                         text: "30000", color: AppColors.textColor),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: Dimension.height45,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     BigText(text: "Car", color: AppColors.textColor),
//                     BigText(
//                         text: "T2435ABC", color: AppColors.textColor),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: Dimension.height45,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     BigText(text: "Date", color: AppColors.textColor),
//                     BigText(
//                         text: "15/7/2023", color: AppColors.textColor),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: Dimension.height45,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     BigText(
//                         text: "Driver", color: AppColors.textColor),
//                     BigText(
//                         text: "dereva@gmail.com",
//                         color: AppColors.textColor),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: Dimension.height45,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     BigText(
//                         text: "Owner", color: AppColors.textColor),
//                     BigText(
//                         text: "user@mail.com", color: AppColors.textColor),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Daily Car service",
//             style: TextStyle(
//               fontFamily: 'Poppins',
//             ),
//           ),
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 icon: const Icon(
//                   LineAwesomeIcons.angle_left,
//                   color: Colors.white,
//                   size: 27,
//                 ),
//                 onPressed: () => Navigator.pop(context)),
//           ),
//           actions: [
//             // let platenumber
//             Container(
//               padding: const EdgeInsets.all(9.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.defaulColor.withOpacity(0.6),
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       LineAwesomeIcons.car,
//                       color: AppColors.iconColor2,
//                     ),
//                   ),
//                   const BigText(
//                     text: 'T2435ABC',
//                     color: AppColors.cardColor,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: const Color(0xff0A374C),
//         ),
//         backgroundColor: AppColors.background,
//         // body
//         body: Theme(
//           data: Theme.of(context).copyWith(
//               colorScheme: const ColorScheme.light(primary: Colors.teal)),
//           child: Form(
//             key: _key,
//             child: Stepper(
//               type: StepperType.horizontal,
//               steps: stepList(),
//               currentStep: _activeStepIndex,
//               onStepTapped: (step) {
//                 _key.currentState!.validate();
//                 setState(() {
//                   _activeStepIndex = step;
//                 });
//               },
//               onStepContinue: () {
//                 final isLastStep = _activeStepIndex == stepList().length - 1;
//                 _key.currentState?.validate();
//                 bool isDetailValid =
//                 isDetailsComplete(); //this will check on Ok move to next
//                 if (isDetailValid) {
//                   if (isLastStep) {
//                     setState(() => isComplete = true);
//                   } else {
//                     setState(() => _activeStepIndex += 1);
//                   }
//                 }
//               },
//               onStepCancel: () {
//                 if (_activeStepIndex == 0) {
//                   return;
//                 } else {
//                   setState(() {
//                     _activeStepIndex -= 1;
//                   });
//                 }
//               },
//               controlsBuilder: (BuildContext context, ControlsDetails details) {
//                 final isLastStep = _activeStepIndex == stepList().length - 1;
//                 return Row(
//                   children: [
//                     Expanded(
//                         child: ElevatedButton(
//                           onPressed: details.onStepContinue,
//                           child: BigText(
//                             text: isLastStep ? 'Confirm' : 'Next',
//                             color: AppColors.cardColor,
//                           ),
//                         )),
//                     SizedBox(width: Dimension.width30),
//                     if (_activeStepIndex != 0)
//                       Expanded(
//                           child: ElevatedButton(
//                             onPressed: details.onStepCancel,
//                             child: const BigText(
//                               text: "Go Back",
//                               color: AppColors.cardColor,
//                             ),
//                           ))
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // validation form
//   String? validateText(String? value) {
//     if (value == null || value.isEmpty) {
//       return '*Required.';
//     }
//     return null;
//   }
//
//   bool isDetailsComplete() {
//     if (_activeStepIndex == 0) {
//       if (_PartNameController.text.isEmpty ||
//           _PartNumberController.text.isEmpty ||
//           _PartCostController.text.isEmpty ||
//           _ManufactureController.text.isEmpty ||
//           _SupplierController.text.isEmpty ||
//           _DescriptionController.text.isEmpty) {
//         return false;
//       } else {
//         return true;
//       }
//     } else if (_activeStepIndex == 1) {
//       if (_vehicleController.text.isEmpty ||
//           _laborController.text.isEmpty ||
//           _serviceCostController.text.isEmpty ||
//           _serviceDescController.text.isEmpty) {
//         return false;
//       } else {
//         return true;
//       }
//     }
//     return false;
//   }
// }
