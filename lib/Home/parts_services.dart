import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/util/dimension.dart';
import '../util/colors.dart';
import '../widgets/appIconWidgets.dart';

class PartsService extends StatefulWidget {
  const PartsService({Key? key}) : super(key: key);

  @override
  State<PartsService> createState() => _PartsServiceState();
}

class _PartsServiceState extends State<PartsService> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // _activeStept 0
  final _PartNameController = TextEditingController();
  final _PartNumberController = TextEditingController();
  final _PartCostController = TextEditingController();
  final _ManufactureController = TextEditingController();
  final _SupplierController = TextEditingController();
  final _DescriptionController = TextEditingController();

  // _activeStep 1
  final _vehicleController = TextEditingController();
  final _laborController = TextEditingController();
  final _serviceNameController = TextEditingController();
  final _serviceCostController = TextEditingController();
  final _serviceDescController = TextEditingController();
  final _uploadController = TextEditingController();
  bool isComplete = false;

  int _activeStepIndex = 0;
  // Widget screen
  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const BigText(text: 'Parts'),
          content: Column(
            children: [
              //choose vehicles
              TextFormField(
                controller: _PartNameController,
                decoration: const InputDecoration(
                  labelText: 'Parts Name',
                ),
                validator: validateText,
              ),
              // labor cost
              SizedBox(
                height: Dimension.height20,
              ),
              TextFormField(
                controller: _PartNumberController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Parts Number',
                ),
                validator:validateText,
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              // // PartService cost
              TextFormField(
                controller: _PartCostController,
                decoration: const InputDecoration(
                  labelText: 'Part Cost ',
                ),
                validator: validateText,
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              // // Description
             TextFormField(
                controller: _ManufactureController,
                decoration: const InputDecoration(
                  labelText: 'Manufacture',
                ),
               validator:validateText,
              ),
              SizedBox(height: Dimension.height20),
              // // supplier
              TextFormField(
                controller: _SupplierController,
                decoration: const InputDecoration(
                    labelText: "Suppliers"),
              validator: validateText,
              ),

              SizedBox(height: Dimension.height20),
              // // parts cost
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  border: Border.all(color: const Color(0xff2AA389)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Dimension.width10),
                      child:  TextFormField(
                        controller: _DescriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: "Description",
                        ),
                        validator: validateText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimension.height20),
              // Next button
            ],
          ),
        ),
    // Service Stepper
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const BigText(text: 'Service'),
          content: Column(
            children: [
              //choose vehicles
              TextFormField(
                controller: _vehicleController,
                decoration: const InputDecoration(
                  labelText: 'Choose Vehicle',
                ),
                validator: validateText,
              ),
              // labor cost
              SizedBox(
                height: Dimension.height20,
              ),
              TextFormField(
                controller: _laborController,
                decoration: const InputDecoration(
                  labelText: 'Labor Cost',
                ),
                validator: validateText,
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              // // PartService cost
              TextFormField(
                controller: _serviceCostController,
                decoration: const InputDecoration(
                  labelText: "Service Cost",
                ),
                validator: validateText,
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              // // parts cost
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  border: Border.all(color: const Color(0xff2AA389)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Dimension.width10),
                      child: TextFormField(
                        controller: _serviceDescController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: "Description",
                        ),
                        validator: validateText,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimension.width10,
                    right: Dimension.width10,
                    top: Dimension.height10),
                child: Row(
                  children: const [
                    BigText(text: "Photo"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: Dimension.width10,
                    right: Dimension.width10,
                    top: Dimension.height10),
                child: Center(
                  child: Column(
                    children: [
                      const AppIcons(icon: Icons.camera_alt_rounded),
                      SizedBox(
                        height: Dimension.height10,
                      ),
                      const BigText(text: "Take Image"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Dimension.height20),
            ],
          ),
        ),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const BigText(text: 'Confirm'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                    child: BigText(
                        text: "Parts required:", color: AppColors.iconColor2)),
                SizedBox(
                  height: Dimension.height20,
                ),
                const BigText(text: "Part Name :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Part Number :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Cost :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Manufacture :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Description :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const Center(
                    child: BigText(
                        text: "Service required:",
                        color: AppColors.iconColor2)),
                SizedBox(
                  height: Dimension.height20,
                ),
                const BigText(text: "Vehicle :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Labor Cost :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Service Cost :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Manufacture :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Supplier :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Noted For :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height10,
                ),
                const BigText(text: "Upload image :", color: AppColors.textColor),
                SizedBox(
                  height: Dimension.height45,
                ),
                const Center(
                    child: BigText(
                        text: "Total Cost:", color: AppColors.iconColor1)),
              ],
            )),
          ];
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const BigText(
            text: "Services",
            color: AppColors.cardColor,
          ),
          backgroundColor: AppColors.defaulColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        backgroundColor: AppColors.background,

        // body
        body: Theme(
          data: Theme.of(context)
              .copyWith(colorScheme: const ColorScheme.light(primary: Colors.teal)),
          child: Form(
            key: _key,
            child: Stepper(
              type: StepperType.horizontal,
              steps: stepList(),
              currentStep: _activeStepIndex,
              onStepTapped: (step){
                _key.currentState!.validate();
                setState(() {
                  _activeStepIndex = step;
                });
              },
              onStepContinue: () {
                final isLastStep = _activeStepIndex == stepList().length - 1;
                _key.currentState?.validate();
                bool isDetailValid = isDetailsComplete();//this will check on Ok move to next
                if(isDetailValid){
                  if (isLastStep) {
                    setState(() => isComplete = true);
                  }else{
                    setState(() => _activeStepIndex += 1);
                  }
                }
              },
              onStepCancel: () {
                if (_activeStepIndex == 0) {
                  return;
                }else{
                  setState(() {
                    _activeStepIndex -= 1;
                  });
                }
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = _activeStepIndex == stepList().length - 1;
                return Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: BigText(
                        text: isLastStep ? 'Confirm' : 'Next',
                        color: AppColors.cardColor,
                      ),
                    )),
                    SizedBox(width: Dimension.width30),
                    if (_activeStepIndex != 0)
                      Expanded(
                          child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const BigText(
                          text: "Back",
                          color: AppColors.cardColor,
                        ),
                      ))
                  ],
                );
              },
            ),
//
          ),
        ),
      ),
    );
  }

  // validation form
  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required.';
    }
    return null;
  }

  bool isDetailsComplete(){
    if(_activeStepIndex == 0){
      if(_PartNameController.text.isEmpty||_PartNumberController.text.isEmpty
          ||_PartCostController.text.isEmpty||_ManufactureController.text.isEmpty
          ||_SupplierController.text.isEmpty||_DescriptionController.text.isEmpty) {
         return false;
      }else{
        return true;
      }

  }else if(_activeStepIndex == 1){
     if(_vehicleController.text.isEmpty||_laborController.text.isEmpty
         ||_serviceCostController.text.isEmpty||_serviceDescController.text.isEmpty){
       return false;
     }else{
       return true;
     }
    }
    return false;
  }
}
