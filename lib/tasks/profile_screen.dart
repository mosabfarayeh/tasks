import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "محمد أحمد";
  String email = "example@email.com";
  String phone = "+961 76 123 456";
  String birthDate = "01/01/1990";
  File? _image;

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _editProfile(String field) {
    TextEditingController controller = TextEditingController();
    if (field == "name") controller.text = name;
    if (field == "email") controller.text = email;
    if (field == "phone") controller.text = phone;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $field"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                if (field == "name") name = controller.text;
                if (field == "email") email = controller.text;
                if (field == "phone") phone = controller.text;
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }

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
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(Icons.person, size: 50, color: Colors.grey[700])
                      : null,
                ),
              ),
              SizedBox(height: 10),
              TextButton(onPressed: _pickImage, child: Text("Edit")),
              SizedBox(height: 20),
              ProfileInfo(
                  icon: Icons.calendar_today,
                  label: "تاريخ الميلاد",
                  value: birthDate),
              SizedBox(height: 20),
              ProfileInfo(
                  icon: Icons.person,
                  label: "الاسم",
                  value: name,
                  onEdit: () => _editProfile("name")),
              ProfileInfo(
                  icon: Icons.email,
                  label: "البريد الإلكتروني",
                  value: email,
                  onEdit: () => _editProfile("email")),
              ProfileInfo(
                  icon: Icons.phone,
                  label: "رقم الهاتف",
                  value: phone,
                  onEdit: () => _editProfile("phone")),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings, size: 40),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          );
                        },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpCenterPage()),
                          );
                        },
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
  final VoidCallback? onEdit;

  ProfileInfo(
      {required this.icon,
      required this.label,
      required this.value,
      this.onEdit});

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
          if (onEdit != null)
            TextButton(
              onPressed: onEdit,
              child: Text("Edit"),
            ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Text("Settings Page"),
      ),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
      ),
      body: Center(
        child: Text("Help Center Page"),
      ),
    );
  }
}
