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
    const allProducts = <Product>[
      Product(
        category: Category.plant,
        id: 0,
        name: 'Aloe Vera',
        nameThai: 'ว่านหางจรเข้',
        imgSrc: 'game/real_plant/aloevera.jpg',
        detail:
            'ว่านหางจระเข้ เป็นต้นพืชที่มีเนื้ออิ่มอวบ จัดอยู่ในตระกูลลิเลี่ยม (Lilium) แหล่งกำเนิดดั้งเดิมอยู่ในชายฝั่งทะเลเมดิเตอร์เรเนียนและบริเวณตอนใต้ของทวีปแอฟริกา พันธุ์ของว่านหางจระเข้มีมากมายกว่า 300 ชนิด ซึ่งมีทั้งพันธุ์ที่มีขนาดใหญ่มากจนไปถึงพันธุ์ที่มีขนาดเล็กกว่า 10 เซนติเมตร ลักษณะพิเศษของว่านหางจระเข้ก็คือ มีใบแหลมคล้ายกับเข็ม เนื้อหนา และเนื้อในมีน้ำเมือกเหนียว ว่านหางจระเข้ผลิดอกในช่วงฤดูหนาว ดอกจะมีสีต่างๆกัน เช่น เหลือง ขาว และแดง เป็นต้น',
      ),
      Product(
        category: Category.plant,
        id: 1,
        name: 'Bamboo',
        nameThai: 'ไผ่',
        imgSrc: 'game/real_plant/bamboo.jpg',
        detail:
            'ไผ่ เป็นพืชมีเนื้อไม้แข็งความสูงแล้วแต่ชนิด มีเหง้าอยู่ใต้ดิน ลำต้นตรง มีข้อและปล้องชัดเจน ปล้องภายในกลวง ขนาดกว้างยาวแล้วแต่ละชนิดใบ ใบเดี่ยว ออกสลับรูปใบหอก ปลายเรียวแหลม โคนมน ขอบใบสากคาย ดอก ออกเป็นช่อตามซอกใบและปลายกิ่ง',
      ),
      Product(
        category: Category.plant,
        id: 2,
        name: 'Coconut',
        nameThai: 'มะพร้าว',
        imgSrc: 'game/real_plant/coconut.jpg',
        detail:
            'มะพร้าว เป็นพืชยืนต้นชนิดหนึ่ง อยู่ในตระกูลปาล์ม มะพร้าว เป็นพืชซึ่งสามารถใช้ประโยชน์ได้ในหลายทาง เช่น น้ำและเนื้อมะพร้าวอ่อนใช้รับประทาน เนื้อในผลแก่นำไปขูดและคั้นทำกะทิ กะลานำไปประดิษฐ์สิ่งของต่าง ๆ เช่น กระบวย โคมไฟ ฯลฯ นอกจากนี้มะพร้าวจัดเป็นพรรณไม้มงคลชนิดหนึ่ง ตามตำราพรหมชาติฉบับหลวง ได้กำหนดให้ปลูกมะพร้าวไว้ทางทิศตะวันออกของบ้าน เพื่อความสิริมงคล​',
      ),
      Product(
        category: Category.plant,
        id: 3,
        name: 'Green Tea',
        nameThai: 'ชาเขียว',
        imgSrc: 'game/real_plant/greentea.jpg',
        detail:
            'ชาเขียว เป็นชาที่เก็บเกี่ยวจากพืชในชนิด Camellia sinensis เช่นเดียวกับ ชาขาว ชาดำ และชาอู่หลง ชาที่ไม่ผ่านการหมัก ซึ่งมีประโยชน์ต่อสุขภาพและมีคุณสมบัติในการต้านทานโรคได้นานาชนิดจึงเป็นที่นิยมของคนส่วนใหญ่ น้ำชาจะเป็นสีเขียวหรือเหลืองอมเขียว กลิ่นหอมอ่อนกว่าอู่หลง ชาเขียวหลงจิ่งที่ราคาสูงที่สุด คือ ฉือเฟิ่งหลงจิ่ง ที่ชงจากใบ จะให้กลิ่นหอมอ่อน ๆ บ้างว่าคล้ายถั่วเขียว รสฝาดน้อย เซนฉะที่ชงจากใบมีกลิ่นอ่อน ๆ จนเข้มได้ขึ้นกับการคั่ว บางครั้งมีรสอุมามิจนถึงรสหวานที่รับรู้ได้เฉพาะบางคนเท่านั้น น้ำมันในตัวชาเขียวผ่านการกลั่นมีผลดีต่อร่างกาย ในประเทศไทยจะมีการแต่งกลิ่นเพื่อให้เกิดความน่ารับประทานมากขึ้น',
      ),
      Product(
        category: Category.plant,
        id: 4,
        name: 'Maple',
        nameThai: 'เมเปิ้ล',
        imgSrc: 'game/real_plant/maple.jpg',
        detail:
            'เมเปิลส่วนมากจะสูง 10-40 เมตร (30-130 ฟุต) อาจมีบางชนิดสูงน้อยกว่า 10 เมตร โดยมีลำต้นแตกเป็นลำเล็กหลายลำ ลักษณะเป็นไม้พุ่ม ส่วนมากจะมีการผลัดใบแต่มีบางชนิดในเอเชียใต้และแถบทะเลเมดิเตอร์เรเนียนที่จะเขียวตลอดทั้งปีโดยไม่ผลัดใบ เมื่อยังเล็กจะเติบโตในที่ร่มและเข้าแทนที่กลายเป็นไม้ใหญ่ที่ให้ร่มเงานั้นเสียเองในระบบนิเวศ ระบบรากของเมเปิลจะเป็นเส้นหนาแน่น และบางชนิดอย่าง Acer cappadocicum บ่อยครั้งที่มันจะผลิตรากที่สามารถพัฒนากลายเป็นต้นใหม่ได้',
      ),
      Product(
        category: Category.plant,
        id: 5,
        name: 'Rice',
        nameThai: 'ข้าว',
        imgSrc: 'game/real_plant/rice.jpg',
        detail: 'ข้าว เป็นเมล็ดของพืชในสกุลข้าวที่พบมากในเอเชีย ข้าวเป็นธัญพืชซึ่งประชากรโลกบริโภคเป็นอาหารสำคัญ โดยเฉพาะอย่างยิ่งในทวีปเอเชีย จากข้อมูลเมื่อปี 2553 ข้าวเป็นธัญพืชซึ่งมีการปลูกมากที่สุดเป็นอันดับสามทั่วโลก รองจากข้าวสาลีและข้าวโพด ข้าวเป็นธัญพืชสำคัญที่สุดในด้านโภชนาการและการได้รับแคลอรีของมนุษย์ เพราะข้าวโพดส่วนใหญ่ปลูกเพื่อจุดประสงค์อื่น มิใช่ให้มนุษย์บริโภค ทั้งนี้ ข้าวคิดเป็นพลังงานกว่าหนึ่งในห้าที่มนุษย์ทั่วโลกบริโภค',
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
