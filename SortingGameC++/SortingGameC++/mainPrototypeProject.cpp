
#include <iostream>
#include <map>
#include <cstdlib>
#include <ctime>
using namespace std;

class Item{
	private:
		//id is to assign each different type of item a number ID for calling an object based off of its ID
		int id;
		string category;
		string name;
	public:
		//setters
		void setID(int _id) { id = _id; }
		void setCategory(string _category) { category = _category; }
		void setName(string _name) { name = _name; }
		//getters
		int getID() { return id; }
		string getCategory() { return category; }
		string getName() { return name; }
		//constructor
		Item(){
			id = 0;
			category = "error";
			name = "error";
		}
		Item(int _id, string _category, string _name){
			id = _id;
			category = _category;
			name = _name;
		}
		//helper method
		void createItem(int _id){
			id = _id;
			switch(id){
				case 1:
					category = "shelf 1";
					name = "lemon";
					break;
				case 2:
					category = "shelf 2";
					name = "apple";
					break;
				case 3:
					category = "shelf 3";
					name = "";
					break;
				case 4:
					category = "shelf 4";
					name = "";
					break;
				default:
					category = "shelf 1";
					name = "lemon";
					break;
			}
			
		}
};

int main(){
	//declare variables
	map<int, Item> itemMap;
	Item item;
	int chosenID = 0;
	int userInput = 0;
	//create items
	for(int i = 0; i < 10; ++i){
		//generate random items
		srand(time(0));
		chosenID = 1 + rand() % 4;
		item.createItem(chosenID);
		//add to map
		itemMap[i] = item;
	}
	//test loop to make sure objects are being created correctly
	for(int i = 0; i < 10; ++i){
		cout << "Item ID: " << itemMap[i].getID() << endl;
		cout << "Item Name: "<< itemMap[i].getName() << endl;
		cout << "Belongs on " << itemMap[i].getCategory() << endl;
		cout << endl;
	}
	return 0;
}
