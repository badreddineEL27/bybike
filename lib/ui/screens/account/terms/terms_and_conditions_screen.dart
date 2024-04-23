import 'package:bybike/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 16),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
              size: 35,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background-transparent.png",
            ),
          ),
        ),
        child:  SingleChildScrollView(
          padding: EdgeInsets.only(left:16,right: 16, bottom: Get.height * 0.1),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text(
                "Conditions et Politique de confidentialité",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Conditions générales:\nUtilisation du service: En utilisant ce service, vous acceptez de vous conformer aux conditions d'utilisation. Si vous n'acceptez pas ces conditions, veuillez ne pas utiliser le service. \nDroits de propriété intellectuelle: Le contenu du service, y compris le texte, les graphiques, les logos, les images, les clips audio et vidéo, est la propriété exclusive du service ou de ses concédants de licence. \nResponsabilité: Le service ne peut être tenu responsable des dommages directs, indirects, spéciaux, consécutifs, ou autres, résultant de l'utilisation ou de l'incapacité à utiliser le service.\nPolitique de confidentialité: \nCollecte d'informations: Nous recueillons des informations lorsque vous utilisez notre service. Cela peut inclure des informations personnelles telles que votre nom, votre adresse e-mail, etc.\nUtilisation des informations: Les informations que nous collectons peuvent être utilisées pour personnaliser votre expérience et améliorer notre service. Nous ne partagerons pas vos informations personnelles avec des tiers sans votre consentement. \nCookies: Notre service utilise des cookies pour améliorer l'expérience utilisateur. Vous pouvez configurer votre navigateur pour refuser tous les cookies ou pour indiquer quand un cookie est envoyé.\nSécurité: Nous mettons en œuvre des mesures de sécurité pour protéger vos informations personnelles contre tout accès non autorisé",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
