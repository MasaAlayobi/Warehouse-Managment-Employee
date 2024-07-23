import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_button.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/data/login_model.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_image.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  TextEditingController email = TextEditingController();
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
                    width: MediaQuery.of(context).size.width / 1.72,
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
                        Padding(
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
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                             if(state is successlogin){
                               ScaffoldMessenger.of(context)
                                      .showSnackBar(new SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: AppColor.green1,
                                  ));
                                    GoRouter.of(context)
                                    .pushReplacement(AppRouter.kHomeView);
                             }else if(state is NoConnection){
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
                                      email: email.text, password: password.text);
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