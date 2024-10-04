// lib/components/battery_percentage_widget.dart
import 'package:flutter/material.dart';
import '../services/battery_service.dart';

class BatteryPercentageWidget extends StatefulWidget {
  const BatteryPercentageWidget({super.key});

  @override
  _BatteryPercentageWidgetState createState() => _BatteryPercentageWidgetState();
}

class _BatteryPercentageWidgetState extends State<BatteryPercentageWidget> {
  final BatteryService _batteryService = BatteryService();
  int? _batteryLevel;

  @override
  void initState() {
    super.initState();
    _fetchBatteryLevel();
  }

  Future<void> _fetchBatteryLevel() async {
    final batteryLevel = await _batteryService.getBatteryLevel();
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: _batteryLevel == null
          ? CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      )
          : Text(
        'Battery: $_batteryLevel%',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
