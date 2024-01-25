import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:noble_vintage/controller/product_controller.dart';
import 'package:noble_vintage/model/product_model/add_product_model.dart';
import 'package:noble_vintage/model/product_model/get_categories_model.dart';
import 'package:noble_vintage/widgets/app_dialogs.dart';
import 'package:noble_vintage/widgets/custom_widgets.dart';

import '../../controller/user_controller.dart';
import '../../utils/constants.dart';
import '../../widgets/add_product_fields.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/default_widget.dart';
import '../../widgets/icon_text.dart';

class AddProduct extends StatefulWidget {
  final VoidCallback onProductAdded;
  const AddProduct({
    super.key,
    required this.onProductAdded,
  });

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> with TickerProviderStateMixin {
  final productController = Get.put(ProductController());
  final userController = Get.find<UserController>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();
  TextEditingController estimatedAmountController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? purchaseDate;
  bool productSelected = false;
  List<XFile> productImages = [];
  List<PlatformFile> certificates = [];
  Data? selectedProductType;
  bool financeWitIt = false;
  int selectedPage = 0;
  late List<Data> categories;

  Future<void> _financeWithItDialog() async {
    if (_formKey.currentState?.validate() ?? false) {
      AppDialogs.showConfirmDialog(
        dialogTitle: 'Confirm',
        label: 'Confirm',
        secondaryLabel: 'Cancel',
        onConfirm: () {
          addProduct();
        },
        onSecondaryTap: () => Get.back(),
      );
    }
  }

  Future<void> addProduct() async {
    try {
      productController.buttonLoading.value = true;
      AddProductModel? response = await productController.addProduct(
        productImages,
        certificates,
        titleController.text,
        descriptionController.text,
        serialNumberController.text,
        purchaseDate!,
        double.parse(estimatedAmountController.text),
        0,
        financeWitIt,
        selectedProductType!.id!,
      );
      productController.buttonLoading.value = false;
      if (response?.status != 200) {
        productController.buttonLoading.value = false;
        throw Exception(response?.message ?? 'Something went wrong!');
      }

      userController.selectedPage.value = 2;
      widget.onProductAdded();
      customToast(response!.message);
    } catch (e) {
      productController.buttonLoading.value = false;
      customToast(e.toString());
      print(e.toString());
    }
  }

  Future<void> pickSingleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      certificates.addAll(result.files);
      setState(() {});
    }
  }

  Future<void> _showDatePicker1() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
        print('date:${purchaseDate = pickedDate}');
        purchaseDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    categories = productController.categories
      ..removeWhere(
        (element) => element.name == 'All',
      );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultWidget(
      showBackIcon: false,
      blueRatio: 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => productController.loading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Product Category *',
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

                                  child: DropdownButton<Data>(
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
                                    dropdownColor:
                                        Constants.backgroundContColor,
                                    iconEnabledColor: Colors.white,
                                    items: List.generate(
                                      categories.length,
                                      (index) {
                                        return DropdownMenuItem(
                                          value: categories[index],
                                          child: Text(
                                            categories[index].name ?? '',
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
                                  textCapitalization: TextCapitalization.words,
                                  controller: titleController,
                                  text: 'Product Title',
                                  hintText: 'Enter Title',
                                  validatorCondition: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your product title';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AddProductFields(
                                  mandatory: false,
                                  textCapitalization: TextCapitalization.words,
                                  controller: descriptionController,
                                  text: 'Description',
                                  hintText: 'Enter Description',
                                  maxLines: 3,
                                  // validatorCondition: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Please enter your description';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AddProductFields(
                                  controller: serialNumberController,
                                  mandatory: false,
                                  text: 'Serial Number',
                                  hintText: 'Enter Serial Number',
                                  // validatorCondition: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Please enter your serial number';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AddProductFields(
                                  controller: estimatedAmountController,
                                  text: 'Selling Price',
                                  hintText: 'Enter Selling Price',
                                  textInputType: TextInputType.number,
                                  validatorCondition: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your estimated amount';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Certificate/Documents',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                          ),
                                        ),
                                        if (certificates.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
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
                                        height: certificates.isEmpty
                                            ? Get.height * 0.07
                                            : null,
                                        decoration: BoxDecoration(
                                          color: Constants.backgroundContColor,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5,
                                          ),
                                          child: certificates.isNotEmpty
                                              ? Column(
                                                  children: List.generate(
                                                      certificates.length,
                                                      (index) {
                                                    final file =
                                                        certificates[index];
                                                    return _buildFileName(file,
                                                        (deletedFile) {
                                                      setState(() {
                                                        certificates.remove(
                                                            deletedFile);
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
                                      'Purchase Date *',
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
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                                purchaseDate != null
                                                    ? DateFormat(
                                                        'dd-MM-yyyy',
                                                      ).format(
                                                        purchaseDate!,
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
                                      'Product Image *',
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
                                      itemCount: productImages.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index < productImages.length) {
                                          return uploadCategory(
                                              productImages[index], index);
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
                                  child: RoundedElevatedButton(
                                    loading:
                                        productController.buttonLoading.value,
                                    onPressed: () {
                                      if (selectedProductType == null) {
                                        customToast('Please select category');
                                        // } else if (certificates.isEmpty) {
                                        //   customToast(
                                        //       'Please upload certificates');
                                      } else if (purchaseDate == null) {
                                        customToast(
                                            'Please select purchased date');
                                      } else if (productImages.isEmpty) {
                                        customToast(
                                            'Please upload product images');
                                      } else {
                                        _financeWithItDialog();
                                      }
                                    },
                                    text: 'Submit',
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
                    ),
                  ],
                ),
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
      productImages.add(pickedImage);
      setState(() {});
    }
    // if (pickedImage != null) {
    //   XFile compressedImage = await compressImage(pickedImage);
    //
    //   productImages.add(compressedImage);
    //   setState(() {});
    // }
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
                      productImages.removeAt(index);
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
