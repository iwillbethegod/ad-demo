import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final YoutubePlayerController ytController =
  YoutubePlayerController(initialVideoId: "Crz1PpKk3dU");
  final YoutubePlayerController ytController2 =
  YoutubePlayerController(initialVideoId: "Crz1PpKk3dU", flags: YoutubePlayerFlags(autoPlay: false));

  BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "/6499/example/banner",
      listener: BannerAdListener(
          onAdLoaded: (ad){
            print("ad Loaded");
          },
          onAdFailedToLoad: (ad, err){
            print("failed to load ad: $err");
          }

      ),
      request: const AdRequest());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text("Demo"),
          ),
          body: Column(
            children: [
              // YoutubePlayer(controller: ytController2,),
              SizedBox(
                  height: bannerAd.size.height.toDouble(),
                  width: bannerAd.size.width.toDouble(),
                  child: AdWidget(ad: bannerAd))
            ],
          ),
        ));
  }
}
