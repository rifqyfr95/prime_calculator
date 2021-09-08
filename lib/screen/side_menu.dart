import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

/*
Using icon from FlatIcon
<div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
 */
class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Rifqy Fakhrul Rijal"),
              accountEmail: Text("rifqyfakhrul.rfr@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pasfoto.jpg'),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/background.jpg')))),
          ListTile(
            leading: Image(
              image: AssetImage('images/linkedin.png'),
              width: 30.0,
              height: 30.0,
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'LinkedIn',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "https://www.linkedin.com/in/rifqy-fakhrul-rijal-170155136/",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            onTap: () async {
              Navigator.of(context).pop();
              final url =
                  "https://www.linkedin.com/in/rifqy-fakhrul-rijal-170155136/";
              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false, forceWebView: true);
              }
            },
          ),
          ListTile(
            leading: Image.asset(
              'images/github.png',
              width: 30.0,
              height: 30.0,
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'GitHub',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "https://github.com/rifqyfr95",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )
              ],
            ),
            onTap: () async {
              Navigator.of(context).pop();
              final url = "https://github.com/rifqyfr95";
              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false, forceWebView: true);
              }
            },
          ),
          ListTile(
            title: Html(
              data: """
              <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
              """,
            ),
          ),
        ],
      ),
    );
  }
}
