class ApiUtil{
//  static const String MAIN_API_URL='https://general-shop.herokuapp.com/api/';
  static const String MAIN_API_URL='http://10.0.2.2:8000/api/';

  static const String AUTH_REGISTER_URL=MAIN_API_URL+'auth/register';
  static const String AUTH_LOGIN_URL=MAIN_API_URL+'auth/login';
  static const String PRODUCT_API_URL=MAIN_API_URL+'products';
  static const String PRODUCT_id_API_URL=MAIN_API_URL+'products/';
  static const String CATEGORY=MAIN_API_URL+'categories';

  static const String COUNTRIES=MAIN_API_URL+'countries';
  static String CITIES(int id){
    return MAIN_API_URL+'countries/'+id.toString()+'/cities';
  }
  static  String STATES(int id){
    return MAIN_API_URL+'countries/'+id.toString()+'/states';

  }
  static const TAGS=MAIN_API_URL+'tags';



}