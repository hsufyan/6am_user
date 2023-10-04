import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/controller/splash_controller.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';

import '../../../../util/images.dart';

class CookiesView extends StatelessWidget {
  const CookiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding =
        (MediaQuery.of(context).size.width - Dimensions.webMaxWidth) / 2;
    return Container(
      width: 400,
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeExtraSmall,
        // horizontal: ResponsiveHelper.isDesktop(context) ? padding : Dimensions.paddingSizeDefault,
        horizontal: 20,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.isDesktop(context)
                ? 0
                : Dimensions.paddingSizeExtraSmall),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(Images.logo),
          Text(
            "We heard you're cool..",
            style: robotoRegular.copyWith(
                color: Colors.grey.shade700, fontSize: 10),
          ),
          Text(
            "but we just want to make sure",
            style: robotoRegular.copyWith(
                color: Colors.grey.shade700, fontSize: 10),
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
            child: Text(
            
              Get.find<SplashController>().configModel!.cookiesText ??
                  'This is dummy cookies text',
              style: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeSmall, color: Colors.black87),
              maxLines: 10,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Get.find<SplashController>().saveCookiesData(false);
                },
                child: Text(
                  'no_thanks'.tr,
                  style: robotoRegular.copyWith(
                      color: Colors.black87,
                      fontSize: Dimensions.fontSizeSmall),
                )),
            SizedBox(
              width: ResponsiveHelper.isDesktop(context)
                  ? Dimensions.paddingSizeExtraLarge
                  : Dimensions.paddingSizeLarge,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(80, 35),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Get.find<SplashController>().saveCookiesData(true);
                  Get.find<SplashController>().cookiesStatusChange(
                      Get.find<SplashController>().configModel!.cookiesText ??
                          "This is dummy cookies text");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault, vertical: 5),
                  child: Center(
                    child: Text(
                      'yes_accept'.tr,
                      style: robotoRegular.copyWith(
                          color: Colors.black,
                          fontSize: Dimensions.fontSizeSmall),
                    ),
                  ),
                )),
         
          ]),
            SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                   
                  value: true, onChanged: (value){
                  value == true? value = false: value = true;
                  
                }),
              ),
              Text(
                "Remember me for 30 days",
                style: robotoRegular.copyWith(
                    color: Colors.grey.shade700, fontSize: 10),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
