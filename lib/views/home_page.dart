import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:never_have_i_ever/components/side_drawer.dart';
import 'package:never_have_i_ever/constants/data.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.asset(
            "assets/giphy.gif",
            fit: BoxFit.cover,
            height: Get.height,
            width: Get.width,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Swiper(
                controller: swiperController,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.amberAccent,
                    elevation: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Center(
                          child: Text(
                        neverHaveIEverData[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                },
                itemCount: neverHaveIEverData.length,
                itemWidth: Get.width,
                itemHeight: Get.height * .7,
                layout: SwiperLayout.TINDER,
              ),
              Center(
                child: SizedBox(
                  width: Get.width * .4,
                  height: 70,
                  child: ElevatedButton(
                      onPressed: () {
                        swiperController.next(animation: true);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Next",
                              style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Icon(Icons.navigate_next,color: Colors.purple,size: 30,)
                        ],
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
