import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class WAOperationComponent extends StatefulWidget {
  static String tag = '/WAOperationComponent';
  final dynamic itemModel;
  final bool isApplyColor;

  WAOperationComponent({this.itemModel, this.isApplyColor = false});

  @override
  WAOperationComponentState createState() => WAOperationComponentState();
}

class WAOperationComponentState extends State<WAOperationComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => widget.itemModel.widget));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: ImageIcon(AssetImage('${widget.itemModel.image}'),
                size: 30, color: widget.itemModel.color),
          ).paddingOnly(bottom: 10, right: 10),
          Text(
            '${widget.itemModel.title}',
            style: boldTextStyle(size: 14, color: Colors.black),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
