import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yaqoob_test_project/Models/event_detail_model.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import '../../../const.dart';

class EventsDetails extends StatefulWidget {
  final String eventId;
  const EventsDetails({super.key, required this.eventId});

  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  APIService? apiService;
  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xffF9FAFB),
        ),
        child: const Center(
          child: ListTile(
            trailing: Text(
              "\$ 0.0",
              style: TextStyle(
                color: kpColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Text(
              "Total",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 1,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: FutureBuilder<EventDetailModel>(
          future: apiService!.getEventDetails(widget.eventId),
          builder:
              (BuildContext context, AsyncSnapshot<EventDetailModel> snapshot) {
            if (snapshot.hasData) {
              return BuildEventDetails(eventDetailModel: snapshot.data!);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class BuildEventDetails extends StatelessWidget {
  final EventDetailModel eventDetailModel;
  const BuildEventDetails({super.key, required this.eventDetailModel});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const ListTile(
            leading: Text(
              "Events Details",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            children: ListTile.divideTiles(
              //          <-- ListTile.divideTiles
              context: context,
              tiles: [
                ListTile(
                  title: const Text(
                    'Hall',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  subtitle: Text(
                    eventDetailModel.data!.hallName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Menu',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  subtitle: Text(
                    eventDetailModel.data!.menuName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Form submission',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  subtitle: Text(
                    eventDetailModel.data!.order.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Form Date',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  trailing: const Icon(Icons.date_range),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      DateTime.parse(
                        eventDetailModel.data!.fromDate.toString(),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Event from time',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  trailing: const Icon(Icons.access_time),
                  subtitle: Text(
                    DateFormat.jm().format(
                      DateFormat("hh:mm:ss").parse(
                        eventDetailModel.data!.fromTime.toString(),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Event To Time',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  trailing: const Icon(Icons.access_time),
                  subtitle: Text(
                    DateFormat.jm().format(
                      DateFormat("hh:mm:ss").parse(
                        eventDetailModel.data!.toTime.toString(),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'To Date',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  trailing: const Icon(Icons.date_range),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      DateTime.parse(
                        eventDetailModel.data!.toDate.toString(),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Day Event',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  subtitle: Text(
                    eventDetailModel.data!.dayEvent.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Budgets',
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  subtitle: Text(
                    "\$\t${eventDetailModel.data!.totalAmount.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kpColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Items"),
                    ),
                  ),
                ),
              ],
            ).toList(),
          ),
        ],
      ),
    );
  }
}
