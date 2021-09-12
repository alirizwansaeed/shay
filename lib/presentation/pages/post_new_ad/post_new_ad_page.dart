import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';

class PostNewAdPage extends StatefulWidget {
  static const routeName = 'post_ad_page';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(ScreenConstants.devicePadding),
            padding: EdgeInsets.all(ScreenConstants.devicePadding),
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Make New ad',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
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
                    decoration: BoxDecoration(border: Border.all()),
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
                                    Image.network(databaseController
                                        .pickedImagesList.value[index].path),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
