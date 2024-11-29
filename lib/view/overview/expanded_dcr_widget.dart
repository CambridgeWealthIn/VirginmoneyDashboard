import 'package:dashboard/view/widgets/charts&graphs/spike_linegraph.dart';
import 'package:flutter/material.dart';

class ExpandedDcrWidget extends StatefulWidget {
  const ExpandedDcrWidget({super.key});

  @override
  State<ExpandedDcrWidget> createState() => _ExpandedDcrWidgetState();
}

class _ExpandedDcrWidgetState extends State<ExpandedDcrWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          SpikeLinegraph(),
        ],
      ),
    );
  }
}
