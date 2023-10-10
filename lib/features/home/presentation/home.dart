import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:luvit/common/custom/bottom_naviation_bar.dart';
import 'package:luvit/others/draggable_widget.dart';
import 'package:luvit/others/likes_widget.dart';
import 'package:luvit/others/tab_bar.dart';
import 'package:luvit/others/tag.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier indexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/ic_location.png'),
            const Text(
              '목이길어슬픈기린님의 새로운 스팟',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFCFCFC)),
            ),
          ],
        ),
        actions: [
          const LikesWidget(),
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                Image.asset('assets/images/ic_notification.png'),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  end: 0,
                  top: 4,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF016B),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Swiper(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final controller = PageController(initialPage: 0);

            final images = [
              'assets/images/girl.jpg',
              'assets/images/girl2.jpg',
              'assets/images/girl3.jpg'
            ];

            return DraggableCard(
              child: ClipRRect(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.3), width: 1.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        PageView.builder(
                            controller: controller,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return LayoutBuilder(
                                  builder: (context, constraints) {
                                return GestureDetector(
                                  onTapUp: (details) {
                                    // Get the horizontal position of the tap
                                    final tapX = details.localPosition.dx;

                                    // Get the width of the card (you can customize this)
                                    final cardWidth = constraints.maxWidth / 2;

                                    // Calculate the horizontal center of the card
                                    final cardCenter = cardWidth / 2;

                                    if (tapX < cardCenter) {
                                      // Tap occurred on the left side
                                      int ind =
                                          (controller.page?.toInt() ?? 0) - 1;
                                      if (ind >= 0) {
                                        indexNotifier.value = ind;
                                        controller.jumpToPage(ind);
                                      }
                                    } else {
                                      // Tap occurred on the right side
                                      int ind =
                                          (controller.page?.toInt() ?? 0) + 1;
                                      if (ind <= images.length - 1) {
                                        indexNotifier.value = ind;
                                        controller.jumpToPage(ind);
                                      }
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      SizedBox.expand(
                                        child: Image.asset(
                                          images[index],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.8),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const LikesWidget(),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            text: '잭과분홍콩나물',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 28,
                                                                shadows: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.3),
                                                                      offset:
                                                                          const Offset(
                                                                              0,
                                                                              1)),
                                                                ]),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text: ' 25',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontSize:
                                                                        24,
                                                                    shadows: [
                                                                      BoxShadow(
                                                                          color: Colors.black.withOpacity(
                                                                              0.3),
                                                                          offset: const Offset(
                                                                              0,
                                                                              1)),
                                                                    ]),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            String subTitle =
                                                                '';
                                                            if (indexNotifier
                                                                    .value ==
                                                                0) {
                                                              subTitle =
                                                                  '서울 • 2km 거리에 있음';
                                                            } else if (indexNotifier
                                                                    .value ==
                                                                1) {
                                                              subTitle =
                                                                  '서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다';
                                                            }

                                                            if (subTitle
                                                                .isNotEmpty) {
                                                              return Text(
                                                                subTitle,
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    shadows: [
                                                                      BoxShadow(
                                                                          color: Colors.black.withOpacity(
                                                                              0.3),
                                                                          offset: const Offset(
                                                                              0,
                                                                              1)),
                                                                    ]),
                                                              );
                                                            } else {
                                                              return const Wrap(
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                spacing: 10,
                                                                runSpacing: 10,
                                                                children: [
                                                                  Tag(
                                                                    label:
                                                                        "💖 진지한 연애를 찾는 중",
                                                                    primary:
                                                                        true,
                                                                  ),
                                                                  Tag(
                                                                      label:
                                                                          "🥂 전혀 안 함"),
                                                                  Tag(
                                                                      label:
                                                                          "🚬 비흡연"),
                                                                  Tag(
                                                                      label:
                                                                          "💪🏻 매일 1시간 이상"),
                                                                  Tag(
                                                                      label:
                                                                          "🤝 만나는 걸 좋아함"),
                                                                  Tag(
                                                                      label:
                                                                          "INFP"),
                                                                ],
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Image.asset(
                                                        'assets/images/ic_heart.png'),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ValueListenableBuilder(
                              valueListenable: indexNotifier,
                              builder: (context, index, child) {
                                return CustomTabBar(
                                  noOfTabs: images.length,
                                  currentIndex: index,
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 10,
          viewportFraction: 0.9,
          scale: 1,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
