class Helpers {
  static capitalize(String s){
    return s[0].toUpperCase() + s.substring(1);
  }

  static formatCountingNumber(String number){
    switch(number){
      case '1':
        return number.toString() + 'st';
        break;
      case '2':
        return number.toString() + 'nd';
        break;
      case '3': 
        return number.toString() + 'rd';
        break;
      default:
        return number.toString() + 'th';
    }
  }
}