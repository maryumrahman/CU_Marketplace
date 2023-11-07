import 'package:connect_ummah/configs/constants/colors.dart';
import 'package:connect_ummah/configs/constants/constants.dart';
import 'package:connect_ummah/configs/constants/extensions.dart';
import 'package:connect_ummah/presentation/screens/views/shop_information_form.dart';
import 'package:connect_ummah/presentation/screens/views/vendor_admin_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/api_services.dart';
import '../../../configs/constants/strings.dart';
import '../../../models/categoryOfProducts.dart';
import '../../../models/searchProductsModel.dart';
import '../../elements/app_textfield.dart';
import '../../elements/product_card.dart';
import '../../providers/load_products_bloc/load_products_bloc.dart';
import '../../providers/search_visible_bloc/search_visible_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool _isVendor=false;
  bool flagLoad=false;
  TextEditingController productNameSearchController = TextEditingController();
  TextEditingController productNameFilterController = TextEditingController();
  List<categoryOfProducts>? _productsLocalDB;


  @override
  void initState() {
    super.initState();
    _getProducts();
    _getUserTableRights();
    _isVendor=fromUserRightsTable.isAdmin;
  }

  _getUserTableRights() async {
    String currentuserName = await prefs.get('userName');
    String currentRole = await prefs.get('role_name');
    await ApiServices.fetch(
      'vu_user_tablerights',
      actionName: 'Masjid',
      baseUrl: ApiServices.securityBaseUrl,
      param1: currentuserName,
      param2: currentRole,
    ).then((response) {
      try {
        Iterable list = json.decode(response.body);
        userTableRights =
            list.map((model) => TableRightsModel.fromJson(model)).toList();
      } on Exception catch (e) {
        print(e);
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  _getProducts() async {
    // await ApiServices.fetch("masjid", baseUrl: ApiServices.communityBaseUrl)
    //     .then((response) {
    //   Iterable listJson = json.decode(response.body);
    //   allMasjids = listJson.map((model) => Masjid.fromJson(model)).toList();
    // });
    try {_productsLocalDB= await ApiServices.fetch();}
        catch(e){_productsLocalDB = [];}
  }

  void runSearch(String enteredKeyword) async {
    List<categoryOfProducts> list = [];
    if (enteredKeyword.isEmpty) {
      context.read<LoadProductsBloc>()
          .add(LoadProductsPullToRefresh(isLoaded: flagLoad));
    } else {
      list = _productsLocalDB!
          .where((p) => p.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      context.read<LoadProductsBloc>().add(LoadProductsSearch(displayList: list));
      if (mounted) {
        context
            .read<LoadProductsBloc>()
            .add(LoadProductsSearch(displayList: list));
      }
    }
  }

  filterProducts() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0, bottom: 15.0, right: 15.0, top: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " Filter by",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          14.height,
          Row(
            children: [
              Text(
                "Product Name",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
              AppConstants().width8,
              Expanded(
                child: AppTextField(
                  hintText: "Product Name",
                  controller: productNameFilterController,
                ),
              ),
            ],
          ),
          8.height,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              "Company Name",
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Expanded(child: SizedBox()),
            Text(
              "Location",
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Expanded(child: SizedBox()),
          ]),
          8.height,
          // customRadio1(
          //     title: "Experience Level",
          //     fn: (v) {
          //       setState(() {
          //         productNameFilterController.text = v;
          //       });
          //     },
          //     buttonLables: ["", "Remote", "On-Site", "Hybrid"],
          //     buttonValues: ["", "Remote", "On-Site", "Hybrid"]),
          20.height,
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  SearchProductsModel obj = SearchProductsModel(
                    name: productNameFilterController.text.trim().isEmpty
                        ? null
                        : productNameFilterController.text.trim(),
                    // workPlace: workPlaceController.text.trim().isEmpty
                    //     ? null
                    //     : workPlaceController.text.trim(),
                  );
                  print(productNameFilterController.text);
                  context
                      .read<LoadProductsBloc>()
                      .add(FilterProducts(obj: obj, context: context));
                  productNameFilterController.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Apply Filters')),
          )
        ],
      ),
    );
  }
  
  Widget userTab(){
    return BlocBuilder<LoadProductsBloc, LoadProductsState>(
      builder: (context, pState) {
        debugPrint(pState.runtimeType.toString());
        return ListView(
            children: [
              _isVendor
                  ? ElevatedButton(
                  child:Text ("Become a Vendor"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ShopInformationForm();
                        }));})
                  :SizedBox(),
              if (pState is LoadedProductsState)
                Column(
                  children: [
                    Text("Featured Prpducts"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children:[
                        ProductCard(addToCart:true, id: null,),ProductCard(addToCart:true, id: null),
                      ]).space(height:100,width:double.infinity),
                    ),
                    Column(children: [
                      Text("All Categories")
                      ,
                      Row(children: [
                        ProductCard(addToCart:false, id: null,),ProductCard(addToCart:false, id: null,),
                      ]),
                      Row(children: [
                        ProductCard(addToCart:false, id: null,),ProductCard(addToCart:false, id: null,),
                      ]),
                    ],),
                  ],
                )
              else if (pState is FailuretoLoadState)
                Expanded(
                    child: Center(
                        child: Text(
                            "Internal Server Error. Try Again Later")))
              else if (pState is LoadingProductsState)
                  Expanded(
                    child:
                    Center(child: CircularProgressIndicator.adaptive()),
                  )
                else
                  Text(" error in something")
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: BlocBuilder<LoadProductsBloc, LoadProductsState>(
            builder: (context, pState) {
            return BlocBuilder<SearchVisibleBloc, SearchVisibleState>(
              builder: (context, searchState) {
                if (searchState is SearchVisibleDataState) {
                  return _isVendor
                  ? Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(120),
                      child: AppBar(
                        automaticallyImplyLeading:
                        searchState.isVisible ? false : true,
                        centerTitle: true,
                        elevation: 0.5,
                        title: searchState.isVisible
                            ? TextFormField(
                          controller: productNameSearchController,
                          onChanged: (value) =>
                              runSearch(productNameSearchController.text),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.appGreyColor
                                .withOpacity(0.1),
                            hintText: "            Search in All Products",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 11.0),
                              child: GestureDetector(
                                  onTap: () {
                                    productNameSearchController.clear();
                                    context.read<LoadProductsBloc>().add(
                                        LoadProductsPullToRefresh(
                                            isLoaded: flagLoad));
                                    context.read<SearchVisibleBloc>().add(
                                        ToggleSearch(
                                            isVisible:
                                            !searchState.isVisible));
                                  },
                                  child: Image.asset(
                                    "icons/close.png",
                                    height: 10,
                                  )),
                            ),
                            // prefixIcon: IconButton(
                            //     onPressed: () {
                            //       searchState.isVisible = false;
                            //       _jobTitleController.clear();
                            //       _runFilter("");
                            //     },
                            //     icon: Icon(Icons.arrow_back)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )
                            : Text(
                          '${AppStrings.kStringAppName}',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor),
                        ),
                        actions: [
                          searchState.isVisible
                              ? SizedBox.shrink()
                              : InkWell(
                            onTap: () {
                              searchState.isVisible = true;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                "icons/search-normal.png",
                              ),
                            ),
                          ),
                          PopupMenuButton(
                            icon: Icon(Icons.more_vert_rounded),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  child: Text('Filter Jobs'),
                                  value: 2,
                                ),
                                // PopupMenuItem(
                                //   child: Text('Sort Jobs'),
                                //   value: 3,
                                // ),
                              ];
                            },
                            onSelected: (value) {
                              switch (value) {
                                case 2:
                                  Future<void> future =
                                  showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(13)),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          filterProducts());
                                  break;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    body: userTab(),
                  )
                  : Scaffold(
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(120),
                        child: AppBar(
                            automaticallyImplyLeading:
                                searchState.isVisible ? false : true,
                            centerTitle: true,
                            elevation: 0.5,
                            title: searchState.isVisible
                                ? TextFormField(
                                    controller: productNameSearchController,
                                    onChanged: (value) =>
                                        runSearch(productNameSearchController.text),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.appGreyColor
                                          .withOpacity(0.1),
                                      hintText: "            Search in All Products",
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 11.0),
                                        child: GestureDetector(
                                            onTap: () {
                                              productNameSearchController.clear();
                                              context.read<LoadProductsBloc>().add(
                                                  LoadProductsPullToRefresh(
                                                      isLoaded: flagLoad));
                                              context.read<SearchVisibleBloc>().add(
                                                  ToggleSearch(
                                                      isVisible:
                                                          !searchState.isVisible));
                                            },
                                            child: Image.asset(
                                              "icons/close.png",
                                              height: 10,
                                            )),
                                      ),
                                      // prefixIcon: IconButton(
                                      //     onPressed: () {
                                      //       searchState.isVisible = false;
                                      //       _jobTitleController.clear();
                                      //       _runFilter("");
                                      //     },
                                      //     icon: Icon(Icons.arrow_back)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  )
                                : Text(
                                    '${AppStrings.kStringAppName}',
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackColor),
                                  ),
                            actions: [
                              searchState.isVisible
                                  ? SizedBox.shrink()
                                  : InkWell(
                                      onTap: () {
                                        searchState.isVisible = true;
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                          "icons/search-normal.png",
                                        ),
                                      ),
                                    ),
                              PopupMenuButton(
                                icon: Icon(Icons.more_vert_rounded),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(
                                      child: Text('Filter Jobs'),
                                      value: 2,
                                    ),
                                    // PopupMenuItem(
                                    //   child: Text('Sort Jobs'),
                                    //   value: 3,
                                    // ),
                                  ];
                                },
                                onSelected: (value) {
                                  switch (value) {
                                    case 2:
                                      Future<void> future =
                                          showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(13)),
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  filterProducts());
                                      break;
                                  }
                                },
                              ),
                            ],
                            bottom:TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                indicatorWeight: 3,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "User Dashboard",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Vendor Admin Dashboard",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ])),
                      ),
                      body: TabBarView(
                              children: [
                                userTab(),
                                VendorAdminTab() ])
                )
                  ;
                } else {
                  return SizedBox(child: Text("Error in Search Visibility"));
                }
            });
        }));
  }
}
