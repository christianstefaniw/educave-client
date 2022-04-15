import '../group/mutual_group_model.dart';
import 'user_model.dart';
import 'user_repository_interface.dart';
import 'user_service_interface.dart';

class UserService implements IUserService {
  final IUserRepository _repository;
  final UserModel _model;

  UserService(this._repository, this._model);

  @override
  String get username => _model.username;

  @override
  String get profilePic => _model.profilePic;

  @override
  List<MutualGroupModel> get mutualGroups => _model.mutualGroups;

  @override
  bool get isFollowing => _model.isFollowing;

  @override
  Future<void> follow() async {
    await _repository.follow();
    _model.follow();
  }

  @override
  Future<void> unfollow() async {
    await _repository.unfollow();
    _model.unfollow();
  }
}
