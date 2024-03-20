import 'package:flutter_dotenv/flutter_dotenv.dart';

// create .env file with values in the root of project

class EnvConfig{
  static String apikey = '';
  static Future<void> loadEnv()async{
    await dotenv.load(fileName: '.env');
    apikey = dotenv.env['API_KEY']??'';
  }
}