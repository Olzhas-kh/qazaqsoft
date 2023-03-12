import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:test_app/resourse/data_model.dart';

import '../utils/colors.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}



class _UsersListState extends State<UsersList> {

Future<List<DataModelJson>> readJsonData() async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('assets/users.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    
    //map json and initialize using DataModel
    return list.map((e) => DataModelJson.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context,data){
          if(data.hasError){
            return  Center(
              
              child: Container(
                padding: const EdgeInsets.all(44),
                height: 400,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Image.asset("assets/images/warning_icon.png"),
                    const Text("Не удалось загрузить информацию", textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
                    InkWell(
                      onTap: (){
                        
                      },
                      child: Container(
                        width: 220,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            color:   ColorStyle.loginButtonColor
                            
                            ),
                        child: Center(
                          child: Text(
                            "Обновить",
                            style: TextStyle(
                                color:  ColorStyle.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )

                  ],),
              ),
            );
            
          }else if(data.hasData){
            var items = data.data as List<DataModelJson>;
            return Container(
          
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
          child: ListView(
            
            children:[ 
              const Text(
                    "Пользователи",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                 
                    const SizedBox(height: 20,),
                    ListView.builder(
                      
                      shrinkWrap: true,
                      itemCount: items.isNotEmpty? items.length:0,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) =>
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            
                            children: [
                              Image.asset("assets/images/user_icon.png",height: 60,width: 60,),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    items[index].name.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    items[index].email.toString(),
                                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                                  ),
                                  Text(
                                    items[index].website.toString(),
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      
                    ),
                  ]
              
            
          ),
          
        );
          }else{
            return const Center(
              child: CircularProgressIndicator(color: Color.fromRGBO(155, 81, 224, 1),),
            );
          }


        },

        
      ),
    );
  }
}
