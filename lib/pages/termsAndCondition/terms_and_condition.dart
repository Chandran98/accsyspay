import 'package:Accsys_Pay/pages/screens.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key key}) : super(key: key);

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
          'Terms and Conditions',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: [
          policies(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          terms(),
        ],
      ),
    );
  }

  policies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company Policies',
          style: black18BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis tellus interdum amet convallis nisl pellentesque. Elementum eros eu ultricies urna posuere auctor.',
          style: grey14RegularTextStyle,
        ),
        heightSpace,
        Text(
          'Fusce nulla cursus sed at mus in ornare. Pretium, sed aliquet vivamus ornare mattis viverra dolor at pulvinar. Nec sem odio at tristique egestas augue venenatis fermentum. Et sit commodo, vestibulum viverra tincidunt sed etiam.',
          style: grey14RegularTextStyle,
        ),
        heightSpace,
        Text(
          'Vehicula mauris dictum amet non nibh massa ipsum ullamcorper. Diam viverra nisl pharetra dolor. Lorem nunc sapien interdum sapien ipsum sapien, purus commodo aliquet.',
          style: grey14RegularTextStyle,
        ),
      ],
    );
  }

  terms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terms of Use',
          style: black18BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis tellus interdum amet convallis nisl pellentesque. Elementum eros eu ultricies urna posuere auctor.',
          style: grey14RegularTextStyle,
        ),
        heightSpace,
        Text(
          'Fusce nulla cursus sed at mus in ornare. Pretium, sed aliquet vivamus ornare mattis viverra dolor at pulvinar. Nec sem odio at tristique egestas augue venenatis fermentum. Et sit commodo, vestibulum viverra tincidunt sed etiam.',
          style: grey14RegularTextStyle,
        ),
        heightSpace,
        Text(
          'Vehicula mauris dictum amet non nibh massa ipsum ullamcorper. Diam viverra nisl pharetra dolor. Lorem nunc sapien interdum sapien ipsum sapien, purus commodo aliquet.',
          style: grey14RegularTextStyle,
        ),
      ],
    );
  }
}
