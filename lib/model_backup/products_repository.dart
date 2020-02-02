// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'product.dart';

class ProductsRepository {

  static List<Product> loadProducts(Category category) {
    const allProducts = <Product> [
      Product(
        category: Category.accessories,
        id: 0,
        isFeatured: true,
        name: 'Mint',
        // price: 120,
      ),
      Product(
        category: Category.accessories,
        id: 1,
        isFeatured: true,
        name: 'Aloe vera',
        // price: 58,
      ),
      Product(
        category: Category.accessories,
        id: 3,
        isFeatured: true,
        name: 'Mkz',
        // price: 58,
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}


