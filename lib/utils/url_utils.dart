class UrlUtils{

    static final UrlUtils _UrlUtils = UrlUtils._internal();
  
  factory UrlUtils() {
    return _UrlUtils;
  }
  
  UrlUtils._internal();

  static const login='api/Account/v1/Login';
  static const dog_breed_list='breeds/list/all';
  static String dog_image_url(String breed) {
    return 'breed/$breed/images/random';
  }
}