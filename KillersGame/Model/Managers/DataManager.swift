//
//  DataManager.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 05.02.2021.
//

import Foundation
import CoreData

class DataManger: NSObject, NSFetchedResultsControllerDelegate {
    static let shared = DataManger()

    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "KillersGame")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
    }()
    
    var userFetchResultController: NSFetchedResultsController<User>!
    var lobbyFetchResultController: NSFetchedResultsController<Lobby>!
    lazy var context = persistentContainer.viewContext
    
    //MARK: - Functions for User
    
    func getUserWithName(with name: String) -> [User]{
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let predicate = NSPredicate(format: "fullName = %@", name)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(User.userId), ascending: true)
        
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        userFetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        userFetchResultController.delegate = self
        try? userFetchResultController.performFetch()
        //print(userFetchResultController.fetchedObjects!)
        return userFetchResultController.fetchedObjects!
        
    }
    
    func getUserWithLogin(with login: String) -> [User]{
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let predicate = NSPredicate(format: "login = %@", login)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(User.userId), ascending: true)
        
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        userFetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        userFetchResultController.delegate = self
        try? userFetchResultController.performFetch()
        //print(userFetchResultController.fetchedObjects!)
        return userFetchResultController.fetchedObjects!
        
    }
    
    
    func checkAuth(withLogin login: String, withPassword password: String) -> [User]?{
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let predicate = NSPredicate(format: "login = %@ && password = %@", login, password)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(User.userId), ascending: true)
        
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        userFetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        userFetchResultController.delegate = self
        try? userFetchResultController.performFetch()
        if !userFetchResultController.fetchedObjects!.isEmpty {
            return userFetchResultController.fetchedObjects
        }
        return nil
        
    }
    
    func getStatistics(withLogin login: String) -> Statistic {
        let user: [User] = self.getUserWithLogin(with: login)
        return user[0].statistic!
    }
    
    func saveUser(login: String, password: String, name: String){
        let user = User(context: context)
        user.login = login
        user.password = password
        user.fullName = name
        user.userId = UUID.init()
        user.statistic = Statistic(context: context)
        saveContext()
        
    }
    
    //MARK: - Functions for Lobby
    func saveLobby(withName name: String, withPassword password: String, withUser user: User){
        let lobby = Lobby(context: context)
        lobby.name = name
        lobby.password = password
        lobby.addToUsers(user)
        lobby.lobbyId = UUID.init()
        saveContext()
        
    }
    
    func getLobbyWithName(withName name: String) -> [Lobby]?{
        let fetchRequest: NSFetchRequest<Lobby> = Lobby.fetchRequest()
        let predicate = NSPredicate(format: "name = %@", name)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Lobby.lobbyId), ascending: true)
        
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        lobbyFetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        lobbyFetchResultController.delegate = self
        try? lobbyFetchResultController.performFetch()
        //print(lobbyFetchResultController.fetchedObjects!)
        if !lobbyFetchResultController.fetchedObjects!.isEmpty {
            return lobbyFetchResultController.fetchedObjects!
        }
        return nil
    }
    
    func getLobbys() -> [Lobby]?{
        let fetchRequest: NSFetchRequest<Lobby> = Lobby.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Lobby.lobbyId), ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        lobbyFetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        lobbyFetchResultController.delegate = self
        
        try? lobbyFetchResultController.performFetch()
        //print(lobbyFetchResultController.fetchedObjects!)
        if !lobbyFetchResultController.fetchedObjects!.isEmpty {
            return lobbyFetchResultController.fetchedObjects!
        }
        return nil
    }

    // MARK: - CRUD

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    

}
