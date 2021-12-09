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
    init(n: String, dm: [Int], sn: String){
        name = n
        daysMissed = dm
        studentNotes = sn
    }
    init() {
        name = "default"
        daysMissed = [Int]()
        studentNotes = ""
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
