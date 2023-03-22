import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/resourse/data_model.dart';
import 'package:test_app/user_bloc/bloc/user_bloc.dart';

import '../utils/colors.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}



class _UsersListState extends State<UsersList> {

  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _userList()
     
    );
  }
   Widget _userList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _userBloc,
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitial) {
                return _Loading();
              } else if (state is UserLoading) {
                return _Loading();
              } else if (state is UserLoaded) {
                return _userCard(context, state.userModel);
              } else if (state is UserError) {
                return _errorPage();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _userCard(BuildContext context, DataModelJson model) {
    return 
            ListView(
            
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
                      itemCount: 15,
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
                                    model.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    model.email.toString(),
                                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                                  ),
                                  Text(
                                    model.id.toString(),
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      
                    ),
                  ]
              
            
          );
          
        
  }

  Widget _Loading() => const Center(child: CircularProgressIndicator());

  Widget _errorPage(){
    return 
    Center(
              
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

  }
}
