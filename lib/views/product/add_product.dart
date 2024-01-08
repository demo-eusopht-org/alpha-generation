import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:noble_vintage/views/product/view_selected_file.dart';
import 'package:noble_vintage/widgets/app_dialogs.dart';
import 'package:noble_vintage/widgets/bottom_Navigation.dart';
import 'package:noble_vintage/widgets/default_widget.dart';

import '../../utils/constants.dart';
import '../../widgets/add_product_fields.dart';
import '../../widgets/icon_text.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  DateTime? selectedDate;
  List<String> selectedValues = [];
  bool productSelected = false;
  ProductItem? selectedProductItem;
  List<XFile> images = [];
  PlatformFile? file;
  String? fileName;
  String? filePath;
  Future<void> pickSingleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        fileName = file.name;
        filePath = file.path;
      });

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      // navigateToNewPage();
    } else {}
  }

  void navigateToNewPage() {
    if (filePath != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewSelectedFile(filePath: filePath!),
        ),
      );
    } else {}
  }

  Future<void> _showDatePicker1() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now().add(Duration(days: 730)));

    if (pickedDate != null) {
      setState(() {
        print('date:${selectedDate = pickedDate}');
        selectedDate = pickedDate;
      });
    }
  }

  List<String> variantsList = [
    'Leather Products',
    "Watches",
  ];
  @override
  Widget build(BuildContext context) {
    List<String> selectedCheckBoxValue = [];
    return DefaultWidget(
      blueRatio: 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            topContainer(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[0],
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  // height: Get.height,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        padding: const EdgeInsets.all(20),
                        child: DropDownMultiSelect(
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.onPrimary,
                            focusColor: Theme.of(context).colorScheme.onPrimary,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                          ),
                          options: variantsList,
                          selectedValues: selectedValues,
                          // selectedProductItem != null
                          //     ? [selectedProductItem!]
                          //     : [],
                          // onChanged: (List<ProductItem> newList) {
                          //   log('NAMES: ${newList}');
                          //   if (newList.isNotEmpty) {
                          //     selectedProductItem = newList.first;
                          //     newList.clear();
                          //     setState(() {});
                          //   }
                          // },
                          onChanged: (List<String> selectedList) {
                            setState(() {
                              if (selectedList.isNotEmpty) {
                                selectedValues = [
                                  selectedList[0]
                                ]; // Update selected value
                              } else {
                                selectedValues.clear();
                              }
                            });
                            print("$selectedValues");
                          },
                          whenEmpty: 'Select Category',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddProductFields(
                            text: 'Product Title',
                            hintText: 'Enter',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AddProductFields(
                            text: 'Description',
                            hintText: 'Enter',
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AddProductFields(
                            text: 'Serial Number',
                            hintText: 'Enter',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Purchase Date:',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await _showDatePicker1();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Constants.showDateContColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                selectedDate != null
                                                    ? DateFormat(
                                                        'dd-MM-yyyy',
                                                      ).format(
                                                        selectedDate!,
                                                      )
                                                    : 'Enter Date',
                                              ),
                                              Icon(
                                                Icons.calendar_month,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Certificate/Documents',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await pickSingleFile();
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Constants.showDateContColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 120,
                                                child: Text(
                                                  fileName ?? 'Upload',
                                                ),
                                              ),
                                              Icon(
                                                Icons.add,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        children: [
                          ...images.map(
                            (image) => uploadCategory(image),
                          ),
                          uploadCategory(null),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.backgroundContColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          AppDialogs.showConfirmDialog(
                            dialogTitle: 'Finance With It',
                            label: 'Finance with it',
                            secondaryLabel: 'Cancel',
                            onConfirm: () {
                              Get.offAll(
                                () => MainScreen(),
                              );
                            },
                            onSecondaryTap: () => Get.back(),
                          );
                        },
                        child: Text(
                          'Submit',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    await AppDialogs.showConfirmDialog(
      dialogTitle: 'Select',
      label: 'Gallery',
      secondaryLabel: 'Camera',
      onConfirm: () {
        _selectedImageUsingSource(ImageSource.gallery);
      },
      onSecondaryTap: () {
        Get.back();
        _selectedImageUsingSource(ImageSource.camera);
      },
    );
  }

  Future<void> _selectedImageUsingSource(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      images.add(pickedImage);
      setState(() {});
    }
  }

  Container uploadCategory(XFile? file) {
    return Container(
      height: Get.height * 0.18,
      width: Get.width * 0.3,
      decoration: BoxDecoration(
        color: Constants.backgroundContColor,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: _pickImage,
        child: file != null
            ? Image.file(
                File(file.path),
                fit: BoxFit.cover,
              ) // Show selected image if available
            : Icon(
                Icons.add,
                color: Constants.splashTextColor,
                size: 40,
              ),
      ),
    );
  }

  Container topContainer() {
    return Container(
      width: double.infinity,
      color: Constants.backgroundContColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // // Row(
            // //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // //   crossAxisAlignment: CrossAxisAlignment.start,
            // //   children: [
            // //     // InkWell(
            // //     //   onTap: () {
            // //     //   Navigator.pop(context);
            // //     //   },
            // //     //   child: Image.asset(
            // //     //     'assets/images/back_arrow.png',
            // //     //   ),
            // //     // ),
            // //   ],
            // ),
            Text(
              'Add Product ',
              style: TextStyle(
                color: Constants.splashTextColor,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            buildUploadIcon(),
          ],
        ),
      ),
    );
  }

  Widget buildUploadIcon() {
    return IconText(
      text: '',
      icon: Icons.camera_alt,
      onTap: () {},
    );
  }

  Widget buildListIcon() {
    return IconText(
      icon: Icons.arrow_back_ios,
      text: '',
      onTap: () {},
    );
  }
}

enum ProductItem {
  leatherProduct,
  watches,
}
