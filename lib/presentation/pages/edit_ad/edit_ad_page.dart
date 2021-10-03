import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/utils.dart';

// ignore: must_be_immutable
class EditAdPage extends StatelessWidget {
  static const routeName = 'editad';
  EditAdPage({Key? key}) : super(key: key);
  final databaseController = Get.find<DatabaseController>();
  final _userController = Get.find<UserController>();
  final _formKey = GlobalKey<FormBuilderState>();
  Rx<List<String>> subCategory = Rx<List<String>>([]);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: screenType(context,
            mobile: MobileAppbar(
              title: 'Edit Ad',
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
                  formBuilderText(PostNewAdConstants.category),
                  FormBuilderDropdown(
                    name: PostNewAdConstants.category,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(context),
                    hint: Text('Choose Category'),
                    onChanged: (value) {
                      _formKey
                          .currentState?.fields[PostNewAdConstants.subCategory]
                          ?.reset();
                      subCategory(PostNewAdConstants.categoryMap[value]);
                    },
                    isDense: true,
                    decoration: formFieldDecoration,
                    items: PostNewAdConstants.categoryMap.entries
                        .map(
                          (category) => DropdownMenuItem(
                            value: category.key,
                            child: Text(category.key),
                          ),
                        )
                        .toList(),
                  ),
                  Obx(
                    () => subCategory.value.isEmpty
                        ? SizedBox.shrink()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              formBuilderText(PostNewAdConstants.subCategory),
                              FormBuilderDropdown(
                                  name: PostNewAdConstants.subCategory,
                                  hint: Text('Choose  Subcategory'),
                                  validator:
                                      FormBuilderValidators.required(context),
                                  isDense: true,
                                  decoration: formFieldDecoration,
                                  items: subCategory.value
                                      .map((e) => DropdownMenuItem(
                                          value: e, child: Text(e)))
                                      .toList()),
                            ],
                          ),
                  ),
                  formBuilderText(PostNewAdConstants.type),
                  FormBuilderChoiceChip(
                    visualDensity: VisualDensity.compact,
                    name: PostNewAdConstants.type,
                    initialValue: _userController.allAds[args].type,
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
                  formBuilderText(PostNewAdConstants.title),
                  FormBuilderTextField(
                    name: PostNewAdConstants.title,
                    initialValue: _userController.allAds[args].title,
                    maxLength: 70,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.min(context, 3),
                      FormBuilderValidators.required(context),
                    ]),
                    decoration: formFieldDecoration,
                  ),
                  formBuilderText(PostNewAdConstants.description,
                      topPadding: 0),
                  FormBuilderTextField(
                    name: PostNewAdConstants.description,
                    initialValue: _userController.allAds[args].description,
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
                  formBuilderText(PostNewAdConstants.price),
                  FormBuilderTextField(
                      name: PostNewAdConstants.price,
                      initialValue: _userController.allAds[args].price,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.max(context, 100000000000),
                        FormBuilderValidators.integer(context),
                      ]),
                      decoration:
                          formFieldDecoration.copyWith(prefixText: 'Rs:')),
                  formBuilderText(PostNewAdConstants.mobileNumber),
                  FormBuilderTextField(
                      name: PostNewAdConstants.mobileNumber,
                      initialValue: _userController.allAds[args].mobileNumber,
                      maxLength: 11,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.integer(context),
                        FormBuilderValidators.maxLength(context, 11),
                        FormBuilderValidators.minLength(context, 11),
                      ]),
                      decoration: formFieldDecoration),
                  formBuilderText(PostNewAdConstants.itemCondition,
                      topPadding: 0),
                  FormBuilderChoiceChip(
                    name: PostNewAdConstants.itemCondition,
                    initialValue: _userController.allAds[args].itemCondition,
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
                  formBuilderText(PostNewAdConstants.city),
                  FormBuilderTextField(
                      name: PostNewAdConstants.city,
                      initialValue: _userController.allAds[args].city,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(context),
                      decoration: formFieldDecoration),
                  formBuilderText(PostNewAdConstants.videoUrl),
                  FormBuilderTextField(
                    name: PostNewAdConstants.videoUrl,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: formFieldDecoration,
                  ),
                  formBuilderText(PostNewAdConstants.photos),
                  Obx(
                    () => Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  AdModel model = AdModel(
                                      docId: _userController.allAds[args].docId,
                                      photos:
                                          _userController.allAds[args].photos);
                                  await databaseController
                                      .updatePostPictures(model);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 35,
                                  color: Colors.grey.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      formBuilderText('Upload upto 8 images'),
                                      Icon(Icons.chevron_right)
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.only(left: 8.0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _userController
                                      .allAds[args].photos!.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Get.bottomSheet(
                                          Wrap(
                                            children: [
                                              ListTile(
                                                title: Text('Delete'),
                                                onTap: () {
                                                  Get.back();
                                                  AdModel model = AdModel(
                                                      docId: _userController
                                                          .allAds[args].docId,
                                                      photos: _userController
                                                          .allAds[args].photos);
                                                  databaseController
                                                      .deleteImageonsinglePost(
                                                          model, index);
                                                },
                                              ),
                                              ListTile(
                                                title: Text('Cancel'),
                                                onTap: () => Get.back(),
                                              ),
                                            ],
                                          ),
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor);
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.network(
                                        _userController
                                            .allAds[args].photos!["$index"],
                                        fit: BoxFit.cover,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
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
                          if (databaseController.isUpladingImage.value)
                            Container(
                              color: Colors.black.withOpacity(.2),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                          onPressed: databaseController.isUpladingImage.value
                              ? null
                              : () {
                                  AdModel model = AdModel(
                                      docId: _userController.allAds[args].docId,
                                      category: _formKey
                                              .currentState!
                                              .fields[
                                                  PostNewAdConstants.category]!
                                              .value ??
                                          _userController.allAds[args].category,
                                      type: _formKey
                                          .currentState!
                                          .fields[PostNewAdConstants.type]!
                                          .value,
                                      title: _formKey
                                              .currentState!
                                              .fields[PostNewAdConstants.title]!
                                              .value ??
                                          _userController.allAds[args].title,
                                      description: _formKey
                                          .currentState!
                                          .fields[
                                              PostNewAdConstants.description]!
                                          .value,
                                      price: _formKey
                                          .currentState!
                                          .fields[PostNewAdConstants.price]!
                                          .value,
                                      mobileNumber: _formKey
                                          .currentState!
                                          .fields[
                                              PostNewAdConstants.mobileNumber]!
                                          .value,
                                      itemCondition: _formKey
                                          .currentState!
                                          .fields[PostNewAdConstants.itemCondition]!
                                          .value,
                                      city: _formKey.currentState!.fields[PostNewAdConstants.city]!.value ?? _userController.allAds[args].city,
                                      subCategory: _formKey.currentState?.fields[PostNewAdConstants.subCategory]?.value,
                                      videoUrl: _formKey.currentState?.fields[PostNewAdConstants.videoUrl]?.value);

                                  Get.back();
                                  databaseController.updatePostData(model);
                                },
                          child: Text('Post')),
                    ),
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
    );
  }
}
