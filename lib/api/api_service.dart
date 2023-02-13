import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yaqoob_test_project/Models/change_password_model.dart';
import 'package:yaqoob_test_project/Models/delete_account_model.dart';
import 'package:yaqoob_test_project/Models/forgot_password_model.dart';
import 'package:yaqoob_test_project/Models/order_details_model.dart';
import 'package:yaqoob_test_project/Models/profile_model.dart';
import 'package:yaqoob_test_project/Models/quick_select_model.dart';
import 'package:yaqoob_test_project/Models/register_model.dart';
import 'package:yaqoob_test_project/Models/save_order_model.dart';
import 'package:yaqoob_test_project/shared_service.dart';
import '../Models/get_order_model.dart';
import '../Models/login_model.dart';

class APIService {
  final String _baseUrl = "http://54.74.47.46:82";
  // •	Get Order list :
  Future<GetOrderModel> getOrders() async {
    String? token = await SharedService.getToken();
    String url = "$_baseUrl/Order/GetOrders";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(<String, dynamic>{}),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      GetOrderModel getOrderModel = GetOrderModel.fromJson(
        json.decode(response.body),
      );
      return getOrderModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //•	Get Order Details by Order Number  :
// 124029
  Future<OrderDetailsModel> orderDetails(order) async {
    String? token = await SharedService.getToken();
    String url = "$_baseUrl/OrderMob/GetOrderMobDetailsById?id=$order";
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return OrderDetailsModel.fromJson(
        json.decode(response.body.toString()),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

//  Get login
  Future<LoginResponseModel> login({
    required LoginModel loginModel,
    required String firmname,
  }) async {
    final response = await http.post(
        Uri.parse("http://54.74.47.46:82/Account/Login?firmName=$firmname"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode(loginModel.toJson()));

    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  // •	Get Main Table By first Number

  Future<QuickSelectModel> getMainTabel(number) async {
    String? token = await SharedService.getToken();
    final response = await http.get(
        Uri.parse(
            "$_baseUrl/QuickSelect/GetMainByfirst_number?first_number=$number"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return QuickSelectModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  /// 	•	Get Order Status list
  Future<QuickSelectModel> getOrderStatus() async {
    String? token = await SharedService.getToken();
    final response = await http.get(
        Uri.parse("$_baseUrl/QuickSelect/GetOrderStatus"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return QuickSelectModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  /// 	•	Save Order Data API :

  Future<SaveOrderResponseModel> saveOrder(
      SaveOrderModel saveOrderModel) async {
    String? token = await SharedService.getToken();
    final response =
        await http.post(Uri.parse("$_baseUrl/OrderMob/SaveOrderData"),
            headers: <String, String>{
              "Content-Type": "application/json; charset=utf-8",
              "Authorization": "Bearer $token",
            },
            body: jsonEncode(
              saveOrderModel.toJson(),
            ));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SaveOrderResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  // •	User Forget Password API.

  Future<ForgotPasswordResponseModel> userForgetPassword({
    required ForgotPasswordModel forgotPasswordModel,
    required String firmName,
  }) async {
    String? token = await SharedService.getToken();
    final response = await http.post(
        Uri.parse("$_baseUrl/AccountMob/ForgotPassword?firmName=$firmName"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(forgotPasswordModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ForgotPasswordResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //	•	Create User Account :
  Future<RegisterResponseModel> createUserAccount({
    required RegisterModel registerModel,
  }) async {
    String? token = await SharedService.getToken();
    final response = await http.post(Uri.parse("$_baseUrl/Account/CreateUser"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(registerModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  // •	Get User Profile Details :

  Future<ProfileModel> getUserProfileDetails() async {
    String? token = await SharedService.getToken();
    String url = "$_baseUrl/UserMob/GetUserMobProfile";
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ProfileModel.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  // •	Change user Password API.

  Future<ChangePasswordResponseModel> changeuserPassword(
      {required ChangePasswordModel changePasswordModel}) async {
    String? token = await SharedService.getToken();
    String url = "$_baseUrl/AccountMob/ChangeUserPassword?firmName=meir_eruit";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(changePasswordModel.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ChangePasswordResponseModel.fromJson(
          json.decode(response.body.toString()));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  // •	Deactivate User :
  Future<DeleteAccountResponse> deactivateUser() async {
    String? token = await SharedService.getToken();
    String url = "$_baseUrl/AccountMob/DeactiveUser";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return DeleteAccountResponse.fromJson(
          json.decode(response.body.toString()));
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
