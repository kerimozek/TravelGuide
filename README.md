# FMSS-Homework-3
    TRAVEL GUIDE
![screenshot](https://github.com/kerimozek/TravelGuide/blob/main/TravelGuide/app%20images/app-icon.png)

## Description
- There are 3 sections in TabBar.
- In the first section, the text is fetched with the mock JSON and displayed in the collectionview. And there are 2 button to go Flights List and Hotels List.
- At the Flights and Hotels screen there is tableview. Fetching flights and hotels informations with the API and mock JSON to set tableview.
- In the second section, there is SearchBar to search flights and hotels. When you enter more than 2 letters or numbers in the search bar, the search function will be triggered and a list of hotels and flights will appear 0.5 seconds later. 
- In the third section, we will have flights, hotels or travel articles that we saved to CoreData.
- You can go to details screen with click any tableview row or collectionview item.
- When you click on any 'row' saved in the Tableview, it goes to the detail page and the detail information appears there. When the 'Remove Bookmark' button is pressed, data will delete from CoreData.
- If the app is not working because of Kingfisher or Alamofire, please wait for Kingfisher and Alamofire to finish fetch. If the problem persists, you should install Kingfisher and Alamofire from Swift Package Manager. Or just right click on Kingfisher and Alamofire and press "Add Packages" to add missing packages.

## NOTE: 
- I used both mock JSON and API to fetch Flights data. If you want the data to be fetched via API, you can change the code in the getMainData() function from the FlightsViewModel.

# TOOLS

## Swift 
- Delegate
- Navigation Controller
- POP
 - OOP

## Design Pattern Architecture      
- MVVM

## UIKit
- CollectionView
- TableView
- TabBar
- SearchBar
 
## Network
- Alamofire
- Mock JSON
- API

## Database
- CoreData

     
![screenshot](https://github.com/kerimozek/TravelGuide/blob/main/TravelGuide/app%20images/main.png)
![screenshot](https://github.com/kerimozek/TravelGuide/blob/main/TravelGuide/app%20images/search.png)
![screenshot](https://github.com/kerimozek/TravelGuide/blob/main/TravelGuide/app%20images/details.png)
![screenshot](https://github.com/kerimozek/TravelGuide/blob/main/TravelGuide/app%20images/launchscreen-bookmarks.png)
