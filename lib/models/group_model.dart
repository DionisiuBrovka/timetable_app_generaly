import 'package:hive/hive.dart';

part 'group_model.g.dart';

@HiveType(typeId: 0)
class GroupModel extends HiveObject {
  @HiveField(0)
  final String groupName;

  @HiveField(1)
  final bool isClose = false;

  GroupModel({required this.groupName});
}
