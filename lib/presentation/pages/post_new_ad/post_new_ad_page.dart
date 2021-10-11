import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:shay/constants/city_list.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/utils.dart';

import 'widgets/post_ad_package_page.dart';

class PostNewAdPage extends StatelessWidget {
  final String category;
  final String subCategory;
  PostNewAdPage({
    Key? key,
    required this.category,
    required this.subCategory,
  }) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final databaseController = Get.find<DatabaseController>();
    return WillPopScope(
      onWillPop: () async {
        databaseController.imagePickerImageList.value.clear();
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: screenType(context,
              mobile: MobileAppbar(
                title: 'Make New Ad',
              ),
              desktopTab: DesktopTabletAppbar()),
          body: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.all(ScreenConstants.devicePadding),
                padding: EdgeInsets.all(screenType(context,
                    mobile: 0, desktopTab: ScreenConstants.devicePadding)),
                decoration: BoxDecoration(
                    border: screenType(context,
                        mobile: null, desktopTab: Border.all())),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    screenType(
                      context,
                      mobile: SizedBox.shrink(),
                      desktopTab: Column(
                        children: [
                          Center(
                            child: Text(
                              'Make New Ad',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    formBuilderText(PostNewAdConstants.type + '*'),
                    FormBuilderChoiceChip(
                      visualDensity: VisualDensity.compact,
                      name: PostNewAdConstants.type,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(context),
                      decoration: formFieldDecoration,
                      spacing: 4.0,
                      runSpacing: -2.0,
                      options: PostNewAdConstants.typeList
                          .map(
                            (type) => FormBuilderFieldOption(
                              value: type,
                              child: Text(type),
                            ),
                          )
                          .toList(),
                    ),
                    formBuilderText(PostNewAdConstants.title + '*'),
                    FormBuilderTextField(
                      name: PostNewAdConstants.title,
                      maxLength: 70,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.min(context, 3),
                        FormBuilderValidators.required(context),
                      ]),
                      decoration: formFieldDecoration,
                    ),
                    formBuilderText(PostNewAdConstants.description + '*',
                        topPadding: 0),
                    FormBuilderTextField(
                      name: PostNewAdConstants.description,
                      minLines: 2,
                      maxLines: 12,
                      maxLength: 4046,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    formBuilderText(PostNewAdConstants.price + '*'),
                    FormBuilderTextField(
                        name: PostNewAdConstants.price,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.max(context, 100000000000),
                          FormBuilderValidators.integer(context),
                        ]),
                        decoration:
                            formFieldDecoration.copyWith(prefixText: 'Rs:')),
                    formBuilderText(PostNewAdConstants.mobileNumber + '*'),
                    FormBuilderTextField(
                        name: PostNewAdConstants.mobileNumber,
                        maxLength: 11,
                        initialValue: Get.find<UserController>()
                            .currentUserStream
                            .mobileNumber,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.integer(context),
                          FormBuilderValidators.maxLength(context, 11),
                          FormBuilderValidators.minLength(context, 11),
                        ]),
                        decoration: formFieldDecoration),
                    formBuilderText(PostNewAdConstants.itemCondition + '*',
                        topPadding: 0),
                    FormBuilderChoiceChip(
                      name: PostNewAdConstants.itemCondition,
                      visualDensity: VisualDensity.compact,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(context),
                      decoration: formFieldDecoration,
                      spacing: 6.0,
                      runSpacing: 6.0,
                      options: [
                        FormBuilderFieldOption(
                          value: 'New',
                          child: Text('New'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Used',
                          child: Text('Used'),
                        ),
                      ],
                    ),
                    formBuilderText(PostNewAdConstants.city + '*'),
                    FormBuilderDropdown(
                        hint: Text('Select city'),
                        items: CityList.citylist
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        name: PostNewAdConstants.city,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.required(context),
                        decoration: formFieldDecoration),
                    formBuilderText(PostNewAdConstants.videoUrl),
                    FormBuilderTextField(
                      name: PostNewAdConstants.videoUrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: formFieldDecoration,
                    ),
                    formBuilderText(PostNewAdConstants.photos + '*'),
                    Obx(
                      () => InkWell(
                        onTap: databaseController
                                .imagePickerImageList.value.isEmpty
                            ? () => databaseController.pickPostNewAdImages()
                            : null,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: databaseController
                                      .imagePickerImageList.value.isEmpty
                                  ? Colors.green
                                  : Colors.grey.shade200),
                          child: databaseController
                                  .imagePickerImageList.value.isEmpty
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_a_photo_outlined,
                                        color: Colors.white),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Ads images',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () => databaseController
                                          .pickPostNewAdImages(),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        height: 35,
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            formBuilderText(
                                                'Upload upto 8 images'),
                                            Icon(Icons.chevron_right)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.only(left: 8.0),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: databaseController
                                            .imagePickerImageList.value.length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                          onTap: () {
                                            Get.bottomSheet(
                                                Wrap(
                                                  children: [
                                                    ListTile(
                                                      title: Text('Delete'),
                                                      onTap: () {
                                                        Get.back();
                                                        databaseController
                                                            .imagePickerImageList
                                                            .update((val) {
                                                          val!.removeAt(index);
                                                        });
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text('Cancel'),
                                                      onTap: () => Get.back(),
                                                    ),
                                                  ],
                                                ),
                                                backgroundColor: Theme.of(
                                                        context)
                                                    .scaffoldBackgroundColor);
                                          },
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            clipBehavior: Clip.hardEdge,
                                            child: GetPlatform.isWeb
                                                ? Image.network(
                                                    databaseController
                                                        .imagePickerImageList
                                                        .value[index]
                                                        .path,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.file(
                                                    File(
                                                      databaseController
                                                          .imagePickerImageList
                                                          .value[index]
                                                          .path,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 10, right: 10, left: 10),
                                      height: 35,
                                      width: double.infinity,
                                      color: Colors.grey.shade200,
                                      child: Text(
                                        'Tap on images to delete them',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: _postNewAdButton, child: Text(' Next')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _postNewAdButton() async {
    if (_formKey.currentState!.validate()) {
      if (Get.find<DatabaseController>().imagePickerImageList.value.isEmpty) {
        BotToast.showText(text: "Pick Atleast one image");
      } else {
        AdModel model = AdModel(
            category: category,
            type: _formKey.currentState!.fields[PostNewAdConstants.type]!.value,
            title:
                _formKey.currentState!.fields[PostNewAdConstants.title]!.value,
            description: _formKey
                .currentState!.fields[PostNewAdConstants.description]!.value,
            price:
                _formKey.currentState!.fields[PostNewAdConstants.price]!.value,
            mobileNumber: _formKey
                .currentState!.fields[PostNewAdConstants.mobileNumber]!.value,
            itemCondition: _formKey
                .currentState!.fields[PostNewAdConstants.itemCondition]!.value,
            city: _formKey.currentState!.fields[PostNewAdConstants.city]!.value,
            subCategory: subCategory,
            videoUrl: _formKey
                .currentState?.fields[PostNewAdConstants.videoUrl]?.value);

        Get.to(() => PostAdPackagePage(
              model: model,
            ));
      }
    }

    //   if (_formKey.currentState!.validate()) {
    //     if (Get.find<DatabaseController>().imagePickerImageList.value.isEmpty) {
    //       Get.snackbar('Image not picked', 'Pick Atleast one image');
    //       return;
    //     } else {
    //       AdModel model = AdModel(
    //           category: _formKey
    //               .currentState!.fields[PostNewAdConstants.category]!.value,
    //           type: _formKey.currentState!.fields[PostNewAdConstants.type]!.value,
    //           title:
    //               _formKey.currentState!.fields[PostNewAdConstants.title]!.value,
    //           description: _formKey
    //               .currentState!.fields[PostNewAdConstants.description]!.value,
    //           price:
    //               _formKey.currentState!.fields[PostNewAdConstants.price]!.value,
    //           mobileNumber: _formKey
    //               .currentState!.fields[PostNewAdConstants.mobileNumber]!.value,
    //           itemCondition: _formKey
    //               .currentState!.fields[PostNewAdConstants.itemCondition]!.value,
    //           city: _formKey.currentState!.fields[PostNewAdConstants.city]!.value,
    //           subCategory: _formKey
    //               .currentState?.fields[PostNewAdConstants.subCategory]?.value,
    //           videoUrl: _formKey
    //               .currentState?.fields[PostNewAdConstants.videoUrl]?.value);
    //       Get.back();
    //       await Get.find<DatabaseController>().postNewAdd(model);
    //     }
    //   }
    // }
  }
}
