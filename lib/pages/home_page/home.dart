import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pagination/common/constant/color.dart';
import 'package:pagination/common/widget/widget.dart';
import 'package:pagination/model/records_model.dart';
import 'package:pagination/pages/home_page/home_page_viewmodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List userdataList = List.generate(15, (index) => null);
  int initialPage = 10;
  ScrollController scrollController = ScrollController();
  HomePageViewModel? homePageViewModel;
  var pos = 1;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          userdataList.length <= 50) {
        loadData();
      } else if (userdataList.length >= 50) {
        Fluttertoast.showToast(
          msg: 'No Data Found.!',
          textColor: ColorResources.White,
          backgroundColor: ColorResources.Red,
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: topAppBar('Pagination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scrollbar(
          controller: scrollController,
          hoverThickness: 100,
          radius: Radius.circular(10),
          child: homePageViewModel == null ? userList() : Text('data'),
        ),
      ),
    );
  }

  Widget userList() {
    return Container(
      decoration: BoxDecoration(
          color: ColorResources.Red.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          controller: scrollController,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            pos = index + 1;

            return ListTile(
              leading: Icon(Icons.supervised_user_circle_outlined),
              title: Text(
                '${homePageViewModel!.recordsModel!.title}',
                style: TextStyle(color: ColorResources.White),
              ),
              trailing: Text(
                '${homePageViewModel!.recordsModel!.id}',
                style: TextStyle(color: ColorResources.White),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 5, color: Colors.black);
          },
          itemCount: userdataList.length,
        ),
      ),
    );
  }

  Widget showAPILoader() {
    return Center(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(ColorResources.Orange),
              strokeWidth: 5,
              backgroundColor: ColorResources.White,
            ),
          )
        ],
      ),
    );
  }

  Future loadData() async {
    Fluttertoast.showToast(
      msg: 'Loading data.!',
      textColor: ColorResources.White,
      backgroundColor: ColorResources.Orange,
    );
    for (int i = initialPage; i < initialPage + 10; i++) {
      userdataList.add(i + 1);
    }
    initialPage = initialPage + 10;
    setState(() {});
  }
}
