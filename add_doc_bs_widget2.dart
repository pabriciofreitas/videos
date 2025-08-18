// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';
// import 'dart:math';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:tallisbusiness_bank__app/constants/app_assets.dart';
// import 'package:tallisbusiness_bank__app/constants/app_colors.dart';
// import 'package:tallisbusiness_bank__app/constants/app_textstyle.dart';
// import 'package:tallisbusiness_bank__app/core/app_print.dart';
// import 'package:tallisbusiness_bank__app/core/app_snack_bar.dart';
// import 'package:tallisbusiness_bank__app/extensions/build_context.dart';
// import 'package:tallisbusiness_bank__app/extensions/sized_box.dart';
// import 'package:tallisbusiness_bank__app/navigation/navigation.dart';
// import 'package:tallisbusiness_bank__app/navigation/navigator_key.dart';
// import 'package:tallisbusiness_bank__app/presentation/views/signup_screens/signup_widgets/common_icon_title_icon_button.dart';
// import 'package:tallisbusiness_bank__app/resources/localization/language_constrants.dart';

// class AddDocBottomSheetWidget2 extends StatefulWidget {
//   final bool isSelf;
//   final void Function(File file) onChanged;
//   const AddDocBottomSheetWidget2({
//     super.key,
//     required this.onChanged,
//     this.isSelf = false,
//   });

//   @override
//   State<AddDocBottomSheetWidget2> createState() =>
//       _AddDocBottomSheetWidget2State();
// }

// class _AddDocBottomSheetWidget2State extends State<AddDocBottomSheetWidget2> {
//   File? _image;
//   PlatformFile? _file;
//   List<String> allowedExtensions = [
//     'jpg',
//     'pdf',
//     'png',
//   ];

//   bool isExtensionAllowed(String filePath) {
//     final String extension = filePath.split('.').last.toLowerCase();

//     if (!allowedExtensions.contains(extension)) {
//       appSnackBar(
//         ctx!,
//         '${getTranslated(
//           "allowed_file_types",
//           ctx!,
//         )}: jpg, pdf e png',
//       );
//       return false;
//     }
//     return true;
//   }

//   Future<void> getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(
//         source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);

//     if (pickedFile != null) {
//       if (isExtensionAllowed(pickedFile.path)) {
//         _image = File(pickedFile.path);
//         if (isFileSizeGreaterThan10MB(
//           _image!.lengthSync(),
//         )) {
//           _image = null;
//         } else {
//           widget.onChanged(_image!);
//           Navigation.pop();
//         }
//       }
//     }
//     setState(() {});
//   }

//   bool isFileSizeGreaterThan10MB(
//     int fileSizeInBytes,
//   ) {
//     const int tenMBInBytes = 10000000; // 10 MB em bytes
//     if (fileSizeInBytes > tenMBInBytes) {
//       appSnackBar(
//           ctx!, getTranslated('the_file_cannot_be_larger_than_10MB', ctx!));
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<void> getGalleryImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(
//       source: ImageSource.gallery,
//     );

//     if (pickedFile != null) {
//       if (isExtensionAllowed(pickedFile.path)) {
//         _image = File(pickedFile.path);
//         if (isFileSizeGreaterThan10MB(
//           _image!.lengthSync(),
//         )) {
//           _image = null;
//         } else {
//           widget.onChanged(_image!);
//           Navigation.pop();
//         }
//         _image = null;
//       }
//     } else {
//       print('No image selected.');
//     }
//     setState(() {});
//   }

//   Future<void> selectFile() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: allowedExtensions,
//     );

//     if (result != null) {
//       _file = result.files.first;
//       _image = File(_file!.path!);
//       if (isFileSizeGreaterThan10MB(
//         _image!.lengthSync(),
//       )) {
//         _image = null;
//       } else {
//         widget.onChanged(_image!);
//         Navigation.pop();
//       }
//       setState(() {});
//     } else {
//       // Usuário cancelou a seleção
//     }
//   }

//   BuildContext? ctx;
//   @override
//   Widget build(BuildContext context) {
//     ctx = context;
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 10,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           20.spaceY,
//           Padding(
//             padding: const EdgeInsets.only(left: 15),
//             child: Text(
//               getTranslated("add_doc", context),
//               style: AppTextstyle.headingTextStyle(
//                   color: context.theme.colorTheme.normalTextColor,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           20.spaceY,
//           InkWell(
//             onTap: getImage,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 15),
//               child: Container(
//                 height: 98,
//                 width: 102,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: AppColors.grey),
//                 child: Center(
//                   child: Image.asset(
//                     AppAssets.cameraicon,
//                     scale: 2,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           widget.isSelf ? SizedBox() : 22.spaceY,
//           widget.isSelf
//               ? SizedBox()
//               : CommonIconTitleIconButton(
//                   onpress: getGalleryImage,
//                   isForwardIcon: false,
//                   iconImage: AppAssets.galleryicon,
//                   title: getTranslated("choose_gallery", context),
//                   imageColor: Colors.white,
//                 ),
//           widget.isSelf
//               ? SizedBox()
//               : CommonIconTitleIconButton(
//                   onpress: () async {
//                     await selectFile();
//                   },
//                   isForwardIcon: false,
//                   iconImage: AppAssets.docicon,
//                   title: getTranslated("upload_doc", context),
//                   imageColor: Colors.white,
//                 ),
//         ],
//       ),
//     );
//   }
// }
