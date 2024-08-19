import 'package:flutter_hive_todo_app/models/task.dart';
import 'package:hive/hive.dart';

class HiveDataStore{
  static const boxName = 'taskBox';
  final Box<Task> box = Hive.box<Task>(boxName);
}