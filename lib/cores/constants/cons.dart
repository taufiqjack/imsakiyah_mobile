// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const ENV_PATH = '.env';
const BASE_URL = 'DOMAIN';

const MESSAGE = 'message';
const STATUSCODE = 'status_code';

const provinsi = '/api/v2/imsakiyah/provinsi';
const kabupaten = '/api/v2/imsakiyah/kabkota';
const imsakiyah = '/api/v2/imsakiyah';

late SharedPreferences logg;
