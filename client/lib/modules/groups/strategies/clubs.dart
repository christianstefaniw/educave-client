import '../../group/group_model.dart';
import '../../../data/providers/api_provider_interface.dart';
import 'fetch_groups_strategy.dart';

class Clubs implements FetchGroupsStrategy {
  @override
  Future<List<GroupModel>> execute(IApiProvider client) async {
    print('from clubs');
    return await Future.delayed(
      const Duration(seconds: 1),
      () => [
        GroupModel(
          id: '1',
          name: 'Humberside Collegiate Institute',
          summary:
              'The official Educave room for Humberside Collegiate Institute',
          groupPic:
              'https://schoolweb.tdsb.on.ca/portals/humbersideci/images/crest03.gif',
          backgroundPic: '',
          joined: true,
          numMembers: 432,
          numPosts: 153,
        ),
        GroupModel(
          id: '1',
          name: 'Coding Club',
          summary:
              'The official Educave room for Humberside Collegiate Institute',
          groupPic:
              'https://i.pinimg.com/originals/0f/8b/28/0f8b2870896edcde8f6149fe2733faaf.jpg',
          backgroundPic: 'https://cdn.wallpapersafari.com/4/56/kbALhV.jpg',
          joined: false,
          numMembers: 43,
          numPosts: 82,
        ),
      ],
    );
  }
}
