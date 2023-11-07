import 'package:connect_ummah/configs/constants/assets.dart';
import 'package:connect_ummah/configs/constants/extensions.dart';

import '../../api/api_services.dart';

class ProductCard extends StatelessWidget {

  bool? addToCart;
  int? id;

  ProductCard({super.key, required addToCart, required id});

  bool addtoCart() {
    try {
      ApiServices.addToCart(this.id);
      return true;
    } catch (e) {SnackBar("${AppStrings.kCartError}"); return false;}
  }
  bool showCart() {
      //SideBar
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Image.asset(Assets.imagesElevator),
        addToCart
            ? SizedBox()
            : ElevatedButton(
                onPressed: (){
                  if( addtoCart())
                    showCart();
                  else {}
                },
                child: Text("Add to Cart")
            )
      ]
    );
  }

}
