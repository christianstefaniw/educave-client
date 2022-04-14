import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/api_provider.dart';
import '../../user/user_preview_widget.dart';
import '../../user/user_repository.dart';
import '../../user/user_service.dart';
import '../../user/user_vm.dart';
import 'all_users_vm.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Provider.of<AllUsersViewModel>(context, listen: false).loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AllUsersViewModel>(context);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: vm.usersLoaded
            ? ListView.builder(
                itemCount: vm.users!.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider(
                    create: (_) => UserViewModel(
                      UserService(
                        UserRepository(ApiProvider()),
                        vm.users![index],
                      ),
                    ),
                    child: const UserPreview(),
                  );
                },
              )
            : const Text('loading'));
  }

  @override
  bool get wantKeepAlive => true;
}
