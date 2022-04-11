import '../../data/providers/api_provider_interface.dart';
import 'stories_repository_interface.dart';
import 'story_model.dart';
import 'strategies/fetch_stories_strategy.dart';

class StoriesRepository implements IStoriesRepository {
  final IApiProvider _client;
  late FetchStoriesStrategy _fetchStrategy;

  StoriesRepository(this._client);

  @override
  Future<List<StoryModel>> stories() async {
    return await _fetchStrategy.execute(_client);
  }

  @override
  void setFetchStoriesStrategy(FetchStoriesStrategy strategy) {
    _fetchStrategy = strategy;
  }
}
