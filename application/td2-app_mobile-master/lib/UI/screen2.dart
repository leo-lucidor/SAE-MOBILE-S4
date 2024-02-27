import 'package:flutter/material.dart';
import 'package:td2_app_mobile/UI/mytheme.dart';
import 'package:td2_app_mobile/models/task.dart';
import 'package:td2_app_mobile/api/newapi.dart';
import 'package:td2_app_mobile/UI/detail.dart';

class Screen2 extends StatelessWidget {

  final myApi = MyAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myApi.getTasks(),
        builder: (context,snapshot) {
          if ( snapshot.connectionState!=ConnectionState.done && !snapshot.hasData){
            return const Center(
                    child: CircularProgressIndicator(),
                  );
          }
          if (snapshot.hasError) {
              return Center(child: Text(snapshot?.error.toString()??"Error"));
          }
          if(snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.length??0,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.lightBlue,child: Text(snapshot.data?[index].id.toString()??""),),
                        title: Text(snapshot.data?[index].title??""),
                        subtitle: Text(snapshot.data?[index].tags.join(" ")??""),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(task: snapshot.data![index])));
                          },
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }
          );
  }

  }
