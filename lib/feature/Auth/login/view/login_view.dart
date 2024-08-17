import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_button.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/login_model.dart';
import 'package:mobile_warehouse_managment/core/domain/auth_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_image.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  TextEditingController email = TextEditingController();
  TextEditingController email2 = TextEditingController();
  TextEditingController password = TextEditingController();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColor.purple1,
          body: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.78,
                  ),
                  Image.asset(
                    '${AppImage.vectorLogin1}',
                    height: 360,
                  ),
                ],
              ),
              Image.asset(
                '${AppImage.vectorLogin2}',
              ),
              Image.asset('${AppImage.vectorLogin3}'),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 100, 15, 60),
                      child: Text(
                        'Welcome \nBack',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: CustomTextField(
                          nameText: 'Email',
                          nameController: email,
                          readOnly: false),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: CustomTextField(
                          nameText: 'Password',
                          nameController: password,
                          readOnly: false),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              HeaderText(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600,
                                                  text: "enter your email:"),
                                              sizedBox15(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 60,
                                                            right: 60),
                                                    child: CustomTextField(
                                                        nameText: 'Email',
                                                        nameController: email2,
                                                        readOnly: false),
                                                  ),
                                                  MyButton(
                                                      title: "accept",
                                                      onpress: () async {
                                                        try {
                                                          var response =
                                                              await AuthServiceImp()
                                                                  .forget(email2
                                                                      .text);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              3),
                                                                  backgroundColor:
                                                                      AppColor
                                                                          .green2,
                                                                  content: SizedBox(
                                                                      height:
                                                                          50,
                                                                      child: Center(
                                                                          child:
                                                                              SubTitle3(text: response.toString())))));
                                                        } catch (e) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              3),
                                                                  backgroundColor:
                                                                      AppColor
                                                                          .red,
                                                                  content: SizedBox(
                                                                      height:
                                                                          50,
                                                                      child: Center(
                                                                          child:
                                                                              SubTitle3(text: e.toString())))));
                                                        }
                                                      },
                                                      colors: AppColor.green2,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      height: 44,
                                                      radius: 9),
                                                  MyButton(
                                                      title: "cancel",
                                                      onpress: () {
                                                        Navigator.pop(context);
                                                      },
                                                      colors: AppColor.red,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      height: 44,
                                                      radius: 9),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Center(
                                child: Text(
                              'Forget Password',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black,
                                decoration: TextDecoration.underline,
                                decorationThickness: 5,
                                decorationColor: AppColor.purple2,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            )),
                          ),
                        ),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is successlogin) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(new SnackBar(
                                content: Text(state.message),
                                backgroundColor: AppColor.green1,
                              ));
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.kHomeView);
                            } else if (state is NoConnection) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(new SnackBar(
                                content: Text(state.message),
                                backgroundColor: AppColor.red,
                              ));
                            }
                          },
                          child: CustomButton(
                              icon: Icons.arrow_forward,
                              sixeIcon: 33,
                              colorIcon: AppColor.purple1,
                              onpress: () {
                                if (email.text.isNotEmpty &&
                                    password.text.isNotEmpty) {
                                  LoginModel user = LoginModel(
                                      firebase_token: storage.get<SharedPreferences>().getString('deviceToken')!,
                                      email: email.text,
                                      password: password.text);
                                      print(user);
                                      print('-------------------');
                                  context
                                      .read<LoginBloc>()
                                      .add(loginUser(User: user));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(new SnackBar(
                                    content: Text('إملاء كامل الحقول'),
                                    backgroundColor: AppColor.red,
                                  ));
                                }
                              },
                              colors: AppColor.purple3,
                              width: 55,
                              height: 55,
                              radius: 40),
                        )
                      ],
                    ),
                    // CustomButton(title: 'Login', onpress: (){}, colors: AppColor.purple2, width: 60, height: 150, radius: 15)
                  ],
                ),
              )
            ],
          ),
          // floatingActionButton: Align(
          //   alignment: Alignment(0.9, 0.69),
          //   child: FloatingActionButton(
          //     backgroundColor:AppColor.purple2 ,
          //     child: Icon(Icons.arrow_forward,color:AppColor.purple1,),
          //     onPressed: (){}),
          // ),
        );
      }),
    );
  }
}
// class ProductCubitSupllier extends Cubit<ProductStateSupllier> {
//   final ApiProvider apiProvider;

//   ProductCubitSupllier(this.apiProvider) : super(ProductsInitial());

//   void fetchAllData(int categoryId, int id) async {
//     try {
//       emit(ProductsLoading());
//       final response = await apiProvider.fetchAllData(id);
//       final supplier = SupplierModel.fromJson(response['supplier']);
      
//       // Products without offer
//       final List<dynamic> productsWithoutOfferJson = response['products_without_offer'];
//       final List<Product> productsWithoutOffer = productsWithoutOfferJson
//           .where((json) => categoryId == 0  json['product_category_id'] == categoryId)
//           .map((json) => Product.fromJson(json))
//           .toList();

//       // Products with offer
//       final List<dynamic> productsWithOfferJson = response['products_with_offer'];
//       final List<Product> productsWithOffer = productsWithOfferJson
//           .where((json) => categoryId == 0  json['product_category_id'] == categoryId)
//           .map((json) => Product.fromJson(json))
//           .toList();

//       // Offers slider
//       final List<Offer> sliderOffers = (response['slider_offers'] as List).map((e) => Offer.fromJson(e)).toList();

//       emit(ProductsLoaded(productsWithoutOffer, productsWithOffer, sliderOffers, categoryId, supplier));
//     } on DioException catch (e) {
//       String errorMessage = ErrorHandler.handleDioError(e);
//       emit(ProductsError(errorMessage));
//     } catch (e) {
//       emit(ProductsError("An unexpected error occurred: ${e.toString()}"));
//     }
//   }
// }

// class ProductStateSupllier {
//   // Define states for products without offers, with offers, and slider offers
// }

// class ProductsLoaded extends ProductStateSupllier {
//   final List<Product> productsWithoutOffer;
//   final List<Product> productsWithOffer;
//   final List<Offer> sliderOffers;
//   final int categoryId;
//   final SupplierModel supplier;

//   ProductsLoaded(this.productsWithoutOffer, this.productsWithOffer, this.sliderOffers, this.categoryId, this.supplier);
// }