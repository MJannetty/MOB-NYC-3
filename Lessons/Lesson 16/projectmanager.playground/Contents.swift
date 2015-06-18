//: Playground - noun: a place where people can play

import Foundation


class Task {
    var assignee: User?
    var priority: Int?
    var title: String
    
    init(title:String){
        self.title = title
    }
    
    func assignUser (user:User) {
        //add this user to the assignee
        self.assignee = user
        
        //add the task to the user's assigned tasks
        user.tasksAssigned.append(self)
        
        
    }
}

class User {
    var name: String
    
    var projectsAssigned: [Project] = []
    var assignedProjects: [Project] = []
    var tasksAssigned: [Task] = []
    
    init(name:String) {
        self.name = name
        
    }
}

class Project {
    var title: String
    var description: String?
    var priority: String?
    
    var assignees: [User] = []
    var tasks: [Task] = []
    var creator: User

    init(title:String, creator:User) {
        self.title = title
        self.creator = creator
    }
    
    func assignUser(user:User) {
        //Add the user to the list of users in the project
        self.assignees.append(user)
        
        //add the project to the list of projects for the user
        user.assignedProjects.append(self)
    }
}


let myself = User (name: "Toshi")
let final = Project(title:"My Final Project",creator:myself)
