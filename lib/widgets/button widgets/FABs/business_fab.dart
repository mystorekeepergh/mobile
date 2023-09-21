import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/OrganizationCard.dart';
import '../../model/OrganizationDataProvider.dart';
import '../secondary_button.dart';

class BusinessFAB extends StatefulWidget {
  const BusinessFAB({super.key});

  @override
  State<BusinessFAB> createState() => _BusinessFABState();
}

class _BusinessFABState extends State<BusinessFAB> {
  @override
  Widget build(BuildContext context) {
    //String? selectedValue; // Variable to store the selected value
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    List<String> locationOptions = ['Location', 'Ghana, Accra, Spintex', 'Ghana, Kumasi, Titus'];
    String? selectedValue = 'Location';

    List<String> selectOrgainization = ['Select Orgainization', 'A and K Ventures', 'Beatthem Cool Store'];
    String? organizationSelected = 'Select Orgainization';

    void handleSubmit() {
      final String orgName = nameController.text;
      final String orgLocation = selectedValue ?? " ";
      final String orgSelected = organizationSelected ?? " ";
      final String orgDescription = descriptionController.text;
      final String ids = UniqueKey().toString();

      
      final BusinessCard newBusinessCard = BusinessCard(
        id: ids,
        name: orgName,
        location: orgLocation,
        selectedOrganization: orgSelected,
        description: orgDescription, 
      );

      final businessDataProvider =
          Provider.of<BusinessDataProvider>(context, listen: false);
      businessDataProvider.addBusiness(newBusinessCard);

      Navigator.pop(context);
    }

    double size = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      heightFactor: 0.80,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Business',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.cancel_outlined)),
                ],
              ),
              SizedBox(height: size * 0.02),
              const Text(
                'Create your own Business here',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size * 0.05),
              const Text(
                'Business Name',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size * 0.02),
              //---------------------------------------------
              // Business Name
              //----------------------------------------------
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 7.2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: size * 0.05),
              //---------------------------------------------
              // Business Location
              //----------------------------------------------
              const Text(
                'Location',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 7.2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Location',
                      contentPadding: EdgeInsets.zero,
                    ),
                    items: locationOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value changes here

                      selectedValue = newValue;
                    },
                    // Set an initial value if needed
                    value: selectedValue,
                  ),
                ),
              ),
              SizedBox(height: size * 0.05),
              //--------------------------
              // Select orgainization
              // -------------------------
              const Text(
                'Select Orgainization',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 7.2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Location',
                      contentPadding: EdgeInsets.zero,
                    ),
                    items: selectOrgainization
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value changes here

                      organizationSelected = newValue;
                    },
                    // Set an initial value if needed
                    value: organizationSelected,
                  ),
                ),
              ),
              //-------------------------
              // Business Desc
              //--------------------------
              SizedBox(height: size * 0.05),
              const Text(
                'Description',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 7.2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description...',
                    ),
                  ),
                ),
              ),
              SizedBox(height: size * 0.02),
              SecondaryButton(buttonName: 'Submit', onPress: handleSubmit, color: const Color(0xFF1D4771),)
            ],
          ),
        ),
      ),
    );
  }
}
