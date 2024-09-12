import 'package:flutter/material.dart';
import '../../constants.dart';

class Profile extends StatelessWidget {
  final void Function(int) onTabSelected;
  const Profile({super.key, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/profile3.png",
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  color: Colors.transparent,
                  height: size.height * 0.7,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      const CircleAvatar(
                                        radius: 42,
                                        backgroundImage: AssetImage("images/profile3.png"),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(255, 95, 225, 99),
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("User Name", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                                      Text("user@example.com", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.white),
                                    onPressed: () {
                                      // Add edit profile functionality
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(color: Colors.white54),
                        Container(
                          color: kprofileColor,
                          child: ProfileSection(
                            title: "Order History",
                            icon: Icons.history,
                            onTap: () {
                              // Navigate to order history
                            },
                          ),
                        ),
                        const Divider(color: Colors.white54),
                        Container(
                          color: kprofileColor,
                          child: ProfileSection(
                            title: "Address Book",
                            icon: Icons.location_on,
                            onTap: () {
                              // Navigate to address book
                            },
                          ),
                        ),
                        const Divider(color: Colors.white54),
                        Container(
                          color: kprofileColor,
                          child: ProfileSection(
                            title: "Wishlist",
                            icon: Icons.favorite,
                            onTap: () {
                              onTabSelected(1);
                            },
                          ),
                        ),
                        const Divider(color: Colors.white54),
                        Container(
                          color: kprofileColor,
                          child: ProfileSection(
                            title: "Notifications & Preferences",
                            icon: Icons.notifications,
                            onTap: () {
                              // Navigate to notifications & preferences
                            },
                          ),
                        ),
                        const Divider(color: Colors.white54),
                        Container(
                          color: kprofileColor,
                          child: ProfileSection(
                            title: "Account Security",
                            icon: Icons.security,
                            onTap: () {
                              // Navigate to account security
                            },
                          ),
                        ),
                        const Divider(color: Colors.white54),
                        Container(
                          color: kprofileColor,
                          child: ProfileSection(
                            title: "Log Out",
                            icon: Icons.logout,
                            onTap: () {
                              // Log out functionality
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileSection({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: onTap,
    );
  }
}
