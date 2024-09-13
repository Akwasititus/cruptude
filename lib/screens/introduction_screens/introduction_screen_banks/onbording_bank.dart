import 'package:flutter/material.dart';

//introduction content model
class IntroductionContent {
  String introduction_contentUrl;

  //contractor
  IntroductionContent({
    required this.introduction_contentUrl,
  });
}

// a simple class holding the getIntroductionContent method

List<IntroductionContent> getIntroductionContent = [
  IntroductionContent(
    introduction_contentUrl: 'images/intro.png',
  ),
  IntroductionContent(
    introduction_contentUrl: 'images/intro.png',
  ),
  IntroductionContent(
    introduction_contentUrl: 'images/intro.png',
  ),
  IntroductionContent(
    introduction_contentUrl: 'images/intro.png',
  ),
  IntroductionContent(
    introduction_contentUrl: 'images/intro.png',
  ),
];
