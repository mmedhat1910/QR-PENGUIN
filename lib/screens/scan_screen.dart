import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_penguin/reusables/constants.dart';
import 'package:qr_penguin/widgets/circular_button_icon.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';
var cameraIcon = Icons.autorenew;

class ScanScreen extends StatefulWidget {
  static const id = 'scanScreen';

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Barcode result;
  var flashState = flashOn;
  var flashIcon = Icons.flash_on;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  _buildQrView(context),
                  Column(
                    children: [],
                  )
                ],
              )),
          Expanded(
            flex: 1,
            child: Container(
              color: kMain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  else
                    Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: CircularButtonIcon(
                          bgColor: kMainLight,
                          icon: flashIcon,
                          iconColor: Colors.white,
                          iconSize: 32,
                          onPressed: () {
                            if (controller != null) {
                              if (_isFlashOn(flashState)) {
                                controller.toggleFlash();
                                setState(() {
                                  flashState = flashOff;
                                  flashIcon = Icons.flash_on;
                                });
                              } else {
                                controller.toggleFlash();
                                setState(() {
                                  flashState = flashOn;
                                  flashIcon = Icons.flash_off;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        child: CircularButtonIcon(
                          icon: cameraIcon,
                          bgColor: kMainLight,
                          iconColor: Colors.white,
                          iconSize: 32,
                          onPressed: () {
                            if (controller != null) {
                              controller.flipCamera();
                              if (_isBackCamera(cameraState)) {
                                setState(() {
                                  cameraState = frontCamera;
                                });
                              } else {
                                setState(() {
                                  cameraState = backCamera;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        child: CircularButtonIcon(
                          icon: Icons.pause,
                          bgColor: kMainLight,
                          iconColor: Colors.white,
                          iconSize: 32,
                          onPressed: () {
                            controller?.pauseCamera();
                          },
                        ),
                      ),
                      Container(
                        child: CircularButtonIcon(
                          icon: Icons.play_arrow,
                          bgColor: kMainLight,
                          iconColor: Colors.white,
                          iconSize: 32,
                          onPressed: () {
                            controller?.resumeCamera();
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  ///
  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 250.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        Future.microtask(
            () => controller?.updateDimensions(qrKey, scanArea: scanArea));
        return false;
      },
      child: SizeChangedLayoutNotifier(
        key: const Key('qr-size-notifier'),
        child: QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea,
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
