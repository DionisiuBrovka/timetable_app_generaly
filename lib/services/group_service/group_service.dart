import 'package:hive/hive.dart';
import 'package:timetable_app_generaly/models/group_model.dart';

class GroupService {
  late final Box<GroupModel> itemsBox;

  Future<void> init() async {
    Hive.registerAdapter(GroupModelAdapter());
    itemsBox = await Hive.openBox("groupBox");
  }

  List<GroupModel> getGroupList() {
    return itemsBox.values.toList();
  }
}
