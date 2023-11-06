abstract class HomeEvent{
}

class HomeEventInitial extends HomeEvent{
}

class PageIndexEvent extends HomeEvent{
  final int pageIndex;

  PageIndexEvent(this.pageIndex);
}