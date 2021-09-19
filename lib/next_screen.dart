import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class NextScreen extends StatelessWidget {
  static const routeName = 'NextScreen';

  final List<String> image = [
    'images/bob1.jpeg',
    'images/bob2.jpeg',
    'images/bob3.jpeg',
    'images/bob4.jpeg',
    'images/bob5.jpeg',
    'images/bob6.jpeg',
    'images/bob7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Container(
            color: Color.fromRGBO(52, 91, 99, 1),
            child: ClipPath(
              clipper: WaveClipperOne(),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(52, 91, 99, 1),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Massage'),
                      Tab(text: 'Memories'),
                    ],
                  ),
                  centerTitle: true,
                  title: Text(
                    'Happy Birthday',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                body: TabBarView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 36, bottom: 36, right: 16, left: 16),
                      child: Card(
                        elevation: 10,
                        shadowColor: Color.fromRGBO(52, 91, 99, 1),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                                ' سوري علي التاخير بس حبيت اعمل حاجه مختلفه عن كل مره اي نعم هي مش واو قوي بس الي قدرت عليه...        ',
                                textStyle: TextStyle(fontSize: 20)),
                            TyperAnimatedText(
                                'طبعا انا عرفتك من سنتين و المساعده الي انت ساعدتني بيها كانت كبيره قوي يعني الف ابليكيشن مش هيكفي و دلقتي سعدتك اتخرجت مش هشوفك زي الاول بس وعد مش هتتنسي ميرسي جدا علي كل الي انت عملته معاعا بجد لولاك انا مكنتش هوصل لكده كفايه الدعم المعنوي بوص انا مش عارف اظبطه قوي علي شان كده هديك الكودلاني معرفش اعمل اكتر من كده بصراحه يارب يعجبك',
                                textStyle: TextStyle(fontSize: 20)),
                            TyperAnimatedText(
                                'يلا انا مش هطول عليك اكتر من كده اصلا انت هيطلع عينك علي شان انا مش عارف اظبط الانيميشن بس مش مهم بقي ',
                                textStyle: TextStyle(fontSize: 20)),
                            TyperAnimatedText(
                                'Happy Birthday Broooooo , Wish you a million years\n\n  Kerollos Sameh',
                                textStyle: TextStyle(fontSize: 30)),
                          ],
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                          pause: Duration(seconds: 2),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
                      child: Card(
                        color: Color.fromRGBO(52, 91, 99, 1),
                        elevation: 10,
                        shadowColor: Color.fromRGBO(52, 91, 99, 1),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                                child: Image(image: AssetImage(image[index])));
                          },
                          itemCount: image.length,
                          padding: EdgeInsets.all(5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
