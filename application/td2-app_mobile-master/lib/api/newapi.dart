import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:td2_app_mobile/models/task.dart';
import 'package:td2_app_mobile/models/todo.dart';

class MyAPI{
    Future<List<Task>> getTasks() async{
        await Future.delayed(Duration(seconds: 1));
        final dataString = await _loadAsset('json/tasks.json');
        final Map<String,dynamic> json = jsonDecode(dataString);
        if (json['tasks'] != null){
            final tasks = <Task>[];
            json['tasks'].forEach((element){
                tasks.add(Task.fromJson(element));
            });
            return tasks;
        } else {
            return [];
        }
    }
    Future<String> _loadAsset(String path) async {
        return rootBundle.loadString(path);
    }

    Future<List<Todo>> getTodos() async{
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
        if (response.statusCode == 200){
            debugPrint("200");
            final List<dynamic> json = jsonDecode(response.body);
            debugPrint("apres jsonDecode");
            final todos = <Todo>[];
            json.forEach((element) {
            todos.add(Todo.fromJson(element));
            });
            debugPrint("avant return");
            return todos;
        }else{
            debugPrint("pb connection");
            throw Exception('Failed to load todos');
        }
    }
}