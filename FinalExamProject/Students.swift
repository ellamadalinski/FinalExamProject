//
//  Students.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 11/30/21.
//

import Foundation

public class StaticStuff: Codable {
    public static var name = ""
    public static var classesArray = [Class]()
    public static var athleticArray = [Athletic]()
    public static var clubArray = [Club]()
    
}

class Students: Codable{
    var name: String
    var daysMissed: [String]
    var studentNotes: [String]
    var weight: Int
    var height: Int
    var year: Int
    var absent = false
    init(n: String, dm: [String], sn: [String], w: Int, h: Int, y: Int, a: Bool){
        name = n
        daysMissed = dm
        studentNotes = sn
        weight = w
        height = h
        year = y
        absent = a
    }
    init() {
        name = "default"
        daysMissed = [String]()
        studentNotes = [String]()
        weight = 0
        height = 0
        year = 0
    }
    
    
}

public class Class: Codable {
    var className: String
    var classPeriod: String
    var studentsArray: [Students]
    
    init(c: String, cp: String, sa: [Students]) {
        className = c
        classPeriod = cp
        studentsArray = sa
    }
}

public class Athletic: Codable {
    var athleticName: String
    var season: String
    var studentsArray: [Students]
    
    init(a: String, sa: [Students], s: String) {
        athleticName = a
        studentsArray = sa
        season = s
    }
}

public class Club: Codable {
    var clubName: String
    var studentsArray: [Students]
    
    init(c: String, sa: [Students]) {
        clubName = c
        studentsArray = sa
    }
}
