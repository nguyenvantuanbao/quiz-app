import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Model/categorymastermodel.dart';
import 'package:quizapp/Theme/color.dart';
import 'package:quizapp/Utils/adhelper.dart';
import 'package:quizapp/Utils/sharepref.dart';
import 'package:quizapp/provider/apiprovider.dart';
import 'package:quizapp/widget/customwidget.dart';
import 'package:quizapp/widget/myappbar.dart';
import 'package:quizapp/widget/mynetimage.dart';
import 'package:quizapp/widget/mytext.dart';
import 'praticelevel.dart';

class PratiseCategory extends StatefulWidget {
  final String? type;
  final String? masterId;
  const PratiseCategory({Key? key, this.type, this.masterId}) : super(key: key);

  @override
  State<PratiseCategory> createState() => _PratiseCategoryState();
}

class _PratiseCategoryState extends State<PratiseCategory> {
  SharePref sharePref = SharePref();
  List<Result>? categoryList = [];

  @override
  initState() {
    debugPrint('===>Type ${widget.type}');
    debugPrint('===>MasterId ${widget.masterId}');
    if (widget.type.toString() == 'practise') {
      final categorydata = Provider.of<ApiProvider>(context, listen: false);
      categorydata.getCategoryByLevelMaster(context, widget.masterId);
      return;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categorydata = Provider.of<ApiProvider>(context);
    if (!categorydata.loading) {
      debugPrint('category===>$categorydata');
      categoryList = categorydata.categoryMasterModel.result as List<Result>;
      debugPrint(categoryList?.length.toString());
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: categorydata.loading
          ? practicecategoryshimmer()
          : Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: MyAppbar(
                  title: "Category",
                ),
              ),
              body: SafeArea(
                  child: Stack(
                children: [
                  buildBody(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        color: Colors.transparent,
                        height: 60,
                        child: AdHelper().bannerAd(),
                      ),
                    ),
                  )
                ],
              )),
            ),
    );
  }

  getAppbar() {
    return const MyAppbar(
      title: "Category",
    );
  }

  buildBody() {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: GridView.builder(
                padding: EdgeInsets.zero, // set padding to zero
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categoryList?.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PraticeLevel(
                                catId: categoryList![index].id.toString(),
                                masterId: widget.masterId.toString(),
                              )));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyNetImage(
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                              imagePath: categoryList?[index].image ?? ""),
                          const SizedBox(
                            height: 10,
                          ),
                          MyText(
                              maltilanguage: false,
                              title: categoryList?[index].name ?? "",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              colors: textColor),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget practicecategoryshimmer() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: CustomWidget.roundrectborder(
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 50,
            ),
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 8,
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return const CustomWidget.roundrectborder(
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                height: 50,
              );
            },
          ),
        ],
      ),
    );
  }
}
