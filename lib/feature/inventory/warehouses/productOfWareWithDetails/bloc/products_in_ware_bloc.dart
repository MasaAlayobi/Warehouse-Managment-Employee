import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/productWithVeicleInWare.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';
import 'package:mobile_warehouse_managment/core/domain/inventory_service.dart';

part 'products_in_ware_event.dart';
part 'products_in_ware_state.dart';

class ProductsInWareBloc
    extends Bloc<ProductsInWareEvent, ProductsInWareState> {
  ProductsInWareBloc() : super(ProductsInWareInitial()) {
    on<GetAllProductsInWare>((event, emit) async {
      try {
        emit(LoadedGetProducts());
        List<ProductwithveicleinwareModel> response =
            await InventoryServiceImpl().getProductsInWarehouse(event.id);
        print(response);
        // List<WarehouseproductModel> products = List.generate(response["items"].length,
        //     (index) => WarehouseproductModel.fromMap(response["items"][index]));
        // print(products);
        //       List<WarehouseproductModel> veicles = List.generate(response["vehciles"].length,
        //     (index) => WarehouseproductModel.fromMap(response["vehciles"][index]));
        if (response.isNotEmpty) {
          emit(SuccessGetProducts(listProductInWareInState: response[0]));
        } else if (response.isEmpty) {
          emit(EmptyGetProducts());
        } else {
          emit(FailedGetProducts());
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
