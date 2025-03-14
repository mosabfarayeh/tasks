import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Profile"),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              TextButton(onPressed: () {}, child: Text("Edit")),
              SizedBox(height: 20),
              ProfileInfo(
                icon: Icons.calendar_today,
                label: "تاريخ الميلاد",
                value: "01/01/1990",
              ),
              SizedBox(height: 20),
              ProfileInfo(
                  icon: Icons.person, label: "الاسم", value: "محمد أحمد"),
              ProfileInfo(
                  icon: Icons.email,
                  label: "البريد الإلكتروني",
                  value: "example@email.com"),
              ProfileInfo(
                  icon: Icons.phone,
                  label: "رقم الهاتف",
                  value: "+961 76 123 456"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings, size: 40),
                        onPressed: () {},
                      ),
                      Text("Setting",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.support_agent, size: 40),
                        onPressed: () {},
                      ),
                      Text("Help center",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileInfo({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 30),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(onPressed: () {}, child: Text("Edit"))
        ],
      ),
    );
  }
}
