//
//  Model.swift
//  Navigation
//
//  Created by Николай Гринько on 26.02.2023.
//

import Foundation

struct ModelStarList: IProfileSectionModel {
    var list: [Modelstar]
}

struct Modelstar {
    
    let author: String
    let image: String
    var likes: Int
    var views: Int
    let description: String
    var isLiked: Bool
    var eyeViews: Bool
    var photos: [String] = []
    
    static func starArray() -> [Modelstar] {
        
        var model = [Modelstar]()
        
        model.append(Modelstar(author: "https://ru.wikipedia.org/1", image: "Острые козырьки", likes: 1209, views: 2346, description: "Oстрые козырьки» (англ. Peaky Blinders) — британский криминальный драматический сериал, созданный Стивеном Найтом в 2013 году для телеканала BBC Two и повествующий о деятельности преступного клана Шелби в Бирмингеме в 1920-е годы.", isLiked: false, eyeViews: true))
        
        model.append(Modelstar(author: "https://ru.wikipedia.org/2", image: "Томас шелби", likes: 3459, views: 2379, description: "Томас шелби (англ. Cillian Murphy, род. 25 мая 1976) — ирландский актёр театра, кино и телевидения, музыкант. Часто отмечается критиками за «хамелеонские» роли, выразительные голубые глаза и скулы.", isLiked: false, eyeViews: true))
        
        model.append(Modelstar(author: "https://ru.wikipedia.org/3", image: "Том Харди", likes: 2389, views: 9831, description: "Э́двард То́мас «Том» Ха́рди (англ. Edward Thomas Hardy; род. 15 сентября 1977, Хаммерсмит, Лондон, Великобритания) — английский актёр, продюсер и сценарист. Обладатель премии BAFTA и номинант на премию «Оскар». Прославился благодаря фильму «Стюарт: Прошлая жизнь»,где он сыграл роль наркомана и бездомного Стюарта Шортера, принёсшую ему номинацию на премию BAFTA", isLiked: false, eyeViews: true))
        
        model.append(Modelstar(author: "https://ru.wikipedia.org/4", image: "Артур Шелби", likes: 2349, views: 9803, description: "Артур Шелби (англ. Paul Anderson; род. 12 февраля 1978, Лондон) — английский актёр. Наиболее известен по ролям в фильмах «Выживший», «Легенда», «Шерлок Холмс: Игра теней» и сериалу «Острые козырьки».", isLiked: false, eyeViews: true))
        
        model.append(Modelstar(author: "https://ru.wikipedia.org/5", image: "Аберама Голд", likes: 3461, views: 7892, description: "Аберама Голд (англ. Aidan Gillen, при рождении Эйдан Мёрфи, англ. Aidan Murphy, род. 24 апреля 1968, Дублин) — ирландский актёр телевидения, театра и кино. Наиболее известен ролью Петира Бейлиша в сериале «Игра Престолов».", isLiked: false, eyeViews: true))
        
        model.append(Modelstar(author: "https://ru.wikipedia.org/6", image: "Полли Грей", likes: 2341, views: 4590, description: "Полли Грей (англ. Helen Elizabeth McCrory, в замужестве Льюис, англ. Lewis; 17 августа 1968, Лондон, Великобритания — 16 апреля 2021, там же) — британская актриса театра и кино, известная прежде всего благодаря ведущим ролям в телевизионных фильмах и постановках английских театров. ", isLiked: false, eyeViews: true))
        
        return model
    }
}
