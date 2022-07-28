import 'package:get/get.dart';

class Dimensions {
  //the screen actual size
  static double screenHeight = Get.context!.height; //height = 868.6
  static double screenWidth = Get.context!.width; // width = 411.4

  //sizing to each screen it is  displayed to
  static double pageView = screenHeight / 2.6;
  static double pageViewContainer = screenHeight / 3.8;
  static double pageViewTextContainer = screenHeight / 7.0;

  //height of the sizedbox, padding and margin resized
  static double sizedBoxHeight10 = screenHeight / 86.9;
  static double sizedBoxHeight5 = screenHeight / 173.7;
  static double sizedBoxHeight15 = screenHeight / 58;
  static double sizedBoxHeight20 = screenHeight / 43.4;
  static double sizedBoxHeight30 = screenHeight / 28.95;
  static double sizedBoxHeight40 = screenHeight / 21.7;
  static double sizedBoxHeight45 = screenHeight / 19.3;
  static double sizedBoxHeight50 = screenHeight / 17.4;
  static double sizedBoxHeight100 = screenHeight / 9.0;
  static double sizedBoxHeight110 = screenHeight / 7.0;
  static double sizedBoxHeight600 = screenHeight / 1.4;

  //width for padding and marging
  static double width10 = screenWidth / 41.1;
  static double width5 = screenWidth / 82.3;
  static double width15 = screenWidth / 27.42;
  static double width20 = screenWidth / 20.6;
  static double width30 = screenWidth / 13.7;
  static double width40 = screenWidth / 10.3;
  static double width45 = screenWidth / 9.1;
  static double width50 = screenWidth / 8.2;
  static double width100 = screenWidth / 4.1;
  static double width110 = screenWidth / 3.3;
  static double width220 = screenWidth / 1.87;
  static double width400 = screenWidth / 1.87;

  //font size for big text resized
  static double font20 = screenHeight / 43.43;
  static double font16 = screenHeight / 52.8;
  static double font25 = screenHeight / 34.74;
  static double font26 = screenHeight / 32.5;

  //Border radius reduced
  static double radius10 = screenHeight / 84.4;
  static double radius20 = screenHeight / 42;
  static double radius30 = screenHeight / 28;
}
