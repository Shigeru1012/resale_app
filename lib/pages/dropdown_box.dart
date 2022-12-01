import 'package:flutter/material.dart';

class DropdownBox extends StatefulWidget {

  const DropdownBox({Key? key, this.icon}) : super(key: key);

  final dynamic icon;
  @override
  _DropdownBoxState createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.icon);
    super.initState();
  }

  void findDropdownData(){
    RenderBox renderBox = actionKey.currentContext!.findRenderObject()! as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 2 * height,
        child: DropDown(
          itemHeight: height, key: actionKey,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: (){
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context)?.insert(floatingDropdown);
          }
          isDropdownOpened = !isDropdownOpened;
        });
      },
    );
  }

}
class DropDown extends StatelessWidget {
  final double itemHeight;

  const DropDown({Key? key, required this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          elevation: 10,
          child: Container(
            height: 2 * itemHeight,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: const <Widget>[
                DropDownItem(
                  text: "Small Image",
                  isSelected: false,
                ),
                DropDownItem(
                  text: "Large Image",
                  isSelected: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class DropDownItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const DropDownItem({Key? key, required this.text, this.isSelected = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
        ),
        color: isSelected ? Colors.redAccent : Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: <Widget>[
          Text(
            text.toUpperCase(),
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
    );
  }
}


