import 'dart:math';

class LongestCommonSubString {
  static int longestCommonSubString(String str1, String str2) {
    var dp = List.generate(str1.length + 1,
        (index) => List<int?>.filled(str2.length + 1, null, growable: false),
        growable: false);
    int res = 0;
    for (int i = 0; i < str1.length + 1; i++) {
      for (int j = 0; j < str2.length + 1; j++) {
        if (i == 0 || j == 0) {
          dp[i][j] = 0;
        }
        else if (str1[i-1] == str2[j-1]){
          dp[i][j] = dp[i-1][j-1]! + 1;
          res = (dp[i][j]! > res ? dp[i][j] : res)!;
        }
        else {
          dp[i][j] = 0;
        }
      }
    }
    return res;
  }

  static double getSimilarity(String str1, String str2){
    return longestCommonSubString(str1, str2)/str1.length;
  }
}

void main(){
  print(LongestCommonSubString.getSimilarity('TRẦN NGỌC PHIÊN', 'TRÀN NGỌC PHIÊN'));
}
