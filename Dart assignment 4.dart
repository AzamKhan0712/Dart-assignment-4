Q1    Create a list of integers and find the longest subsequence of consecutive numbers in the list.

void main() {
  
  List<int> nums = [3, 4, 9, 4, 9, 5, 7, 6];
  
  int maxLength = 0;
  int currLength = 1;
  int startIndex = 0;
  int endIndex = 0;
  
  for (int i = 1; i < nums.length; i++) {
    if (nums[i] == nums[i-1] + 1) {
      currLength++;
      if (currLength > maxLength) {
        maxLength = currLength;
        endIndex = i;
        startIndex = endIndex - maxLength + 1;
      }
    } else {
      currLength = 1;
    }
  }
  
  List<int> longestSubsequence = nums.sublist(startIndex, endIndex + 1);
  print("Longest subsequence of consecutive numbers: $longestSubsequence");
}




Q2     Create a map that associates the names of cities with their latitude and longitude coordinates. Given a starting and ending city, find the shortest distance between them (you can assume a spherical Earth).



import 'dart:math';
Map<String, List<double>> cityCoordinates = {
  

'Islamabad'  : [33.6844, 73.0479],
'Karachi'    : [24.8607, 67.0011],
'Lahore'     : [31.5820, 74.3294],
'Faisalabad' : [31.4167, 73.0833],
'Rawalpindi' : [33.6058, 73.0437],
'Multan'     : [30.1956, 71.4753],
'Peshawar'   : [34.0150, 71.5251],
'Quetta'     : [30.1841, 67.0011],
'Gujranwala' : [32.1617, 74.1883],
'Sargodha'   : [32.0836, 72.6711],
'Hyderabad'  : [25.3969, 68.3771],
'Bahawalpur' : [29.3956, 71.6833],
'Sialkot'    : [32.4949, 74.5227],
'Sukkur'     : [27.7052, 68.8574],
'Larkana'    : [27.5589, 68.2120],

};



double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const earthRadius = 6371; // in km

  final dLat = _toRadians(lat2 - lat1);
  final dLon = _toRadians(lon2 - lon1);

  final a = pow(sin(dLat / 2), 2) +
          cos(_toRadians(lat1)) *
              cos(_toRadians(lat2)) *
              pow(sin(dLon / 2), 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  final distance = earthRadius * c;
  return distance;
}

double _toRadians(double degree) {
  return degree * pi / 180;
}

void main() {
  final startCity = 'Karachi';
  final endCity = 'Islamabad';
  final startCoords = cityCoordinates[startCity]!;
  final endCoords = cityCoordinates[endCity]!;
  final distance = calculateDistance(
      startCoords[0], startCoords[1], endCoords[0], endCoords[1]);
  print('The distance between $startCity and $endCity is ${distance.round()} km.');
}





Q3    Create a list of maps, where each map represents a product with a name, price, and quantity. Sort the list by the total cost of each product (price x quantity) in descending order.


void main() {
  List<Map<String, dynamic>> product = [
    {'product_name': 'Mobile', 'price': 75000, 'quantity': 1},
    {'product_name': 'Laptop', 'price': 65000, 'quantity': 2},
    {'product_name': 'Radio',  'price' : 500,  'quantity': 20 },
    {'product_name': 'Stove',  'price' : 1200, 'quantity': 3},
    {'product_name': 'LED TV', 'price': 50000, 'quantity': 7},
  ];

  product.sort((a, b) =>
      (b['price'] * b['quantity'].compareTo(a['price'] * a['quantity'])));
  print("\n\nSno  Items      Quantity       Price          Total Ammount");
  for (int i = 0; i < product.length; i++) {
    int serialNumber = i + 1;
    String name = product[i]['product_name'];
    int price = product[i]['price'];
    int quantity = product[i]['quantity'];
    int total = price * quantity;
   
    print(
        "\n  $serialNumber. $name \tQuantity:$quantity    Price:$price       | Total:$total");
  }
  
}



Q4   Create a map that associates the names of countries with their population and area. Find the top 5 largest countries by population density (population / area).



  Map<String, Map<String, double>> countries = {
    'China': {'population': 1393.78, 'area': 9.597},
    'India': {'population': 1366.42, 'area': 3.287},
    'United States': {'population': 329.88, 'area': 9.834},
    'Indonesia': {'population': 269.12, 'area': 1.904},
    'Pakistan': {'population': 220.16, 'area': 0.796},
    'Brazil': {'population': 213.99, 'area': 8.516},
    'Nigeria': {'population': 200.96, 'area': 0.923},
    'Bangladesh': {'population': 167.09, 'area': 0.147},
    'Russia': {'population': 146.75, 'area': 17.098},
    'Mexico': {'population': 127.58, 'area': 1.964},
  };
  
 
  List<MapEntry<String, double>> sortedCountries = countries.entries.map((m) {
    double density = m.value['population'] / m.value['area'];
    return MapEntry(m.key, density);
  }).toList()..sort((a, b) => b.value.compareTo(a.value));
  
  print('Top 5 largest countries by population density:');
  for (int i = 0; i < 5; i++) {
    print('${i+1}. ${sortedCountries[i].key}: ${sortedCountries[i].value}');
  }
}
 


Q5  Create a list of strings and find the longest common subsequence (substring) among all the strings in the list.

void main() {
  List<String> strings = ['helloworld', 'helloToAll', 'helloEveryone'];
  String longestCommonSubstring = getLongestCommonSubstring(strings);
  print(longestCommonSubstring); 
}

String getLongestCommonSubstring(List<String> strings) {
String firstString = strings[0];
int maxLength = firstString.length;
String longestCommonSubstring = '';

for (int i = 0; i < maxLength; i++) {
for (int j = i + 1; j <= maxLength; j++) {
      String substring = firstString.substring(i, j);

      bool allContain = strings.every((element) => element.contains(substring));

if (allContain && substring.length > longestCommonSubstring.length) {
        longestCommonSubstring = substring;
}
}
}

return longestCommonSubstring;
 }




