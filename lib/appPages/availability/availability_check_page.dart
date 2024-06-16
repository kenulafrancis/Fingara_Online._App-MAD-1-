import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/availability/calander_widget.dart';
import 'package:online_reservations_for_sports/appPages/availability/countinue_button_widget.dart';
import 'package:online_reservations_for_sports/appPages/availability/dropdown_widget.dart';
import 'package:online_reservations_for_sports/appPages/availability/timeSlotGrid_widget.dart';
import 'package:online_reservations_for_sports/appPages/reservations/payment.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class AvailabilityCheckPage extends StatefulWidget {
  const AvailabilityCheckPage({super.key});
  static const String name = 'availability';

  @override
  State<AvailabilityCheckPage> createState() => _AvailabilityCheckPageState();
}

class _AvailabilityCheckPageState extends State<AvailabilityCheckPage> {
  String selectedSport = 'Tennis';
  DateTime selectedDate = DateTime.now();
  String? selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check Availability',
          style: TextStyle(color: WhiteColor),
        ),
        centerTitle: true,
        backgroundColor: DarkColor,
        iconTheme: const IconThemeData(color: WhiteColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        toolbarHeight: height * 0.1,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: orientation == Orientation.portrait
                ? _buildPortraitLayout(context)
                : _buildLandscapeLayout(context),
          );
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SportDropdown(
          selectedSport: selectedSport,
          onChanged: (String? newValue) {
            setState(() {
              selectedSport = newValue!;
            });
          },
        ),
        const SizedBox(height: 20),
        DatePicker(
          selectedDate: selectedDate,
          onDateSelected: (DateTime date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        const SizedBox(height: 20),
        Expanded(
          child: TimeSlotsGrid(
            selectedTimeSlot: selectedTimeSlot,
            onTimeSlotSelected: (String timeSlot) {
              setState(() {
                selectedTimeSlot = timeSlot;
              });
            },
          ),
        ),
        if (selectedTimeSlot != null)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ContinueButton(
              onPressed: () {
                Navigator.pushNamed(context, PaymentPortal.name);
              },
            ),
          ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SportDropdown(
                selectedSport: selectedSport,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSport = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5, // Adjust height as needed
                    child: DatePicker(
                      selectedDate: selectedDate,
                      onDateSelected: (DateTime date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                child: TimeSlotsGrid(
                  selectedTimeSlot: selectedTimeSlot,
                  onTimeSlotSelected: (String timeSlot) {
                    setState(() {
                      selectedTimeSlot = timeSlot;
                    });
                  },
                ),
              ),
              if (selectedTimeSlot != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ContinueButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PaymentPortal.name);
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}