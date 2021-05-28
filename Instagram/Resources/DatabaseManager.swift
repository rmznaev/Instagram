//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Ramazan Abdullayev on 26.05.21.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if username and email are available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    /// Inserts new data to database
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion:  Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
        }
    }
}
