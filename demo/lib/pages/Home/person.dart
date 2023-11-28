import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'management/Farming_management.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/image/test/joke.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Admin",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Admin@gmail.com",
                style: TextStyle(
                  color: Color(0xFF797979),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Trang cá nhân"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                ),
              ),
              //
              SizedBox(
                height: 30,
              ),
              const Divider(),
              SizedBox(
                height: 10,
              ),
              // menu
              MenuUser(
                title: "Quản lý canh tác",
                icon: FontAwesomeIcons.home,
                onPress: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Farming_management(),
                  ),
                );},
              ),
              MenuUser(
                title: "Đổi ngôn ngữ",
                icon: FontAwesomeIcons.language,
                onPress: () {},
              ),
              MenuUser(
                title: "Đổi mật khẩu",
                icon: FontAwesomeIcons.gear,
                onPress: () {},
                endIcon: false,
              ),
              MenuUser(
                title: "Đăng xuất",
                icon: FontAwesomeIcons.signOut,
                onPress: () {},
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class MenuUser extends StatelessWidget {
  const MenuUser({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Icon(icon),
      ),
      title: Text(title),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Icon(
                FontAwesomeIcons.angleRight,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
