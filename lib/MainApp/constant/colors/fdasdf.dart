import 'package:provider/provider.dart';

import '../../../pages/screens.dart';
import '../../Models/bus_modal/search_city_modal.dart';
import '../../provider/bus_provider.dart';

class Jokeer extends StatefulWidget {
  const Jokeer({Key key}) : super(key: key);

  @override
  State<Jokeer> createState() => _JokeerState();
}

class _JokeerState extends State<Jokeer> {
  @override
  Widget build(BuildContext context) {
    final blockProvider = Provider.of<BusBookingProvider>(context);
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              blockProvider.fetchSeatLayout( "ds","sds",context);
            },
            child: const Text("Fetch")),
      ),
    );
  }
}
