import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/utils.dart';

class PostNewAdPage extends StatefulWidget {
  static const routeName = 'postnewad';
  PostNewAdPage({Key? key}) : super(key: key);

  @override
  _PostNewAdPageState createState() => _PostNewAdPageState();
}

class _PostNewAdPageState extends State<PostNewAdPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final databaseController = Get.find<DatabaseController>();
    //Form Builder Fields
    return GestureDetector(
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
                  Text(PostNewAdConstants.category),
                  SizedBox(
                    height: 10,
                  ),
                  FormBuilderDropdown(
                    name: PostNewAdConstants.category,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(context),
                    hint: Text('Choose Category'),
                    isDense: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: PostNewAdConstants.categorylist
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(PostNewAdConstants.type),
                  SizedBox(
                    height: 10,
                  ),
                  FormBuilderChoiceChip(
                    visualDensity: VisualDensity.compact,
                    name: PostNewAdConstants.type,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(context),
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    spacing: 6.0,
                    runSpacing: 6.0,
                    options: PostNewAdConstants.typeList
                        .map(
                          (type) => FormBuilderFieldOption(
                            value: type,
                            child: Text(type),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(PostNewAdConstants.title),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                    name: PostNewAdConstants.title,
                    maxLength: 70,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.min(context, 3),
                      FormBuilderValidators.required(context),
                    ]),
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(PostNewAdConstants.description),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                    name: PostNewAdConstants.description,
                    minLines: 5,
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(PostNewAdConstants.price),
                  SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: PostNewAdConstants.price,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.max(context, 100000000000),
                      FormBuilderValidators.integer(context),
                    ]),
                    decoration: InputDecoration(
                      prefixText: 'Rs.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(PostNewAdConstants.mobileNumber),
                  SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: PostNewAdConstants.mobileNumber,
                    maxLength: 11,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.integer(context),
                      FormBuilderValidators.maxLength(context, 11),
                      FormBuilderValidators.minLength(context, 11),
                    ]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(PostNewAdConstants.itemCondition),
                  SizedBox(
                    height: 10,
                  ),
                  FormBuilderChoiceChip(
                    name: PostNewAdConstants.itemCondition,
                    visualDensity: VisualDensity.compact,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(context),
                    decoration: InputDecoration(border: OutlineInputBorder()),
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
                  SizedBox(height: 29),
                  Text(PostNewAdConstants.city),
                  SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: PostNewAdConstants.city,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(context),
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(PostNewAdConstants.photos),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Container(
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => databaseController.getImageFormUser(),
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey,
                              child: Icon(Icons.add_photo_alternate),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: databaseController
                                  .pickedImagesList.value.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 6.0),
                                  height: 80,
                                  width: 80,
                                  color: Colors.grey.shade400,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      GetPlatform.isWeb
                                          ? Image.network(databaseController
                                              .pickedImagesList
                                              .value[index]
                                              .path)
                                          : Image.file(File(databaseController
                                              .pickedImagesList
                                              .value[index]
                                              .path)),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: () => databaseController
                                              .pickedImagesList
                                              .update((val) {
                                            val!.removeAt(index);
                                          }),
                                          icon: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => ElevatedButton(
                        onPressed:
                            Get.find<DatabaseController>().isLoading.value
                                ? null
                                : _postNewAdButton,
                        child: Text(' Post Ad')),
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

  void _postNewAdButton() async {
    if (_formKey.currentState!.validate()) {
      PostNewAdModel model = PostNewAdModel(
          category:
              _formKey.currentState!.fields[PostNewAdConstants.category]!.value,
          type: _formKey.currentState!.fields[PostNewAdConstants.type]!.value,
          title: _formKey.currentState!.fields[PostNewAdConstants.title]!.value,
          description: _formKey
              .currentState!.fields[PostNewAdConstants.description]!.value,
          price: _formKey.currentState!.fields[PostNewAdConstants.price]!.value,
          mobileNumber: _formKey
              .currentState!.fields[PostNewAdConstants.mobileNumber]!.value,
          itemCondition: _formKey
              .currentState!.fields[PostNewAdConstants.itemCondition]!.value,
          city: _formKey.currentState!.fields[PostNewAdConstants.city]!.value);
      Get.find<DatabaseController>().postNewAdd(model);
    }
  }
}
