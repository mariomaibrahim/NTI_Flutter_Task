abstract class HomeState {
  final int count;
  final int totalCount;

  HomeState(this.count, this.totalCount);
}

class HomeInitial extends HomeState {
  HomeInitial() : super(0, 0);
}

class HomeUpdated extends HomeState {
  HomeUpdated(int count, int totalCount) : super(count, totalCount);
}