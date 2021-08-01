import 'models/topic_card_info.dart';

class DummyData {
  static final List<TopicCardInfo> topics = [
    TopicCardInfo(
      'Pre-built Implicit Animations',
      'The most straight forward way of adding animations in your Flutter app using pre-built implicit animations. Also here the animation widget is like AnimateFoo where Foo the property that you want to animate.',
      '/implicit/pre-built',
    ),
    TopicCardInfo(
      'Custom built Implicit Animations',
      'The most straight forward way of adding animations in your Flutter app using custom built implicit animations. This is done used when we don\'t find AnimateFoo where Foo the property that you want to animate.',
      '/implicit/custom-built',
    ),
    TopicCardInfo(
      'Pre-built Explicit Animations',
      'Pre-built explicit animations. These widgets names end with Transition',
      '/explicit/pre-built',
    ),
    TopicCardInfo(
      'Custom built Explicit Animations',
      'Custom built explicit animations are built using Animated Widgets and AnimatedBuilders',
      '/explicit/custom-built',
    ),
    TopicCardInfo(
      'Basic blocks of animations',
      'How animations work fundamentall using ticker, controller and setState',
      '/basic-blocks-of-animations',
    ),
    TopicCardInfo(
      'Background Color Changing',
      'Background color changes',
      '/background-color-changing',
    ),
    TopicCardInfo(
      'Text Grow',
      'Text Grow',
      '/text-grow',
    ),
    TopicCardInfo(
      'Radial Menu Button',
      'Cool radial menu button',
      '/radial-menu-btn',
    ),
    TopicCardInfo(
      'Flare Bottom Navbar',
      'Flare Bottom Navbar',
      '/flare/bottom-nav',
    ),
  ];
}
