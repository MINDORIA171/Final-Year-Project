import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _progressValue = 0.04;
  double get progressValue => _progressValue;
  set progressValue(double value) {
    _progressValue = value;
  }

  int _currentQuestionIndex = 1;
  int get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(int value) {
    _currentQuestionIndex = value;
  }

  List<String> _featuresList = [
    'AI Therapist',
    'Guided Meditation',
    'Blogs',
    'Mood Tracking',
    'Daily Reminders',
    'Progress Reports',
    'Personal Session'
  ];
  List<String> get featuresList => _featuresList;
  set featuresList(List<String> value) {
    _featuresList = value;
  }

  void addToFeaturesList(String value) {
    featuresList.add(value);
  }

  void removeFromFeaturesList(String value) {
    featuresList.remove(value);
  }

  void removeAtIndexFromFeaturesList(int index) {
    featuresList.removeAt(index);
  }

  void updateFeaturesListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    featuresList[index] = updateFn(_featuresList[index]);
  }

  void insertAtIndexInFeaturesList(int index, String value) {
    featuresList.insert(index, value);
  }

  String _searchQuery = '\"\"';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }
}
