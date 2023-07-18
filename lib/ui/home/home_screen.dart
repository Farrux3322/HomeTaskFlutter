import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/google_search_model.dart';
import '../../../data/models/organic_model.dart';
import '../../../data/models/universal_data.dart';
import '../../../data/network/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController queryController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  int countOfPage = 5;
  String queryText = "";
  bool isLoading = false;

  List<OrganicModel> organicModels = [];

  _fetchResult() async {
    setState(() {
      isLoading = true;
    });
    UniversalData universalData = await ApiProvider.searchFromGoogle(
      query: queryText,
      page: currentPage,
      count: countOfPage,
    );

    setState(() {
      isLoading = false;
    });

    if (universalData.error.isEmpty) {
      GoogleSearchModel googleSearchModel =
          universalData.data as GoogleSearchModel;
      organicModels.addAll(googleSearchModel.organicModels);
      setState(() {});
    }
    currentPage++;
  }

  List<String> lists = [];

  _getText() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    lists = pre.getStringList("key") ?? [];
    print(lists.length);

    setState(() {

    });
  }

  _savedText({required List<String> list}) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    await pre.setStringList("key", list);

  }

  @override
  void initState() {
    _getText();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _fetchResult();
      }
    });

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                  "assets/images/google.json",
                  height: 130
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(
                    width: 280,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (v) {
                        queryText = v;
                      },
                      controller: queryController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: 78,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (queryController.text.isNotEmpty) {
                            organicModels = [];
                            currentPage = 1;
                            lists.insert(0, queryController.text);
                            _savedText(list: lists);
                            _getText();
                            print(_getText());
                            print("Farruxxxxxxx $lists");
                            queryController.clear();
                          }
                        });

                        _fetchResult();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        "Search",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 56,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(lists.length, (index) {
                    return ZoomTapAnimation(
                      onLongTap: (){
                        print("Farruxxxx");
                        setState(() {
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              backgroundColor: Colors.black,
                              title: Text("Delete",style: TextStyle(color: Colors.white),),
                              actions: [

                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Cencel",style: TextStyle(color: Colors.red),)),
                                TextButton(onPressed: (){
                                  setState(() {
                                    //lists.remove(lists[index]);
                                    Navigator.pop(context);
                                  });

                                }, child: Text("Ok",style: TextStyle(color: Colors.white),)),
                              ],
                            );
                          });
                        });

                      },

                      onTap: () {
                        setState(() {
                          queryText = lists[index];
                          organicModels = [];
                          currentPage = 1;
                          _fetchResult();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 2),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black45),
                        child: Text(
                          lists[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            queryText.isNotEmpty? Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    ...List.generate(organicModels.length, (index) {
                      OrganicModel organicModel = organicModels[index];
                      return Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 2),
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(16)),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              organicModel.title,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              organicModel.snippet,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              organicModel.link,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              organicModel.date,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    }),
                    Visibility(
                      visible: isLoading,
                      child:  Center(
                        child: Lottie.asset("assets/images/loading.json",
                            height: 100
                        ),
                      ),
                    ),
                  ],
                ))
                : Center(child: Lottie.asset("assets/images/img.json",height: 600),),
          ],
        ),
      )
    );
  }
}
