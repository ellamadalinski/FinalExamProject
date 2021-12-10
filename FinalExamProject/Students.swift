//
//  Students.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 11/30/21.
//

import Foundation

public class StaticStuff {
    public static var name = ""
    public static var classesArray = [Class]()
    public static var athleticArray = [Athletic]()
    public static var clubArray = [Club]()
    
}

class Students{
    var name: String
    var daysMissed: [Int]
    var studentNotes: String
    var weight: Int
    var height: Int
    var year: Int
    
    init(n: String, dm: [Int], sn: String, w: Int, h: Int, y: Int){
        name = n
        daysMissed = dm
        studentNotes = sn
        weight = w
        height = h
        year = y
    }
    init() {
        name = "default"
        daysMissed = [Int]()
        studentNotes = ""
        weight = 0
        height = 0
        year = 0
    }
    //you ever just jump off a cliff fosho?
    //yeah fosho
}

public class Class {
    var className: String
    var classPeriod: String
    var studentsArray: [Students]
    
    init(c: String, cp: String, sa: [Students]) {
        className = c
        classPeriod = cp
        studentsArray = sa
    }
}

public class Athletic {
    var athleticName: String
    var season: String
    var studentsArray: [Students]
    
    init(a: String, sa: [Students], s: String) {
        athleticName = a
        studentsArray = sa
        season = s
    }
}

public class Club {
    var clubName: String
    var studentsArray: [Students]
    
    init(c: String, sa: [Students]) {
        clubName = c
        studentsArray = sa
    }
}
