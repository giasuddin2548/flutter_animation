import 'package:animations/animations.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
             Center(child: InkWell(
                 onTap: (){
                   Navigator.push(
                       context, MaterialPageRoute(builder: (context) => const MyDelayedDisplay()));
                 },
                 child: const Text('Display'))),
             Center(child: InkWell(
                 onTap: (){
                   Navigator.push(
                       context, MaterialPageRoute(builder: (context) => const AnimationDisplay()));
                 },
                 child: const Text('Animation'))),

          ],
        ),
      ),


    );
  }
}



class MyDelayedDisplay extends StatefulWidget {
  const MyDelayedDisplay({Key? key}) : super(key: key);

  @override
  _MyDelayedDisplayState createState() => _MyDelayedDisplayState();
}

class _MyDelayedDisplayState extends State<MyDelayedDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display'),
      ),
      body:  DelayedDisplay(
        slidingCurve: Curves.easeOutCubic,
        delay: const Duration(seconds: 1),
        child: ListView.builder(
            itemCount: 30,
            itemBuilder: (c, i)=>Container(
              alignment: Alignment.centerLeft,
              color: Colors.grey.withOpacity(0.2),
              child: Text('Item-$i'),
              height: 40,margin: const EdgeInsets.all(3),width: double.infinity,)),
      ),
    );
  }
}



class AnimationDisplay extends StatefulWidget {
  const AnimationDisplay({Key? key}) : super(key: key);

  @override
  _AnimationDisplayState createState() => _AnimationDisplayState();
}

class _AnimationDisplayState extends State<AnimationDisplay> {
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (c, i)=>OpenContainer(
              transitionDuration: const Duration(seconds: 1),
              transitionType: _transitionType,
              closedBuilder: (c, openWidget)=>InkWell(
              onTap: openWidget,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.grey.withOpacity(0.2),
                child: Text('Item-$i'),
                height: 40,margin: const EdgeInsets.all(3),width: double.infinity,),
          ), openBuilder: (context, closeWidget)=>const Details())),
    );
  }
}

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  var dummy="Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          SizedBox(height: 200,width: double.infinity,child: Image.network('http://www.activateespnonroku.com/wp-content/uploads/2022/04/technology-banner-background-with-hexagonal-shapes-and-text-space_1017-22589.jpg', fit: BoxFit.cover,),),
          const Padding(
            padding: EdgeInsets.only(left: 3, top: 5),
            child: SizedBox(height: 40,width: double.infinity,child: Text('Flutter Container transform', style: TextStyle(fontSize: 18),),),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 3, top: 5),
            child: SizedBox(height: 40,width: double.infinity,child: Text(dummy, style: const TextStyle(fontSize: 12),),),
          )
        
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //
      // }, child: const Icon(Icons.add),),
      
      floatingActionButton: OpenContainer(
          transitionDuration: const Duration(milliseconds: 1000),
          closedColor: Colors.pink,
          closedBuilder: (BuildContext c, VoidCallback action){
            return const SizedBox(
              height: 56,
              width: 56,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            );
          },
          openBuilder: (BuildContext c, VoidCallback action) {
          return MyDelayedDisplay();
    },
      tappable: true,
      closedElevation: 6.0,
      closedShape: const CircleBorder(),
    ),
      
      
    );
  }
}





