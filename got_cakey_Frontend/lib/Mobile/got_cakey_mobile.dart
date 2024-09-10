import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/Mobile/login_signup/login_gotcakey.dart';
import 'package:got_cakey_mobile/Mobile/login_signup/signup_gotcakey.dart';
import 'package:video_player/video_player.dart';

class GotCakeyMobile extends StatefulWidget {
  const GotCakeyMobile({super.key});

  @override
  State<GotCakeyMobile> createState() => _GotCakeyMobileState();
}

class _GotCakeyMobileState extends State<GotCakeyMobile> {
  late VideoPlayerController controller;
  late Future<void> videoFuture;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/intro.mp4');

    videoFuture = controller.initialize();
    controller.setLooping(true);
    controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder(
            future: videoFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            top: size.height * 0.15,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/gotcakey.png',
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Image.asset('assets/logo.png')
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            child: Container(
              height: 110,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(160, 55),
                          shadowColor: Colors.transparent,
                          backgroundColor: const Color.fromRGBO(146, 4, 190, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GotCakeyLogin(),
                            ));
                        // context.pushNamed('login');
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(160, 55),
                          backgroundColor:
                              const Color.fromRGBO(244, 231, 248, 1),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GotCakeySignUp(),
                            ));
                        // context.pushNamed('signup');
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(color: Color.fromRGBO(146, 4, 190, 1)),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
