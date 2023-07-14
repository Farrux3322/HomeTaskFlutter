import 'package:default_project/data/models/main/weather_main_model.dart';
import 'package:default_project/ui/home/widgets/error_country.dart';
import 'package:default_project/ui/home/widgets/my_app_bar.dart';
import 'package:default_project/ui/home/widgets/my_text.dart';
import 'package:default_project/utils/my_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/universal_data.dart';
import '../../data/network/api_provider.dart';
import '../../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: FutureBuilder<UniversalData>(
        future: ApiProvider.getMainWeatherDataByQuery(query: query),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xFFFEE3BC).withOpacity(0.9),
                    const Color(0xFFF39876)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              ),
              child: CupertinoActivityIndicator(
                radius: 20,
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              WeatherMainModel weatherMainModel =
              snapshot.data!.data as WeatherMainModel;
              return SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xFFFEE3BC).withOpacity(0.9),
                        const Color(0xFFF39876)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                         MyAppBar(voidCallback: (){
                           setState(() {
                           });
                         },
                         ),
                        SizedBox(height: 65,),
                        Text("${weatherMainModel.name},\n${weatherMainModel.sysInMain.country}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Color(0xFF313341)),),
                          SizedBox(height: 16,),
                          Text(MyUtils.getDateTime(weatherMainModel.dateTime).toString().substring(0,10),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xFF9A938C)),),
                          SizedBox(height: 16,),
                          Row(
                            children: [
                              Image.network("https://openweathermap.org/img/wn/${weatherMainModel.weatherModel[0].icon}@2x.png",width: 200,height: 200,),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${(weatherMainModel.mainInMain.temp-273.15).toInt()}",style: TextStyle(fontSize: 70,fontWeight: FontWeight.w700,color: Color(0xFF303345)),),
                                      Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          Text("°c",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Color(0xFF303345)),),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(weatherMainModel.weatherModel[0].description,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF303345)),)
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(colors: [
                                const Color(0xFFFFFFFF).withOpacity(0.5),
                                const Color(0xFFFFFFFF).withOpacity(0.36)
                              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svg/rain.svg"),
                                  SizedBox(width: 10,),
                                  Text("RainFall",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF303345)),),
                                  SizedBox(width: 180,),
                                  Text("${weatherMainModel.windInMain.speed.toInt()} sm",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF303345),))],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFFFFFFF).withOpacity(0.5),
                                  const Color(0xFFFFFFFF).withOpacity(0.36)
                                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svg/wind.svg"),
                                  SizedBox(width: 10,),
                                  Text("Wind",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF303345)),),
                                  SizedBox(width: 190,),
                                  Text("${weatherMainModel.windInMain.speed} km/h",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF303345),))],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFFFFFFF).withOpacity(0.5),
                                  const Color(0xFFFFFFFF).withOpacity(0.36)
                                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                 Column(
                                   children: [
                                     SizedBox(height: 21,),
                                     SvgPicture.asset("assets/svg/humidity.svg"),
                                   ],
                                 ),
                                  SizedBox(width: 10,),
                                  Text("Humidity",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF303345)),),
                                  SizedBox(width: 180,),
                                  Text("${weatherMainModel.mainInMain.humidity} %",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF303345),))],
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),
                          MyText(text1: "Today", text2: "Tomorrow"),
                          SizedBox(height: 10,),
                          SvgPicture.asset("assets/svg/seperate.svg",width: 370,),
                          SizedBox(height: 58,),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
          return ErrorCountry();
        },
      ),
    );
  }
}
