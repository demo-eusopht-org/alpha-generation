import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:noble_vintage/model/enums/product_type_enum.dart';
import 'package:noble_vintage/widgets/app_dialogs.dart';

import '../../utils/constants.dart';
import '../../widgets/add_product_fields.dart';
import '../../widgets/bottom_Navigation.dart';
import '../../widgets/default_widget.dart';
import '../../widgets/icon_text.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  DateTime? selectedDate;
  bool productSelected = false;
  List<XFile> images = [];
  List<PlatformFile> files = [];
  ProductType? selectedProductType;

  Future<void> pickSingleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      files.addAll(result.files);
      setState(() {});
    }
  }

  Future<void> _showDatePicker1() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(Duration(days: 730)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            hintColor: Colors.black,
            colorScheme: ColorScheme.light(
              primary: Constants.backgroundContColor,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        print('date:${selectedDate = pickedDate}');
        selectedDate = pickedDate;
      });
    }
  }

  List<ProductType> types = List.of(ProductType.values);
  @override
  Widget build(BuildContext context) {
    types.remove(ProductType.all);

    return DefaultWidget(
      showBackIcon: false,
      blueRatio: 0.3,
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
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Product Category',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Constants.backgroundContColor,
                        ),

                        child: DropdownButton<ProductType>(
                          underline: SizedBox.shrink(),
                          hint: Text(
                            'Select Category',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                            ),
                          ),
                          value: selectedProductType,
                          isExpanded: true,
                          onChanged: (value) {
                            selectedProductType = value;
                            setState(() {});
                          },
                          dropdownColor: Constants.backgroundContColor,
                          iconEnabledColor: Colors.white,
                          items: List.generate(
                            types.length,
                            (index) {
                              return DropdownMenuItem(
                                value: types[index],
                                child: Text(
                                  types[index].getLabel(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),

                          // hintText: 'Select Category',
                          // trailingIcon: Icon(
                          //   Icons.arrow_drop_down,
                          //   color: Colors.red,
                          // ),
                          // inputDecorationTheme: InputDecorationTheme(
                          //     border: OutlineInputBorder(
                          //         borderSide: BorderSide.none)),
                        ),

                        // child: DropDownMultiSelect(
                        //   decoration: InputDecoration(
                        //     fillColor: Theme.of(context).colorScheme.onPrimary,
                        //     focusColor: Theme.of(context).colorScheme.onPrimary,
                        //     enabledBorder: const OutlineInputBorder(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(4),
                        //       ),
                        //       borderSide: BorderSide(
                        //         color: Colors.grey,
                        //         width: 1.5,
                        //       ),
                        //     ),
                        //   ),
                        //   options: variantsList,
                        //   selectedValues: selectedValues,
                        //   // selectedProductItem != null
                        //   //     ? [selectedProductItem!]
                        //   //     : [],
                        //   // onChanged: (List<ProductItem> newList) {
                        //   //   log('NAMES: ${newList}');
                        //   //   if (newList.isNotEmpty) {
                        //   //     selectedProductItem = newList.first;
                        //   //     newList.clear();
                        //   //     setState(() {});
                        //   //   }
                        //   // },
                        //   onChanged: (List<String> selectedList) {
                        //     setState(() {
                        //       if (selectedList.isNotEmpty) {
                        //         selectedValues = [
                        //           selectedList[0]
                        //         ]; // Update selected value
                        //       } else {
                        //         selectedValues.clear();
                        //       }
                        //     });
                        //     print("$selectedValues");
                        //   },
                        //   whenEmpty: 'Select Category',
                        // ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AddProductFields(
                        text: 'Product Title',
                        hintText: 'Enter Title',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AddProductFields(
                        text: 'Description',
                        hintText: 'Enter Description',
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AddProductFields(
                        text: 'Serial Number',
                        hintText: 'Enter Serial Number',
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AddProductFields(
                        text: 'Estimated Amount',
                        hintText: 'Enter Estimated Amount',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Certificate/Documents',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              if (files.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    onTap: () {
                                      pickSingleFile();
                                    },
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              await pickSingleFile();
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: Get.height * 0.07,
                              ),
                              alignment: Alignment.center,
                              height: files.isEmpty ? Get.height * 0.07 : null,
                              decoration: BoxDecoration(
                                color: Constants.backgroundContColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5,
                                  bottom: 5,
                                ),
                                child: files.isNotEmpty
                                    ? Column(
                                        children: List.generate(files.length,
                                            (index) {
                                          final file = files[index];
                                          return _buildFileName(file,
                                              (deletedFile) {
                                            setState(() {
                                              files.remove(deletedFile);
                                            });
                                          });
                                        }),
                                      )
                                    : _buildFileName(null, (_) {}),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Purchase Date',
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
                              height: Get.height * 0.07,
                              decoration: BoxDecoration(
                                color: Constants.backgroundContColor,
                                borderRadius: BorderRadius.circular(6),
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
                                      style: GoogleFonts.inter(
                                        color: Colors.grey.shade400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Image',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.95,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: images.length + 1,
                            itemBuilder: (context, index) {
                              if (index < images.length) {
                                return uploadCategory(images[index], index);
                              } else {
                                return uploadCategory(null, index);
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.06,
                        child: ElevatedButton(
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
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
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

  Widget _buildFileName(PlatformFile? file, Function(PlatformFile) onDelete) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              file?.name ?? 'Upload',
              style: GoogleFonts.inter(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (file != null) {
                onDelete(file);
              }
            },
            child: Icon(
              file != null ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
        ],
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

  Widget uploadCategory(XFile? file, int index) {
    return GestureDetector(
      onTap: () {
        if (file == null) {
          _pickImage();
        }
      },
      child: Container(
        height: Get.height * 0.18,
        width: Get.width * 0.3,
        decoration: BoxDecoration(
          color: Constants.backgroundContColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            if (file != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.file(
                  File(file.path),
                  fit: BoxFit.cover,
                ),
              )
            else
              Center(
                child: Icon(
                  Icons.add,
                  color: Constants.splashTextColor,
                  size: 40,
                ),
              ),
            if (file != null)
              Positioned(
                top: -8,
                right: -8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Constants.backgroundContColor,
                    radius: 15,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Container topContainer() {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.15,
      width: double.infinity,
      // color: Constants.backgroundContColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            'Add Product',
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Constants.splashTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 10,
          ),
          // Icon(
          //   Icons.camera_alt,
          //   color: Colors.white,
          //   size: 35,
          // ),
        ],
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
