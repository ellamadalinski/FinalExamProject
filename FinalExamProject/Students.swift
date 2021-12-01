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
    init(n: String){
        name = n
    }
    //you ever just jump off a cliff fosho?
    //yeah fosho
}

public class Class {
    var className: String
    var studentsArray: [Students]
    
    init(c: String, sa: [Students]) {
        className = c
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
