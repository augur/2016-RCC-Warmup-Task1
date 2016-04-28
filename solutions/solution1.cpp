#include <iostream>
#include <map>

int main() {

  std::string code;
  std::getline(std::cin, code);
  code.erase(code.find_last_not_of(" \n\r\t") + 1);

  std::string s_tries_count;
  std::getline(std::cin, s_tries_count);
  int tries_count = std::stoi(s_tries_count);
  std::string tries[tries_count];
  for(int i = 0; i < tries_count; i++) {
    std::getline(std::cin, tries[i]);
    tries[i].erase(tries[i].find_last_not_of(" \n\r\t")+1);
  };

  std::map<std::string, int> code_h;
  for (char& c : code) {
    std::string s(c, 1);
    code_h.insert(std::make_pair(s, 1));
  }

  for (std::string t : tries) {
    int total_right = 0;
    int missed_right = 0;
    for (int i = 0; i < t.length(); i++) {
      if (t[i] == code[i]) {
        total_right++;
      } else {
        std::string s(t[i], 1);
        if (code_h.count(s)) {
          missed_right++;
        }
      }

    }
    std::cout << total_right << " " << missed_right << std::endl;
  }

  return 0;
}
