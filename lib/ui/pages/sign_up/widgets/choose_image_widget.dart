import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videos/core/app_color.dart';
import 'package:videos/core/app_snack_bar.dart';

class ChooseImageBottomSheet extends StatefulWidget {
  final void Function(File file) onChanged;
  ChooseImageBottomSheet({super.key, required this.onChanged});

  @override
  State<ChooseImageBottomSheet> createState() => _ChooseImageBottomSheetState();
}

class _ChooseImageBottomSheetState extends State<ChooseImageBottomSheet> {
  List<String> allowedExtensions = ['jpg', 'gif', 'png'];
  bool isFileSizeGreaterThan10MB(int fileSizeInBytes) {
    const int tenMBInBytes = 10000000; // 10 MB in bytes
    if (fileSizeInBytes > tenMBInBytes) {
      AppSnackBar().showNoConnectionSnackBar(
        context,
        "The file cannot be larger than 10MB",
      );
      return true;
    } else {
      return false;
    }
  }

  bool isExtensionAllowed(String filePath) {
    final String extension = filePath.split('.').last.toLowerCase();

    if (!allowedExtensions.contains(extension)) {
      AppSnackBar().showNoConnectionSnackBar(
        context,
        "Allowed file types:  jpg, gif and png",
      );

      return false;
    }
    return true;
  }

  Future<void> getCameraImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (pickedFile != null) {
      if (isExtensionAllowed(pickedFile.path)) {
        final image = File(pickedFile.path);
        if (!isFileSizeGreaterThan10MB(image.lengthSync())) {
          widget.onChanged(image);
        }
      }
    }
  }

  Future<void> getGalleryImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (isExtensionAllowed(pickedFile.path)) {
        final image = File(pickedFile.path);
        if (!isFileSizeGreaterThan10MB(image.lengthSync())) {
          widget.onChanged(image);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFBC4CF1),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              const Expanded(
                child: Text(
                  "CHOOSE IMAGE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _OptionButton(
                icon: Icons.camera_alt_outlined,
                text: "Take a photo",
                isPrimary: true,
                onTap: () async => await getCameraImage(),
              ),
              _OptionButton(
                icon: Icons.image_outlined,
                text: "Choose from gallery",
                isPrimary: false,
                onTap: () async => await getGalleryImage(),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;

  const _OptionButton({
    required this.icon,
    required this.text,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.4,
        height: width * 0.4,
        decoration: BoxDecoration(
          color: isPrimary
              ? const Color(0xFFBC4CF1).withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isPrimary ? const Color(0xFFBC4CF1) : Colors.grey.shade600,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: isPrimary ? const Color(0xFFBC4CF1) : Colors.grey,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                text,
                style: TextStyle(
                  color: isPrimary ? const Color(0xFFBC4CF1) : Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
