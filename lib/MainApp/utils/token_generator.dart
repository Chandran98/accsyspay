import 'dart:math';

class TokenGenerator{
   String generateRandomString() {
      final random = Random();
      const allChars =
          'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
      final randomString = List.generate(
          12, (index) => allChars[random.nextInt(allChars.length)]).join();
      return randomString;
    }
}