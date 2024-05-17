
import 'package:smartpay/models/create_account_response.dart';
import 'package:smartpay/models/email_token_response.dart';

import '../models/dashboard_response.dart';
import '../models/login_response.dart';

class ResponseData{
  static LoginResponse loginResponse = LoginResponse();
  static DashboardResponse dashboardResponse = DashboardResponse();
  static CreateAccountResponse createAccountResponse = CreateAccountResponse();
  static EmailTokenResponse emailTokenResponse = EmailTokenResponse();
}