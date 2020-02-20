import 'package:chat_app/src/constants/colors.dart';
import 'package:chat_app/src/constants/gradients.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      body: body(context),
    );
  }

  Widget appBarComponent(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
          child: Row(
        children: <Widget>[
          Container(
            width: 90,
            height: 80,
            padding: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              gradient: BLUE_GRADIENT,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: WHITE_COLOR,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      )),
    );
  }

  Widget body(context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: ListView(
        children: <Widget>[
          headerComponent(),
          Container(margin: EdgeInsets.only(top: 40)),
          descriptionComponent(),
          Container(margin: EdgeInsets.only(top: 40)),
          codeSourceComponent(),
          Container(margin: EdgeInsets.only(top: 20)),
          Divider(),
          Container(margin: EdgeInsets.only(top: 40)),
          developerItemComponent(
            "Front-end & Back-end developer",
            "Dhia Irfan Muhammad",
            github: "https://github.com/DemoNeolith",
            facebook: "https://www.facebook.com/dhia.irfan?ref=bookmarks",
          ),
          Container(margin: EdgeInsets.only(top: 30)),
          developerItemComponent(
            "Designer & Report Writer",
            "Hanifa Ananda",
            github: "https://github.com/Hanifananda",
          ),
          Container(margin: EdgeInsets.only(top: 30)),
          developerItemComponent(
            "Report Writer",
            "Satrio Joyo Dono",
            github: "https://github.com/satriojoy",
          )
        ],
      ),
    );
  }

  Widget headerComponent() {
    return Text("About app", style: TextStyle(fontSize: 36));
  }

  Widget descriptionComponent() {
    return Text(
      "Aplikasi Halo Gan! ini dibuat untuk menyelesaikan tugas akhir Rancangan Perangkat Lunak semester 3 Kelas D 15 TI 15 Januari 2020",
      style: TextStyle(
        fontSize: 19,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget codeSourceComponent() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: <Widget>[
      //   Text(
      //     'Code for the app',
      //     style: TextStyle(fontSize: 18),
      //   ),
      //   OutlineButton.icon(
      //     icon: Icon(Icons.link),
      //     label: Text("Github"),
      //     onPressed: () {
      //       launchURL("github.com/vineeshvk/chat-app-flutter");
      //     },
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //   )
      // ],
    );
  }

  Widget developerItemComponent(
    String role,
    String name, {
    // String linkedIn,
    String github,
    String facebook,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          role,
          style: TextStyle(fontSize: 18),
        ),
        Container(margin: EdgeInsets.only(top: 5)),
        Row(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontSize: 23, color: PALE_ORANGE),
            ),
            Expanded(child: Container()),
            IconButton(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/icon/facebook-512.png",
                  width: 26,
                  height: 26,
                ),
              ),
              onPressed: () => launchURL(facebook),
            ),
            Container(margin: EdgeInsets.only(left: 5)),
            IconButton(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/icon/github_ic.png",
                  width: 26,
                  height: 26,
                ),
              ),
              onPressed: () async {
                await launchURL(github);
              },
            )
          ],
        )
      ],
    );
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
