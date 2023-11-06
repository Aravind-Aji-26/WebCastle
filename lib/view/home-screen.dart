import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nov_project/model/homeData.dart';
import 'package:nov_project/provider/homeProvider.dart';
import 'package:nov_project/widgets/appbar.dart';
import 'package:nov_project/widgets/categories.dart';
import 'package:nov_project/widgets/collection.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token;
  HomeData? homeData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    return Provider.of<HomeProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ),
            );
          } else {
            if (snapshot.hasData) {
              final homeData = snapshot.data as HomeData;
              return HomeScreenBody(
                homeData: homeData,
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  final HomeData homeData;
  const HomeScreenBody({Key? key, required this.homeData}) : super(key: key);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.81,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.homeData.data?.homeFields?.length,
              itemBuilder: (context, index) {
                final homeField = widget.homeData.data?.homeFields?[index];
                switch (homeField?.type) {
                  case 'carousel':
                    return Carousel(carosuelItems: homeField?.carouselItems ?? []);
                  case 'brands':
                    return BrandList(brands: homeField?.brands ?? []);
                  case 'category':
                    return CategoriesGrid(categories: homeField?.categories ?? []);
                  case 'collection':
                    return CollectionList(products: homeField?.products ?? [],title: homeField?.name ?? '',);
                  case 'banner':
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Image.network(
                        homeField?.banner?.image ?? '',
                        fit: BoxFit.fill,
                      ),
                    );
                  default:
                    return Container();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Carousel extends StatelessWidget {
  final List<CarouselItems> carosuelItems;
  const Carousel({Key? key, required this.carosuelItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(),
      items: carosuelItems
          .map((item) => Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                    height: 150,
                    child: Image.network(
                      item.image ?? '',
                      fit: BoxFit.contain,
                    )),
              )))
          .toList(),
    );
  }
}

class BrandList extends StatelessWidget {
  final List<Brands> brands;
  const BrandList({Key? key, required this.brands}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shop by brands',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                'View All',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 110,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.network(
                  brands[index].image ?? '',
                  fit: BoxFit.contain,
                ),
              ),
              itemCount: brands.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
