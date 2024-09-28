import 'package:flutter/material.dart';

import 'package:flareline/pages/ems/analytics_widget.dart';
import 'package:flareline/pages/ems/channel_widget.dart';
import 'package:flareline/pages/ems/grid_card.dart';
import 'package:flareline/pages/ems/revenue_widget.dart';
import 'package:flareline/pages/layout.dart';

class EMSPage extends LayoutWidget {
  const EMSPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'EMS';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        GridCard(),
        const SizedBox(
          height: 16,
        ),
        RevenueWidget(),
        const SizedBox(
          height: 16,
        ),
        AnalyticsWidget(),
        const SizedBox(
          height: 16,
        ),
        ChannelWidget(),
      ],
    );
  }
}
