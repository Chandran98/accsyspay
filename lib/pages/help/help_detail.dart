import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class HelpDetail extends StatelessWidget {
  final String topic;
  const HelpDetail({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Help',
          style: black20BoldTextStyle,
        ),
      ),
      body: details(),
    );
  }

  details() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(fixPadding * 2.0),
      children: [
        Text(
          topic,
          style: black16SemiBoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis tellus interdum amet convallis nisl pellentesque. Elementum eros eu ultricies urna posuere auctor.',
          style: grey14RegularTextStyle,
        ),
        heightSpace,
        Text(
          'Fusce nulla cursus sed at mus in ornare. Pretium, sed aliquet vivamus ornare mattis viverra dolor at pulvinar. Nec sem odio at tristique egestas augue venenatis fermentum. Et sit commodo, vestibulum viverra tincidunt sed etiam. Metus in in convallis placerat.',
          style: grey14RegularTextStyle,
        ),
        heightSpace,
        Text(
          'Vehicula mauris dictum amet non nibh massa ipsum ullamcorper. Diam viverra nisl pharetra dolor. Lorem nunc sapien interdum sapien ipsum sapien, purus commodo aliquet. Odio enim, adipiscing nisl, nibh magna sit at nam in. Lorem at non lectus at. In hac donec orci nec. Magna tincidunt velit in nibh facilisi sagittis pellentesque. Mauris nisl etiam rhoncus fringilla nunc egestas blandit sed. Varius vel pulvinar adipiscing proin adipiscing.',
          style: grey14RegularTextStyle,
        ),
      ],
    );
  }
}
