import 'package:flutter/material.dart';
import 'package:td2_app_mobile/UI/mytheme.dart';
import 'package:td2_app_mobile/models/task.dart';
import 'package:td2_app_mobile/UI/detail.dart';

class Screen1 extends StatelessWidget {
  
  List<Task> tasks = Task.generateTask(5);
  String tags = '';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => Card(
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(child: Text(tasks[index].id.toString()),backgroundColor: Colors.lightBlue,),
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].tags.join(" ")),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Detail(task: tasks[index]),
              ));
            },
          ),
        ),
      ),
    );
  }
}