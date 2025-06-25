import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  static final PusherChannelsFlutter _pusher =
      PusherChannelsFlutter.getInstance();

  static Future<void> initialize() async {
    try {
      await _pusher.init(
        apiKey: pusherKey,
        cluster: pusherCluster,
        onConnectionStateChange: _onConnectionStateChange,
        onError: _onError,
        onSubscriptionSucceeded: _onSubscriptionSucceeded,
        onEvent: _onEvent,
        onSubscriptionError: _onSubscriptionError,
        onDecryptionFailure: _onDecryptionFailure,
        onMemberAdded: _onMemberAdded,
        onMemberRemoved: _onMemberRemoved,
      );

      await _pusher.subscribe(channelName: 'presence-chatbox');
      await _pusher.connect();
    } catch (e) {
      print("PusherService Error: $e");
    }
  }

  static void _onConnectionStateChange(
      dynamic currentState, dynamic previousState) {
    print("Pusher: Connection changed from $previousState to $currentState");
  }

  static void _onError(String message, int? code, dynamic e) {
    print("Pusher Error: $message (code: $code)");
  }

  static void _onSubscriptionSucceeded(String channelName, dynamic data) {
    print("Pusher: Subscribed to $channelName, data: $data");
  }

  static void _onEvent(PusherEvent event) {
    print("Pusher Event: ${event.eventName}, data: ${event.data}");
  }

  static void _onSubscriptionError(String message, dynamic e) {
    print("Pusher Subscription Error: $message");
  }

  static void _onDecryptionFailure(String event, String reason) {
    print("Pusher Decryption Failure: $event, reason: $reason");
  }

  static void _onMemberAdded(String channelName, PusherMember member) {
    print("Pusher: Member added to $channelName: ${member.userId}");
  }

  static void _onMemberRemoved(String channelName, PusherMember member) {
    print("Pusher: Member removed from $channelName: ${member.userId}");
  }
}
