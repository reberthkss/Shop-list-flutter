class NavigationAction {
  const NavigationAction({
    required this.action,
    required this.value,
  });

  final NavigationActionType action;
  final String value;
}

enum NavigationActionType {
  popTo,
  pushTo,
}
