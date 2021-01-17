import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_penguin/reusables/constants.dart';
import 'package:qr_penguin/reusables/qr_code_data.dart';
import 'package:qr_penguin/widgets/background.dart';
import 'package:qr_penguin/widgets/main_app_bar.dart';
import 'package:qr_penguin/widgets/utilities_bar.dart';
import '../reusables/size_config.dart';

class QRCodeScreen extends StatefulWidget {
  final String input;

  const QRCodeScreen({
    Key key,
    @required this.input,
  }) : super(key: key);

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  Color FGPickerColor = Color(0xff000000);
  Color BGPickerColor = Color(0xffFFFFFF);
  Color currentBGColor = Color(0xffffffff);
  Color currentFGColor = Color(0xff000000);
  String title = 'untitled';
  IconData nameIcon = Icons.edit;
  void changeFGColor(Color color) {
    setState(() {
      FGPickerColor = color;
    });
  }

  void changeBGColor(Color color) {
    setState(() {
      BGPickerColor = color;
    });
  }

  void saveCode(QRCodeData data) {
    Hive.box('qrcode').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainAppBar(appBar: AppBar()),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(getPercentageOfWidth(5)),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          'Back',
                          style: kHeader3.copyWith(
                              color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),

                ExpandablePanel(
                  tapHeaderToExpand: true,
                  hasIcon: false,
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: kHeader1.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (nameIcon == Icons.edit) {
                              nameIcon = Icons.check;
                            } else {
                              nameIcon = Icons.edit;
                            }
                          });
                        },
                        child: ExpandableButton(
                          child: Icon(
                            nameIcon,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  expanded: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExpandableButton(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Expanded(
                          child: TextField(
                            onChanged: (value) {
                              title = value;
                            },
                            style: kHeader3.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            // textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            cursorColor: kSecondary,
                            cursorWidth: 5,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter New Name',
                              hintStyle: kHeader3.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: getPercentageOfHeight(5)),
                  child: QrImage(
                    data: widget.input,
                    version: QrVersions.auto,
                    size: getPercentageOfWidth(70),
                    foregroundColor: currentFGColor,
                    backgroundColor: currentBGColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: getPercentageOfWidth(20),
                    left: getPercentageOfWidth(20),
                    bottom: getPercentageOfHeight(2),
                  ),
                  //Color Changing
                  child: ExpandablePanel(
                    header: Text(
                      'Custom colors',
                      style: kHeader3.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    expanded: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Foreground Color ',
                              style: kHeader4.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: const Text('Pick Foreground color!'),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: FGPickerColor,
                                        onColorChanged: changeFGColor,
                                        showLabel: true,
                                        pickerAreaHeightPercent: 0.8,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: const Text('Pick'),
                                        onPressed: () {
                                          setState(() {
                                            currentFGColor = FGPickerColor;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(1000),
                                  color: currentFGColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Background Color ',
                              style: kHeader4.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: const Text('Pick background color!'),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: BGPickerColor,
                                        onColorChanged: changeBGColor,
                                        showLabel: true,
                                        pickerAreaHeightPercent: 0.8,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: const Text('Pick'),
                                        onPressed: () {
                                          setState(
                                            () =>
                                                currentBGColor = BGPickerColor,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(1000),
                                  color: currentBGColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    tapHeaderToExpand: true,
                    hasIcon: true,
                    iconColor: Colors.white,
                  ),
                ),
                //Disabled Buttons
                UtilitiesBar(
                  save: () => saveCode(
                    QRCodeData(
                      title: title,
                      url: widget.input,
                      bgColor: currentBGColor,
                      fgColor: currentFGColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
