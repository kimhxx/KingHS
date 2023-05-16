import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GG',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: NavPage(),
    );
  }
}


class NavPage extends StatefulWidget {
  @override
  State<NavPage> createState() => _MyStatusPageState();
}

class _MyStatusPageState extends State<NavPage> {
  int currentIndex = 2;

  final List<Widget> pages = [
    MyProfile(),
    MyStatusPage(),
    MyHomePage(),
    SearchPage(),
    MyCheckPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person), label: "프로필",),
          NavigationDestination(icon: Icon(Icons.calculate), label: "학점계산기"),
          NavigationDestination(icon: Icon(Icons.home), label: '홈'),
          NavigationDestination(icon: Icon(Icons.search), label: '검색'),
          NavigationDestination(icon: Icon(Icons.done), label: '졸업요소'),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class Season_Category extends StatefulWidget {
  const Season_Category({Key? key}) : super(key: key);

  @override
  State<Season_Category> createState() => _Season_CategotyState();
}

class _Season_CategotyState extends State<Season_Category> {
  int selectedCategory = 0;
  List<String> season = ["1학년 1학기", "1학년 2학기", "2학년 1학기", "2학년 2학기", "3학년 1학기",
  "3학년 2학기", "4학기 1학기", "4학년 2학기"];

  final ValueNotifier<String> selectedSeasonNotifier = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: season.length,
          itemBuilder: (context, index) => buildCategory(index, context)),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedCategory = index;
          });
          selectedSeasonNotifier.value = season[index];

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                  season[index],
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: index == selectedCategory
                          ? Colors.black
                          : Colors.black.withOpacity(0.4),
                  fontSize: 12.0)
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectedCategory
                      ? Colors.grey
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}


class MyStatusPage extends StatelessWidget {
  const MyStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.0,
          ),
          TextButton(
            onPressed: () {
              print('졸업 시켜줘');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '졸업.GG\n',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '경상국립대학교',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '\n\nMY STATUS',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text('\n     ●  CREDITS',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '       65 / 130',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text('\n     ●  GPA',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '       4.2 / 4.5',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Season_Category(),
          // Add additional widgets as needed
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.0,
          ),
          TextButton(
            onPressed: () {
              print('졸업 시켜줘');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '졸업.GG\n',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '경상국립대학교',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '\n\nMY STATUS',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text('\n     ●  CREDITS',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
          Text(
            '       홈페이지 기초 페이지',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text('\n   ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '팀 5인큐 화이팅!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // Add additional widgets as needed
          Spacer(),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.0,
          ),
          TextButton(
            onPressed: () {
              print('졸업 시켜줘');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '졸업.GG\n',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '경상국립대학교',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '\n\nMY STATUS NOW',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Text('\n\n써치 기초 페이지',
            style: TextStyle(
                fontSize: 30
            ),),
          // Add additional widgets as needed
          Spacer(),
        ],
      ),
    );
  }
}

class MyCheckPage extends StatelessWidget {
  const MyCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.0,
          ),
          TextButton(
            onPressed: () {
              print('졸업 시켜줘');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '졸업.GG\n',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '경상국립대학교',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '\n\nMY STATUS NOW',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Text('\n\n체크 기초 페이지',
            style: TextStyle(
                fontSize: 30
            ),
          ),
          // Add additional widgets as needed
          Spacer(),
        ],
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.0,
          ),
          TextButton(
            onPressed: () {
              print('졸업 시켜줘');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '졸업.GG\n',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '경상국립대학교',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '\n\nMY STATUS NOW',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Text('\n\n프로필 기초 페이지',
          style: TextStyle(
            fontSize: 30
          ),),
          // Add additional widgets as needed
          Spacer(),
        ],
      ),
    );
  }
}

