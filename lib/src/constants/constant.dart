import 'package:practice_food_delivery/generated/assets.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/user_coupon_box.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/favorites/domain/user_favorites.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/food.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/menu.dart';
import 'package:practice_food_delivery/src/features/settings/domain/user_settings.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:sembast/utils/key_utils.dart';

class Constant {
  //settings const
  static const _maxUsers = 3;
  static const _maxUserOrders = 10;
  static const _maxUserTransactions = 20;
  static const _maxCoupons = 30;
  static const _couponTypes = CouponType.values;
  static const _feeType = FeeType.values;

  static const _restImages = [
    Assets.imagesRestaurant0,
    Assets.imagesRestaurant1,
    Assets.imagesRestaurant2,
    Assets.imagesRestaurant3,
    Assets.imagesRestaurant4,
  ];
  static final _maxRestaurants = _restImages.length;

  static const _foodsMap = {
    'burger': Assets.imagesBurger,
    'burrito': Assets.imagesBurrito,
    'pancakes': Assets.imagesPancakes,
    'pasta': Assets.imagesPasta,
    'pizza': Assets.imagesPizza,
    'ramen': Assets.imagesRamen,
    'salmon': Assets.imagesSalmon,
    'steak': Assets.imagesSteak,
  };

  static final _randomDates = List.generate(
    _maxUserOrders,
    (index) => getRandomBackwardDate(),
  )..sort();

  static final _foods = List.generate(
    _foodsMap.length,
    (index) {
      final name = _foodsMap.keys.toList()[index];
      final imageUrl = _foodsMap.values.toList()[index];

      return Food(
        id: index,
        name: name,
        imageUrl: imageUrl,
        price: getRandomPrice(),
      );
    },
  );

  //generate random models
  static final _coupons = List.generate(
    _maxCoupons, (index) {
      final id = index;
      final code = getRandomCouponCode();
      final couponType = getRandomItemFromList(_couponTypes);
      final feeType = getRandomItemFromList(_feeType);
      final available = getRandomAvailable();
      final maxUsageCount = getRandomMaxUsageCount();
      final minimumSpend = getRandomMinimumSpend();
      final expirationDate = available ? getRandomForwardDate() : getRandomBackwardDate();

      return switch(couponType) {
        CouponType.percentage => Coupon.percentage(
          id: index,
          code: code,
          feeType: feeType,
          available: available,
          maxUsageCount: maxUsageCount,
          value: getRandomPercentage(),
          maxDiscount: getRandomMaxDiscount(),
          minimumSpend: minimumSpend,
          expirationDate: expirationDate,
        ),
        CouponType.fixValue => Coupon.fixValue(
          id: id,
          code: code,
          feeType: feeType,
          available: available,
          maxUsageCount: maxUsageCount,
          value: getRandomValue(),
          minimumSpend: minimumSpend,
          expirationDate: expirationDate,
        ),
        CouponType.freeCharge => Coupon.freeCharge(
         id: id,
         code: code,
         feeType: feeType,
         available: available,
         maxUsageCount: maxUsageCount,
         minimumSpend: minimumSpend,
         expirationDate: expirationDate,
        ),
      };
    },
  )..sort((a,b) => a.expirationDate.compareTo(b.expirationDate));
  static final _userCouponBoxes = List.generate(
    _maxUsers, (index) {
      final usedCoupons = getRandomUsedCoupons(_coupons);

      return UserCouponBox(
        id: index,
        usedCoupons: usedCoupons,
      );
    },
  );
  static final _orders = _randomDates.map(
    (dateTime) {
      final index = getRandomIndexFromList(_restaurants);
      final chosenRestaurant = _restaurants[index];
      final restaurantName = chosenRestaurant.name;
      final distance = chosenRestaurant.distance;
      final menu = _menus[index].foods;
      final chosenFood = getRandomItemFromList(menu);
      final imageUrl = chosenFood.imageUrl;
      final foodName = chosenFood.name;
      final quantity = getRandomQuantity();
      final price = chosenFood.price;

      return Order(
        id: 0, //initial 0, then adjust later
        imageUrl: imageUrl,
        restaurantName: restaurantName,
        distance: distance,
        foodName: foodName,
        date: dateTime,
        quantity: quantity,
        price: price,
      );
    },
  ).toList();
  static final _transactions = List.generate(
    _maxUserTransactions,
    (index) {
      return Transfer(
        id: index,
        amount: getRandomTransferAmount(),
        transferType: getRandomTransferType(),
        paymentType: getRandomPaymentType(),
        transferCode: getRandomTransferCode(),
        referenceCode: getRandomReferenceCode(),
        transferDate: getRandomBackwardDate(),
      );
    },
  )..sort((a, b) => a.transferDate.compareTo(b.transferDate),);

  static final _users = List.generate(
    _maxUsers,
    (index) {
      return User(
        id: index,
        uid: generateStringKey(),
        displayName: getRandomUserName(),
        email: getRandomEmail(),
        backgroundColor: getRandomColor(),
      );
    },
  );
  static final _userSettings = List.generate(
    _maxUsers,
        (index) {
      return UserSettings(
        id: index,
        darkMode: getRandomDarkModeState(),
        seedColor: getRandomColor(),
      );
    },
  );
  static final _userProfile = _users.map((user) => UserProfile(
      id: user.id,
      displayName: user.displayName,
      email: user.email,
      phoneNumber: getRandomPhoneNumber(),
      gender: getRandomGender(),
      birthday: getRandomBirthday(),
      address: getRandomAddress(),
  ),).toList();
  static final _restaurants = List.generate(
    _maxRestaurants,
    (index) {
      return Restaurant(
          id: index,
          uid: generateStringKey(),
          name: getRandomRestaurantName(),
          imageUrl: _restImages[index],
          address: getRandomAddress(),
          distance: getRandomDistance(),
          rating: getRandomRating(),
      );
    },
  );
  static final _restaurantIds = _restaurants.map((restaurant) => restaurant.id).toList();
  static final _menus = List.generate(
    _restImages.length,
    (index) {
      return Menu(
        id: index,
        foods: getRandomList(
          _foods,
        ),
      );
    },
  );
  static final _userBalances = List.generate(
    _maxUsers,
    (index) {
      final dates = _userOrders[index].orders.map((order) => order.date);
      return UserBalance(
        id: index,
        balance: getRandomBalance(),
        createAt: dates.first!,
        updateAt: dates.last!,
        transferLog: reindex(getRandomList(_transactions, shuffle: false,),),
      );
    },
  );
  static final _userOrders = List.generate(
    _maxUsers,
    (index) {
      return UserOrder(
        id: index,
        orders: reindex(getRandomList(_orders, shuffle: false,),),
      );
    },
  );

  static final _userFavorites = List.generate(
      _maxUsers,
      (index) {
        return UserFavorites(
          id: index,
          favorites: getRandomList(_restaurantIds),
        );
      },
  );

  //get Keys
  List<String> get getUserUids => _users.map((user) => user.uid).toList();
  List<String> get getRestaurantUids => _restaurants.map((restaurant) => restaurant.uid).toList();

  //get Restaurants
  List<Restaurant> get getRestaurants => _restaurants;
  List<Map<String, dynamic>> get getRestaurantJsons => _restaurants.map((restaurant) => restaurant.toJson()).toList();
  //get Menus
  // pay attention: require to edit _$$MenuImplToJson in menu.g.dart
  List<Menu> get getMenus => _menus;
  List<Map<String, dynamic>> get getMenuJsons => _menus.map((menu) => menu.toJson()).toList();

  //get coupons
  List<Coupon> get getCoupons => reindex(_coupons);
  List<Map<String, dynamic>> get getCouponJsons => reindex(_coupons).map((coupon) => coupon.toJson()).toList();

  // get users
  List<User> get getUsers => _users;
  List<Map<String, dynamic>> get getUserJsons => _users.map((user) => user.toJson()).toList();
  // get userSettings
  List<UserSettings> get getUserSettings => _userSettings;
  List<Map<String, dynamic>> get getUserSettingJsons => _userSettings.map((userSettings) => userSettings.toJson()).toList();
  // get userProfiles
  List<UserProfile> get getUserProfiles => _userProfile;
  List<Map<String, dynamic>> get getUserProfileJsons => _userProfile.map((userProfile) => userProfile.toJson()).toList();
  // get userOrders
  // pay attention: require to edit _$$UserOrderImplToJson in user_orders.g.dart
  List<UserOrder> get getUserOrders => _userOrders;
  List<Map<String, dynamic>> get getUserOrderJsons => _userOrders.map((userOrder) => userOrder.toJson()).toList();
  // get userFavorites
  List<UserFavorites> get getUserFavorites => _userFavorites;
  // int is primary value, so 'favorites' key will keep <int>[]. It's ok no problem
  List<Map<String, dynamic>> get getUserFavoriteJsons => _userFavorites.map((userFavorite) => userFavorite.toJson()).toList();
  // get userBalances
  // pay attention: require to edit _$$UserBalanceImplToJson in user_balance.g.dart
  List<UserBalance> get getUserBalances => _userBalances;
  List<Map<String, dynamic>> get getUserBalanceJsons => _userBalances.map((userBalance) => userBalance.toJson()).toList();
  //get userCouponBoxes
  List<UserCouponBox> get getUserCouponBoxes => _userCouponBoxes;
  List<Map<String, dynamic>> get getUserCouponBoxJsons => _userCouponBoxes.map((userCouponBox) => userCouponBox.toJson()).toList();
}
