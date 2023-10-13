import 'package:hongyan/bonfire.dart';

mixin Pushable on ObjectCollision {
  bool enablePushable = true;

  @override
  void onCollisionHappened(GameComponent component, bool active) {
    if (enablePushable) {
      if (this is Movement) {
        if (!active && component is Movement && onPush(component)) {
          Vector2 displacement = center - component.center;
          if (displacement.x.abs() > displacement.y.abs()) {
            if (displacement.x < 0) {
              (this as Movement).moveLeft((this as Movement).speed);
            } else {
              (this as Movement).moveRight((this as Movement).speed);
            }
          } else {
            if (displacement.y < 0) {
              (this as Movement).moveUp((this as Movement).speed);
            } else {
              (this as Movement).moveDown((this as Movement).speed);
            }
          }
        }
      } else {
        // ignore: avoid_print
        print(
            'The mixin Pushable not working in ($this) because this component don`t have the `Movement` mixin');
      }
    }
    super.onCollisionHappened(component, isVisible);
  }

  /// Returning true if the component is pushable, false otherwise.
  bool onPush(GameComponent component) {
    return true;
  }
}
