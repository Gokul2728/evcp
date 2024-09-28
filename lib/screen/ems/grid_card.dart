import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:ui' as ui;

class GridCard extends StatelessWidget {
  GridCard({super.key});

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => SingleChildScrollView(
        child: contentDesktopWidget(context),
      ),
      mobile: (context) => SingleChildScrollView(
        child: contentMobileWidget(context),
      ),
      tablet: (context) => SingleChildScrollView(
        child: contentMobileWidget(context),
      ),
    );
  }

  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildVoltageDisplay({'L1': 240, 'L2': 245, 'L3': 0})),
        const SizedBox(width: 16),
        Expanded(child: _buildCurrentDisplay({'L1': 60, 'L2': 60, 'L3': 0})),
        const SizedBox(width: 16),
        Expanded(
          child: _buildPowerConsumedDisplay(
            context,
            '200', // Power value
            'Total Unit Consumed', // Title
            '0.43%' // Percent text
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: _buildGaugeWidget(context)),
      ],
    );
  }

  Widget contentMobileWidget(BuildContext context) {
    return Column(
      children: [
        _itemCardWidget(
            context,
            Icons.data_object,
            '\$3.456K',
            AppLocalizations.of(context)!.totalViews,
            '0.43%'),
        const SizedBox(height: 36),
        _itemCardWidget(
            context,
            Icons.shopping_cart,
            '\$45.2K',
            AppLocalizations.of(context)!.totalProfit,
            '0.43%',
            currentL1: 60,
            currentL2: 60,
            currentL3: 0),
        const SizedBox(height: 36),
        _itemCardWidget(
            context,
            Icons.group,
            '2.450',
            AppLocalizations.of(context)!.totalProduct,
            '0.43%'),
        const SizedBox(height: 36),
        _itemCardWidget(
            context,
            Icons.security_rounded,
            '3.456',
            AppLocalizations.of(context)!.totalUsers,
            '0.43%'),
        const SizedBox(height: 36),
        _itemCardWidget(
            context,
            Icons.security_rounded,
            '3.456',
            AppLocalizations.of(context)!.totalUsers,
            '0.43%'),
        const SizedBox(height: 36),
        _buildGaugeWidget(context),
      ],
    );
  }

  Widget _itemCardWidget(
      BuildContext context,
      IconData icons,
      String text,
      String subTitle,
      String percentText,
      {int? currentL1,
      int? currentL2,
      int? currentL3}) {
    return CommonCard(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                color: Colors.grey.shade200,
                child: Icon(
                  icons,
                  color: GlobalColors.sideBar,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (currentL1 != null && currentL2 != null && currentL3 != null) ...[
              Text(
                'Current Input',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                'L1: $currentL1 A  L2: $currentL2 A  L3: $currentL3 A',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 16),
            ],
            Row(
              children: [
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  percentText,
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.green), // Removed isGrow check
                ),
                const SizedBox(width: 3),
                Icon(
                  Icons.arrow_upward, // Removed dynamic direction
                  color: Colors.green, // Removed dynamic color
                  size: 12,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPowerConsumedDisplay(
      BuildContext context, String power, String title, String percentText) {
    return CommonCard(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                // width: 36,
                // height: 36,
                // // alignment: Alignment.center,
                // color: Colors.grey.shade200,
                // child: Icon(
                //   Icons.power,
                //   color: GlobalColors.sideBar,
                // ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$power kW',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Power Consumed',
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  percentText,
                  style: const TextStyle(fontSize: 10, color: Colors.green),
                ),
                const SizedBox(width: 3),
                Icon(
                  Icons.arrow_upward, // Removed dynamic direction
                  color: Colors.green, // Removed dynamic color
                  size: 12,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildVoltageDisplay(Map<String, int> voltages) {
    return CommonCard(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Voltage Input',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            ...voltages.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '${entry.value} V',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: entry.value > 0 ? Colors.red : Colors.grey),
                        ),
                        const SizedBox(width: 8),
                        _buildVoltageIndicator(entry.value),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentDisplay(Map<String, int> currents) {
    return CommonCard(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Input',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            ...currents.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '${entry.value} A',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        const SizedBox(width: 8),
                        _buildCurrentIndicator(entry.value),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildVoltageIndicator(int voltage) {
    Color glowColor = voltage > 0 ? Colors.red : Colors.grey;
    Color lightColor = voltage > 0 ? Colors.redAccent : Colors.grey[300]!;

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: glowColor,
        boxShadow: [
          BoxShadow(
            color: lightColor.withOpacity(0.6),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentIndicator(int current) {
    Color glowColor = current > 0 ? Colors.green : Colors.grey;
    Color lightColor = current > 0 ? Colors.lightGreenAccent : Colors.grey[300]!;

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: glowColor,
        boxShadow: [
          BoxShadow(
            color: lightColor.withOpacity(0.6),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RepaintBoundary(
          key: _globalKey,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 150,
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 50,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 50,
                      endValue: 100,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 100,
                      endValue: 150,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10)
                ],
                pointers: <GaugePointer>[NeedlePointer(value: 90)],
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Kw - Power : 90',
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Future<void> _renderGaugeImage(BuildContext context) async {
    final RenderRepaintBoundary boundary =
        _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    final ui.Image data = await boundary.toImage(pixelRatio: 4.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    if (bytes != null) {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Container(
                  color: Colors.white,
                  child: Image.memory(bytes.buffer.asUint8List()),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
