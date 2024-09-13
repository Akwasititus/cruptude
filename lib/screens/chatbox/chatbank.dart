import 'package:flutter/material.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String messageTime;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
    required this.messageTime,
  });
}

List<ChatMessage> messages = [
  ChatMessage(
    messageTime: "2 minutes ago",
    messageContent: "Hello, Will",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "2 minutes ago",
    messageContent: "How have you been?",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "4 minutes ago",
    messageContent: "Hey Kriss, I am doing fine dude. wbu?",
    messageType: "sender",
  ),
  ChatMessage(
    messageTime: "3 minutes ago",
    messageContent: "ehhhh, doing OK.",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "1 hour ago",
    messageContent: "Is there any thing wrong?",
    messageType: "sender",
  ),
  ChatMessage(
    messageTime: "1 minutes ago",
    messageContent: "Hello, Will",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "6 minutes ago",
    messageContent: "How have you been?",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "4 minutes ago",
    messageContent: "Hey Desmond, I am doing fine dude. wbu?",
    messageType: "sender",
  ),
  ChatMessage(
    messageTime: "2 minutes ago",
    messageContent: "ehhhh, doing OK.",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "10 minutes ago",
    messageContent: "Is there any thing wrong?",
    messageType: "sender",
  ),
  ChatMessage(
    messageTime: "2 minutes ago",
    messageContent: "Hello, Will",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "10 minutes ago",
    messageContent: "How have you been?",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "5 minutes ago",
    messageContent: "Hey Kriss, I am doing fine dude. wbu?",
    messageType: "sender",
  ),
  ChatMessage(
    messageTime: "4 minutes ago",
    messageContent: "ehhhh, doing OK.",
    messageType: "receiver",
  ),
  ChatMessage(
    messageTime: "2 days ago",
    messageContent: "Is there any thing wrong?",
    messageType: "sender",
  ),
];
