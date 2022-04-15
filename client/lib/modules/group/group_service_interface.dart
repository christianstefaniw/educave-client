import 'group_model.dart';

abstract class IGroupService {
  String get id;
  String get groupPic;
  String get name;
  String get summary;
  int get numMembers;
  int get numPosts;
  bool get joined;

  Future<void> join();
  Future<void> unjoin();
}
