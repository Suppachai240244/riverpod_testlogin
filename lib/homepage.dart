import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_codium/widget/responsive.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  List<ProductData> products = [
    ProductData(
        name: 'A1',
        title:
            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
        image: 'assets/1.jpeg'),
    ProductData(
        name: 'B2',
        title:
            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
        image: 'assets/2.jpeg'),
    ProductData(
        name: 'C3',
        title:
            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
        image: 'assets/3.jpeg'),
    ProductData(
        name: 'D4',
        title:
            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
        image: 'assets/4.jpeg'),
    ProductData(
        name: 'E5',
        title:
            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
        image: 'assets/5.jpeg'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //const Layout layout = Layout.row;
    debugPrint('istablet :${ResponsiveBreakpoints.of(context).isMobile}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent[100],
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'A',
                    style: getBodyWhite(context),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'B',
                    style: getBodyWhite(context),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'C',
                    style: getBodyWhite(context),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'D',
                    style: getBodyWhite(context),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'E',
                    style: getBodyWhite(context),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const Icon(
                Icons.login_outlined,
                color: Colors.white,
              )
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                'Test Responsive Breakpoints',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: products.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ResponsiveRowColumn(
            //         rowMainAxisAlignment: MainAxisAlignment.center,
            //         rowSpacing: 25,
            //         layout: layout == ResponsiveBreakpoints.of(context).isTablet
            //             ? ResponsiveRowColumnType.ROW
            //             : ResponsiveRowColumnType.COLUMN,
            //         rowPadding: const EdgeInsets.all(5),
            //         columnPadding: const EdgeInsets.all(5),
            //         columnCrossAxisAlignment: CrossAxisAlignment.center,
            //         columnMainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           ResponsiveRowColumnItem(
            //             child: ListView.builder(
            //               itemCount: products.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return ProductWidget(
            //                   productData: products[index],
            //                 );
            //               }
            //             ),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),

            Expanded(
              child: ResponsiveScaledBox(
                width: ResponsiveBreakpoints.of(context).isMobile ? 300 : 550,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ResponsiveBreakpoints.of(context).isMobile ? 1 : 2,
                    //crossAxisSpacing: 10.0,
                    mainAxisSpacing:
                        ResponsiveBreakpoints.of(context).isMobile ? 10 : 5,
                    mainAxisExtent:
                        ResponsiveBreakpoints.of(context).isMobile ? 200 : 220,
                  ),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(
                      productData: products[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productData,
  });

  final ProductData productData;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              productData.image,
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData.name,
                    style: getBodyWhite(context),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productData.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getBodyWhite(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum Layout {
  row,
  column,
}

class ProductData {
  final String name;
  final String image;
  final String title;
  ProductData({
    required this.name,
    required this.image,
    required this.title,
  });
}
