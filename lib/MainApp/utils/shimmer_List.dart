import 'package:nb_utils/nb_utils.dart';

import 'package:shimmer/shimmer.dart';
import '../../pages/screens.dart';
import 'main_app_utils.dart';

class ShimmerListComponent extends StatelessWidget {
  final double containerWidth = 280;
  final double containerHeight = 15;

  const ShimmerListComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey[400],
          child: shimmerLayout(),
          period: Duration(milliseconds: time),
        );
      },
    ).paddingAll(16);
  }

  Widget shimmerLayout() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(height: 80, width: 80, color: Colors.grey),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: containerHeight,
                  width: containerWidth,
                  color: Colors.grey),
              5.height,
              Container(
                  height: containerHeight,
                  width: containerWidth,
                  color: Colors.grey),
              5.height,
              Container(
                  height: containerHeight,
                  width: containerWidth * 0.75,
                  color: Colors.grey)
            ],
          ).expand()
        ],
      ),
    );
  }
}

class ShimmerBanner extends StatelessWidget {
  final double containerWidth = 280;
  final double containerHeight = 15;

  const ShimmerBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey[200],
      child: shimmerLayout(),
      period: Duration(milliseconds: time),
    );
  }

  Widget shimmerLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(height: 150, width: double.infinity, color: Colors.grey),
    );
  }
}

class TransactionShimmerList extends StatelessWidget {
  final double containerWidth = 280;
  final double containerHeight = 15;

  const TransactionShimmerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey[400],
          child: shimmerLayout(),
          period: Duration(milliseconds: time),
        );
      },
    ).paddingAll(16);
  }

  Widget shimmerLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 40, width: 40, color: Colors.grey),
            ),
            spacer20Width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: containerHeight,
                    width: containerWidth * 0.9,
                    color: Colors.grey),
                15.height,
                Row(
                  children: [
                    Container(
                        height: containerHeight,
                        width: containerWidth * 0.35,
                        color: Colors.grey),
                    spacer50Width,
                    spacer50Width,
                    Container(height: 20, width: 50, color: Colors.grey),
                  ],
                ),
              ],
            ).expand()
          ],
        ),
      ),
    );
  }
}

class ServicewidgetShimmerList extends StatelessWidget {
  final double containerWidth = 245;
  final double containerHeight = 15;

  const ServicewidgetShimmerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey[400],
          child: shimmerLayout(),
          period: Duration(milliseconds: time),
        );
      },
    ).paddingAll(16);
  }

  Widget shimmerLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              ),
            ),
            spacer10Width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        height: containerHeight,
                        width: containerWidth * 0.9,
                        color: Colors.grey),
                    spacer40Width,
                    // Container(height: 20, width: 50, color: Colors.grey),
                  ],
                ),
                15.height,
                Container(
                    height: containerHeight,
                    width: containerWidth * 0.35,
                    color: Colors.grey)
              ],
            ).expand()
          ],
        ),
      ),
    );
  }
}
