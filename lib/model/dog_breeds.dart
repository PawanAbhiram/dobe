class DogBreeds {
  final Map<String, List<String>>? breeds;

  DogBreeds({this.breeds});

  // Factory constructor to create a DogBreeds instance from JSON
  factory DogBreeds.fromJson(Map<String, dynamic> json) {
    final breedsJson = json['message'] as Map<String, dynamic>;
    final breeds = breedsJson.map<String, List<String>>((key, value) {
      return MapEntry(key, List<String>.from(value as List));
    });
    return DogBreeds(breeds: breeds);
  }

  // Method to convert a DogBreeds instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': breeds!.map<String, dynamic>((key, value) {
        return MapEntry(key, value);
      })
    };
  }
}
