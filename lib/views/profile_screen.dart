import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/profile_viewmodel.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.pink[100],
                      backgroundImage: const AssetImage(
                        "assets/images/logo.png", // Dummy Image
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const SectionTitle(title: "Personal Info"),
              ProfileInfoCard(
                data: {
                  "Your name": "Muhammad Umair Tariq",
                  "Occupation": "Flutter Developer",
                  "Pakistan": "",
                },
                hasSwitch: true,
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: "Contact Info"),
              ProfileInfoCard(
                data: {
                  "Phone number": "+92 311 0231429",
                  "Email": "tumair139@gmail.com",
                },
                hasSwitch: false,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {}, // Add edit functionality
                  child: const Text(
                    "Edit",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final Map<String, String> data;
  final bool hasSwitch;
  const ProfileInfoCard({
    super.key,
    required this.data,
    this.hasSwitch = false,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileViewModel controller = Get.find<ProfileViewModel>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.1 * 255).toInt()),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children:
            data.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                    if (entry.value.isNotEmpty)
                      Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else if (hasSwitch)
                      Obx(
                        () => Switch(
                          value: controller.switchValue.value,
                          onChanged: controller.toggleSwitch,
                          activeColor: Colors.red,
                          inactiveTrackColor: Colors.grey[400],
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
