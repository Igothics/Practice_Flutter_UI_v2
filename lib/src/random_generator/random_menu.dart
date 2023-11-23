part of 'random_data_generator.dart';

extension MenuGroup on RandomData {
  static final _foodsMap = {
    'burger': Assets.imagesBurger,
    'burrito': Assets.imagesBurrito,
    'pancakes': Assets.imagesPancakes,
    'pasta': Assets.imagesPasta,
    'pizza': Assets.imagesPizza,
    'ramen': Assets.imagesRamen,
    'salmon': Assets.imagesSalmon,
    'steak': Assets.imagesSteak,
  };
  static final _foodsCount = _foodsMap.length;
  static final _foods = List.generate(
    _foodsCount, (index) {
      final name = _foodsMap.keys.elementAt(index);
      final imageUrl = _foodsMap.values.elementAt(index);
      return Food(
        id: index,
        name: name,
        imageUrl: imageUrl,
        price: getRandomPrice(),
      );
    },
  );
  static final _menus = List.generate(
    RestaurantGroup._restaurantCount, (index) {
      return Menu(
        id: index,
        foods: getRandomList(_foods,),
      );
    },
  );

  List<Menu> get getMenus => _menus;
  List<Map<String, dynamic>> get getMenuJsons => _menus.map((menu) => menu.toJson()).toList();
}
