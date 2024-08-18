import 'package:dobe/screens/dog_breed_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:dobe/viewmodels/dog_list_viewmodel.dart';
import 'package:dobe/viewmodels/dog_details_viewmodel.dart';
import 'package:dobe/model/dog_breeds.dart';
import 'package:dobe/reusable/loading_view.dart';
import 'package:dobe/reusable/screen_error_widget.dart';

// Mock classes
class MockDogListViewModel extends Mock implements DogListViewModel {}
class MockDogDetailsViewModel extends Mock implements DogDetailsViewModel {}

void main() {
  testWidgets('Displays LoadingView while fetching data', (WidgetTester tester) async {
    // Arrange
    final mockViewModel = MockDogListViewModel();
    when(mockViewModel.getDogList(any, context: anyNamed('context')))
      .thenAnswer((_) async => Future.value(DogBreeds(breeds: {}))); // Ensure Future<DogBreeds> is returned

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<DogListViewModel>(
          create: (_) => mockViewModel,
          child: DogBreedListScreen(),
        ),
      ),
    );

    // Act
    await tester.pump(); // To trigger the FutureBuilder

    // Assert
    expect(find.byType(LoadingView), findsOneWidget);
  });

  testWidgets('Displays ScreenErrorWidget when an error occurs', (WidgetTester tester) async {
    // Arrange
    final mockViewModel = MockDogListViewModel();
    when(mockViewModel.getDogList(any, context: anyNamed('context')))
      .thenThrow(Exception('Test error'));

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<DogListViewModel>(
          create: (_) => mockViewModel,
          child: DogBreedListScreen(),
        ),
      ),
    );

    // Act
    await tester.pump(); // To trigger the FutureBuilder

    // Assert
    expect(find.byType(ScreenErrorWidget), findsOneWidget);
  });

  testWidgets('Displays list of breeds when data is fetched successfully', (WidgetTester tester) async {
    // Arrange
    final mockViewModel = MockDogListViewModel();
    final mockDogBreeds = DogBreeds(
      breeds: {
        'Breed1': ['Sub-breed1'],
        'Breed2': [],
      },
    );

    when(mockViewModel.getDogList(any, context: anyNamed('context')))
      .thenAnswer((_) async => mockDogBreeds); // Ensure Future<DogBreeds> is returned

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<DogListViewModel>(
          create: (_) => mockViewModel,
          child: DogBreedListScreen(),
        ),
      ),
    );

    // Act
    await tester.pump(); // To trigger the FutureBuilder

    // Assert
    expect(find.text('Breed1'), findsOneWidget);
    expect(find.text('Sub-breeds: Sub-breed1'), findsOneWidget);
    expect(find.text('Breed2'), findsOneWidget);
    expect(find.text('No Sub-breeds'), findsOneWidget);
  });
}
