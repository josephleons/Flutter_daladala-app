
// for signout button
//   onPressed: () async {
//     await FirebaseAuth.instance.signOut(
//     );
//     setState(() {
//
//     });
//   },


// For signout button

//   onPressed: () async {
//     await FirebaseAuth.instance.signOut(
//     );
//     setState(() {
//
//     });
//   },

//
// onPressed: () async {
// await FirebaseAuth.instance.createUserWithEmailAndPassword(
// email:_emailController.text,
// password: _passwordController.text,
// );
// setState(() {
//
// });
// },


//For anounce User
// title: Text("Logged ("+(user == null? 'out':'in')+')'),
// children: [
//   Padding(
//     padding: EdgeInsets.only(
//         top: Dimension.height10,
//         left: Dimension.width10,
//         right: Dimension.width10),
//     child: Slidable(
//       endActionPane: ActionPane(
//         motion: const StretchMotion(),
//         children: [
//           SlidableAction(
//             onPressed: ((context) {}),
//               // delete
//             backgroundColor: AppColors.deleteRed,
//             icon: Icons.delete,
//           ),
//         ],
//       ),
// startActionPane: ActionPane(
//   motion: const StretchMotion(),
//   children: [
//     SlidableAction(
//       flex: 5,
//       onPressed: ((context) {
//         // do something
//       }),
//       backgroundColor: AppColors.iconColor2,
//       icon: Icons.email,
//     ),
//     SlidableAction(
//       flex: 5,
//       onPressed: ((context) {
//         // do something
//       }),
//       backgroundColor: AppColors.iconColor2,
//       icon: Icons.phone,
//     ),
//   ],
// ),
// DropdownButtonFormField<String> (
// value:selectedValue,
// onChanged: (newVal){
// setState((){
// selectedValue = newVal.toString();
// });
// },
// items:<String>[
// 'option 1',
// ].map<DropdownMenuItem<String>>((String value){
// return DropdownMenuItem<String>(
// value: value,
// child:Text(value),
// );
// }).toList(),
// icon:const AppIcons(icon:LineAwesomeIcons.arrow_down,iconColor:AppColors.iconColor2,),
// dropdownColor:AppColors.cardColor,
// decoration:const InputDecoration(
// labelText:'Model',
// border:OutlineInputBorder(),
// ),
// validator: validateText,
// ),


// Dialog Box
// Future openDialog() => showDialog(
//   context:context,
//   builder:(context)=>SingleChildScrollView(
//     child: AlertDialog(
//       title:const Center(child: BigText(text:"Revenue Details")),
//       content:Column(
//         children: [
//           TextFormField(
//             // controller: _PartNameController,
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
//             // controller: _PartNameController,
//             decoration: const InputDecoration(
//               labelText: 'Model',
//             ),
//             validator: validateText,
//           ),
//           TextFormField(
//             // controller: _vehicleController,
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
//             // controller: _vehicleController,
//             decoration: const InputDecoration(
//               labelText: 'Owner Details',
//             ),
//             validator: validateText,
//           ),
//           SizedBox(
//             height: Dimension.height20,
//           ),
//           TextFormField(
//             // controller: _vehicleController,
//             decoration: const InputDecoration(
//               labelText: 'Amount',
//             ),
//             validator: validateText,
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//             onPressed:submit,
//             child: const BigText(text:"save")),
//       ],
//     ),
//   ),
// );