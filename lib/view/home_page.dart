import 'package:flutter/material.dart';
import 'package:owatech_test/model/home_card_model.dart';
import 'package:owatech_test/presenter/meme_presenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements MemeListViewContract{
  late MemeListPresenter _presenter;
  late List<HomeCardModel> _memes;

  late bool _show = false;

  Widget _bottomSheetItem({
    required String title,
    required String content,
    required IconData icon,
    required Color color
}){
    return Container(
      height: 50,
      width: 320,
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  content,
                  style: const TextStyle(
                      fontSize: 12,
                    color: Colors.black45
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget? _showBottomSheet()
  {
    if(_show)
    {
      return BottomSheet(
        elevation: 10.0,
        backgroundColor: Colors.transparent,
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: 70,
                    child: Divider(
                      height: 5,
                      color: Colors.grey,
                      thickness: 5,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bottomSheetItem(
                        title: 'Meme World',
                        content: 'enjoy your endless scroll of interesting memes',
                        icon: Icons.face,
                        color:Colors.red
                    ),
                    _bottomSheetItem(
                        title: 'Counselling',
                        content: 'don’t go through it alone. Reach out and let’s help.',
                        icon:Icons.pending_actions,
                        color: Colors.amber
                    ),
                    _bottomSheetItem(
                        title: 'Resource Center',
                        content: 'get yourself prepared for your exam.',
                        icon: Icons.menu_book_outlined,
                        color:Colors.deepOrangeAccent
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
    }
    else{
      return null;
    }
  }

  Widget _getMemeItem(HomeCardModel carItem){
    return Container(
        width: 360,
        height: 282,
        margin: const EdgeInsets.all(10),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 360,
                    height: 282,
                    decoration: BoxDecoration(
                      borderRadius : const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      image : DecorationImage(
                          image: AssetImage(carItem.imagePath),
                          fit: BoxFit.cover
                      ),
                    ),
                  )
              ),
              Positioned(
                  top: 184,
                  left: 18,
                  child: SizedBox(
                    width: 320,
                    child: Text(
                      carItem.description,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 14,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                  )
              ),
              Positioned(
                  top: 236,
                  left: 102,
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Stack(
                          children: const <Widget>[
                            Positioned(
                                top: 2.999971628189087,
                                left: 3,
                                child: Icon(
                                  Icons.mode_comment_outlined,
                                  color: Colors.white,
                                )
                            ),
                          ]
                      )
                  )
              ),
              Positioned(
                  top: 236,
                  left: 18,
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      // decoration: BoxDecoration(
                      //   color : Color.fromRGBO(255, 255, 255, 1),
                      // ),
                      child: Stack(
                          children: const <Widget>[
                            Positioned(
                              top: 2.9981744289398193,
                              left: 1.5487092733383179,
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white,
                              ),
                              // child: SvgPicture.asset(
                              //     'assets/images/vector.svg',
                              //     semanticsLabel: 'vector'
                              // );
                            ),
                          ]
                      )
                  )
              ),
              Positioned(
                  top: 236,
                  left: 186,
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      // decoration: BoxDecoration(
                      //   color : Color.fromRGBO(255, 255, 255, 1),
                      // ),
                      child: Stack(
                          children: const <Widget>[
                            Positioned(
                                top: 2.999971628189087,
                                left: 3,
                                child: Icon(
                                  Icons.system_security_update_rounded,
                                  color: Colors.white,
                                )
                            )
                          ]
                      )
                  )
              ),
               Positioned(
                  top: 240,
                  left: 47,
                  child: Text('${carItem.like}k', textAlign: TextAlign.left, style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Lato',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
               Positioned(
                  top: 240,
                  left: 131,
                  child: Text('${carItem.comment}k', textAlign: TextAlign.left, style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Lato',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
               Positioned(
                  top: 240,
                  left: 215,
                  child: Text('${carItem.share}k', textAlign: TextAlign.left, style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Lato',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
              Positioned(
                top: 10,
                left: 280,
                child:Container(
                  width: 70,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                          'Loved',
                          style:TextStyle(
                              fontSize: 12,
                              color: Colors.white
                          )
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius : const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    gradient: LinearGradient(
                      end: const Alignment(0.0, -1),
                      begin: const Alignment(0.0, 0.1),
                      colors: <Color>[
                        const Color(0x8A000000),
                        Colors.black12.withOpacity(0.0)
                      ],
                    ),

                  ),
                ),
              ),
            ]
        )
    );
  }

  Widget _memeWidget(){
    return Column(
      children: [
        Flexible(
            child: ListView.builder(
              itemCount: _memes.length,
              itemBuilder: (BuildContext context, int index){
                final HomeCardModel cardModel = _memes[index];

                return _getMemeItem(cardModel);
              }
            )
        )
      ],
    );
}

  _HomePageState(){
    _presenter = MemeListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10)).then((_) {
      setState(() {
        _show = true;
      });
    });

    _presenter.loadMemes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Material(
              color: Colors.grey,
              shape: CircleBorder(),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi, Claver',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
              Text(
                'How are you doing?',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black38
                ),
              )
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                  Icons.settings,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Center(child: _memeWidget()),
        bottomSheet: _showBottomSheet()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void onLoadMemeComplete(List<HomeCardModel> items) {
    setState(() {
      _memes = items;
    });
  }

  @override
  void onLoadMemeError() {
    // TODO: implement onLoadMemeError
  }
}
