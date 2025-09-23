import 'package:e_commerce_app/app_textstyles.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnBoardingItem> _items = [
    OnBoardingItem(
      description:'Explore the newest fashion trends'
      title: 'Discover the Latest Trends',
      image: 'image',
      
     ),
    OnBoardingItem(
        description: 'Shop premium quality products from top brands worldwide',
        title: 'Quality products',
        image: 'image',
      ),
    OnBoardingItem(
        description: 'Simple and Secure shopping experience',
        title: 'title',
        image: 'image',
      )
  ];
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark ;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index){

            },
            itemBuilder: (context,index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height*0.4,
                  ),
                    const SizedBox(height:40),
                    Text(
                      _items[index].image,
                      style:AppTextstyles.withColor(AppTextstyles.h1, Theme.of(context).textTheme.bodyLarge!.color!)
                    ),
                    const SizedBox(height:16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        _items[index].description,
                        style:AppTextstyles.bodyLarge,
                        isDark? Colors.grey[400]! :Colors.grey[600]!,
                      ),
                    )
                ],
              );
            }
              
          )
        ],
      ),
    )
    ;
  }
}

class OnBoardingItem {
  final String image;
  final String title;
  final String description;
}
