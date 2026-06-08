import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingWhatsAppButton extends StatelessWidget {
  final String phoneNumber;
  final String? message;

  const FloatingWhatsAppButton({
    super.key,
    this.phoneNumber = '256741074382', // Replace with your actual WhatsApp number
    this.message,
  });

  Future<void> _launchWhatsApp() async {
    final String whatsappUrl =
        'https://wa.me/$phoneNumber${message != null ? '?text=${Uri.encodeComponent(message!)}' : ''}';

    try {
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(
          Uri.parse(whatsappUrl),
          mode: LaunchMode.externalApplication,
        );
      } else {
        debugPrint('Could not launch WhatsApp');
      }
    } catch (e) {
      debugPrint('Error launching WhatsApp: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Material(
        elevation: 6,
        shape: const CircleBorder(),
        color: const Color(0xFF25D366), // WhatsApp green
        child: InkWell(
          onTap: _launchWhatsApp,
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: 48,
              height: 48,
              child: FittedBox(
                child: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
