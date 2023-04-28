import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/on_board.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreenController extends StatefulWidget {
  const MainScreenController({Key? key}) : super(key: key);

  @override
  State<MainScreenController> createState() => _MainScreenControllerState();
}

PageController _controller = PageController();

class _MainScreenControllerState extends State<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    List<OnBoarding> onBoardingScreens = [
      OnBoarding(
        imageUrl: 'images/on_board_1.png',
        subTitle:
            'We use the best local ingredients to create fresh and delicious food and drinks.',
        title: 'Diverse & sparkling food',
      ),
      OnBoarding(
        imageUrl: 'images/on_board_2.png',
        subTitle:
            'Free shipping on the primary order whilst the usage of Capay fee method.',
        title: 'Free shipping on all orders',
      ),
      OnBoarding(
        imageUrl: 'images/on_board_3.png',
        subTitle:
            'Easily find your favorite food and have it delivered in record time.',
        title: '+24K Restaurants',
      ),
    ];
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: onBoardingScreens.length,
          itemBuilder: (context, index) {
            return onBoardingScreens[index];
          },
        ),
        Positioned(
          bottom: 170,
          left: MediaQuery.of(context).size.width / 2 - 50,
          child: SmoothPageIndicator(
            controller: _controller,
            effect: ExpandingDotsEffect(
              expansionFactor: 3,
              dotHeight: 5,
              activeDotColor: kPrimaryColor,
            ),
            count: onBoardingScreens.length,
          ),
        ),
        Positioned(
          left: 35,
          right: 35,
          bottom: 60,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login-screen');
            },
            child: Container(
              height: 44,
              width: 305,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
