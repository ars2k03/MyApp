import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/Contact.dart';
import 'package:myapp/Projects.dart';
import 'package:myapp/Skills.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Image.dart';
import 'chatbot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  dynamic mysnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(

      ),


      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.play_pause,
        animatedIconTheme: const IconThemeData(size: 30),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        buttonSize: const Size(60, 60),
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 30,
            ),
            backgroundColor: const Color(0xFF25D366),
            onTap: () async {
              final String number = "+8801771259478";
              final String message = "Hello, Arafat";
              final String whatsAppUrl =
                  "https://wa.me/$number?text=${Uri.encodeFull(message)}";

              try {
                if (await canLaunchUrl(Uri.parse(whatsAppUrl))) {
                  await launchUrl(Uri.parse(whatsAppUrl),
                      mode: LaunchMode.externalApplication);
                } else {
                  mysnackBar("WhatsApp is not installed", context);
                }
              } catch (e) {
                mysnackBar("Error launching WhatsApp: $e", context);
              }
            },
            label: "Whatsapp",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(
              Icons.email_rounded,
              color: Colors.lightBlue,
              size: 28,
            ),
            backgroundColor: Colors.white,
            onTap: () async {
              final String email = "arafatsohan2003@gmail.com";
              final String subject = "Feedback";
              final String body =
                  "Hello Arafat \n\n I saw your portfolio and...";

              final Uri emailUri = Uri.parse(
                  'mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}');

              try {
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri,
                      mode: LaunchMode.externalApplication);
                } else {
                  await launchUrl(emailUri);
                }
              } catch (e) {
                mysnackBar("Error launching email: $e", context);
              }
            },
            label: "Email",
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.linkedinIn,
              color: Colors.white,
              size: 30,
            ),
            backgroundColor: Colors.blue,
            onTap: () async {
              const String linkedinUrl = "https://www.linkedin.com/in/ars2k03";
              try {
                if (await canLaunchUrl(Uri.parse(linkedinUrl))) {
                  await launchUrl(Uri.parse(linkedinUrl),
                      mode: LaunchMode.externalApplication);
                } else {
                  mysnackBar("LinkedIn is not installed", context);
                }
              } catch (e) {
                mysnackBar("Error launching LinkedIn: $e", context);
              }
            },
            label: "LinkedIn",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.github,
              color: Colors.white,
              size: 45,
            ),
            backgroundColor: Colors.black,
            onTap: () async {
              const String githubUrl = "https://github.com/ars2k03";
              try {
                if (await canLaunchUrl(Uri.parse(githubUrl))) {
                  await launchUrl(Uri.parse(githubUrl),
                      mode: LaunchMode.externalApplication);
                }
              } catch (e) {
                mysnackBar("Error launching Github: $e", context);
              }
            },
            label: "Github",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.telegram,
              color: Colors.white,
              size: 30,
            ),
            backgroundColor: Colors.lightBlue,
            onTap: () async {
              const String telegramUrl = "https://t.me/ars2k03";
              try {
                if (await canLaunchUrl(Uri.parse(telegramUrl))) {
                  await launchUrl(Uri.parse(telegramUrl),
                      mode: LaunchMode.externalApplication);
                } else {
                  mysnackBar("Telegram is not installed", context);
                }
              } catch (e) {
                mysnackBar("Error launching Telegram: $e", context);
              }
            },
            label: "Telegram",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.xTwitter,
              color: Colors.white,
              size: 30,
            ),
            backgroundColor: Colors.black,
            onTap: () async {
              const String xUrl = "https://x.com/ars_2k03";
              try {
                if (await canLaunchUrl(Uri.parse(xUrl))) {
                  await launchUrl(Uri.parse(xUrl),
                      mode: LaunchMode.externalApplication);
                } else {
                  mysnackBar("X (Twitter) is not installed", context);
                }
              } catch (e) {
                mysnackBar("Error launching X (Twitter): $e", context);
              }
            },
            label: "X (Twitter)",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.discord,
              color: Colors.white,
              size: 28,
            ),
            backgroundColor: Colors.indigoAccent,
            onTap: () async {
              const String discordUrl =
                  "https://discord.com/users/1426787015101513738";
              try {
                if (await canLaunchUrl(Uri.parse(discordUrl))) {
                  await launchUrl(Uri.parse(discordUrl),
                      mode: LaunchMode.externalApplication);
                } else {
                  mysnackBar("Discord is not installed", context);
                }
              } catch (e) {
                mysnackBar("Error launching Discord: $e", context);
              }
            },
            label: "Discord",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.white,

            child: Image.asset("assets/images/bot.png",
              height: 45,
              width: 45,
            ),
            labelBackgroundColor: Colors.white,
            label: "Ask me",
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),

            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => const Chatbot(),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}