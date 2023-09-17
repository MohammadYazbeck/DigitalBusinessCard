// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/sqanqrcode_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCode extends StatelessWidget {
  const ScanQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScanQrCodControllerImp());
    return GetBuilder<ScanQrCodControllerImp>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              leading: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: AppColor.white,
                    ),
                    onPressed: () {
                      controller.goback();
                    },
                  )),
              backgroundColor: AppColor.primaryColor,
              title: const Text("Mobile Scanner"),
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: controller.cameraController.torchState,
                    builder: (context, state, child) {
                      switch (state as TorchState) {
                        case TorchState.off:
                          return const Icon(Icons.flash_off,
                              color: Colors.grey);
                        case TorchState.on:
                          return const Icon(Icons.flash_on,
                              color: Colors.yellow);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => controller.cameraController.toggleTorch(),
                ),
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable:
                        controller.cameraController.cameraFacingState,
                    builder: (context, state, child) {
                      switch (state as CameraFacing) {
                        case CameraFacing.front:
                          return const Icon(Icons.camera_front);
                        case CameraFacing.back:
                          return const Icon(Icons.camera_rear);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => controller.cameraController.switchCamera(),
                ),
              ],
            ),
            body: MobileScanner(
                allowDuplicates: true,
                controller: controller.cameraController,
                onDetect: ((barcode, args) async {
                  if (!controller.screenopend) {
                    controller.scannedIdByQR = barcode.rawValue ?? "---";
                    await controller.getContact(barcode.rawValue);
                    printInfo(
                        info: 'Barcode found! ${controller.scannedIdByQR}');
                    controller.screenopend = true;
                    controller.viewscannedcard();
                  }
                }))));
  }
}
