import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class CreateCardBottomSheet extends StatelessWidget {
  final void Function() uploadImageGallery;
  final void Function() uploadImageCamera;

  const CreateCardBottomSheet(
      {super.key,
      required this.uploadImageGallery,
      required this.uploadImageCamera});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: AppColor.primaryColor),
        width: double.infinity,
        height: 130,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.white,
              ),
              width: 380,
              margin: const EdgeInsets.only(top: 10),
              padding:
                  const EdgeInsets.only(left: 10, top: 1, bottom: 1, right: 10),
              child: InkWell(
                onTap: uploadImageCamera,
                child: SizedBox(
                  height: 45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 33,
                        color: AppColor.darkgrey,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1, left: 5),
                        child: Text(
                          "Camera",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.darkgrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.white,
              ),
              width: 380,
              margin: const EdgeInsets.only(top: 10),
              padding:
                  const EdgeInsets.only(left: 10, top: 1, bottom: 1, right: 10),
              child: InkWell(
                onTap: uploadImageGallery,
                child: SizedBox(
                  height: 45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate,
                        size: 34,
                        color: AppColor.darkgrey,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4, left: 5),
                        child: Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.darkgrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
