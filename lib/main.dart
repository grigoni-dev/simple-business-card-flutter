import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      // appBar: AppBar(
      //   title: Text(
      //     "My Profile",
      //     style: TextStyle(
      //       fontSize: 16,
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Colors.amber.shade900,
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              maxRadius: 60.0,
              backgroundImage: NetworkImage(
                  'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.6435-9/95387513_3347454611932626_1354671928274583552_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=84a396&_nc_ohc=vtAdz0BaUKYAX-bCtiq&_nc_ht=scontent-mxp1-2.xx&oh=c858ff62225549e1c4821df0d52dadd0&oe=6091D1D8'),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
            ),
            Text(
              'Giovanni Rigoni',
              style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'SOFTWARE DEVELOPER',
              style: TextStyle(
                  fontFamily: 'Roboto-Bold',
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.blue.shade100,
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '+39 349 133 78 19',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontFamily: 'Roboto-Regular',
                      fontSize: 20.0,
                    ),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'grigoni.dev@gmail.com',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue.shade900,
                        fontFamily: 'Roboto-Regular'),
                  ),
                )),
            SizedBox(
              height: 20.0,
              width: 150.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: () => _launchSocial(
                      'https://www.facebook.com/giovanni.rigoni.5'),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram),
                  onPressed: () =>
                      _launchSocial('https://www.instagram.com/logicbomb_gr/'),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.linkedin),
                  onPressed: () => _launchSocial(
                      'https://www.linkedin.com/in/giovanni-rigoni-8799a1a3/'),
                  //onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber.shade900,
        child: Icon(
          Icons.share,
          color: Colors.white,
        ),
        onPressed: () =>
            Share.share('https://www.facebook.com/giovanni.rigoni.5'),
        //onPressed: () => showAlertDialog(context),
      ),
    );
  }
}

Future<void> showAlertDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(Icons.info_outline),
            Text('Status'),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Your profile has been shared via Whatsapp'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Chiudi',
              style: TextStyle(
                color: Colors.amber.shade900,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _launchSocial(String url) async {
  // Don't use canLaunch because of fbProtocolUrl (fb://)
  // try {
  //   bool launched =
  //       await launch(url, forceSafariVC: false, forceWebView: false);
  //   if (!launched) {
  //     await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  //   }
  // } catch (e) {
  //   await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  // }

  if (await launch(url, forceSafariVC: false, forceWebView: false)) {
    await launch(url, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }

  // if (await canLaunch(url)) {
  //   await launch(url, forceSafariVC: false);
  // } else {
  //   throw 'Could not launch $url';
  // }
}
