//
//  Untitled.swift
//  MyFavoritesTableView
//
//  Created by Zhasmin Suleimenova on 10.11.2025.
//

import Foundation

struct FavoriteItem {
    let title: String
    let subtitle: String
    let review: String
    let imageName: String
}

struct FavoritesData {
    static let movies = [
        FavoriteItem(title: "Финч", subtitle: "Год: 2021", review: "Голод превратил людей в убийц, а меня превратил в труса...", imageName: "movie1"),
        FavoriteItem(title: "Зелёная книга", subtitle: "Год: 2018", review: "То есть я недостаточно черный, и недостачно белый. Скажи, Тони кто я такой?", imageName: "movie2"),
        FavoriteItem(title: "Интерстеллар", subtitle: "Год: 2014", review: "Наш источник вдохновения, причём величайший – инстинкт выживания.", imageName: "movie3"),
        FavoriteItem(title: "1+1", subtitle: "Год: 2011", review: "Не жди, что станет легче, проще, лучше. Не станет. Трудности будут всегда. Учись быть счастливым прямо сейчас. Иначе не успееш", imageName: "movie4"),
        FavoriteItem(title: "Мой ужасный сосед", subtitle: "Год: 2022", review: "Я был идиотом. Я так увлёкся своими собственными проблемами, что перестал думать о других.", imageName: "movie5"),
    ]
    
    static let music = [
        FavoriteItem(title: "Pink Floyd", subtitle: "Us and Them", review: "Песня очень проста и о войне. «Мы и они» относится к сторонам войны. «Бог знает, что это не то, что мы бы выбрали» — он говорит о том, что знает, что обе стороны на самом деле не хотят участвовать в войне.", imageName: "music1"),
        FavoriteItem(title: "The Beatles", subtitle: "Help!", review: "Группа The Beatles записала Help! в течение одного вечера, 13 апреля 1965 года. На это у них ушло всего четыре часа. Песня была издана синглом из альбома Help!", imageName: "music2"),
        FavoriteItem(title: "David Bowie", subtitle: "Starman", review: "Песня была включена в альбом The Rise and Fall of Ziggy Stardust and the Spiders from Mars перед его выпуском. Песню записали в самом конце работы над альбомом, чтобы на нём всё же была песня, которую можно выпустить синглом.", imageName: "music3"),
        FavoriteItem(title: "Queen", subtitle: "Bohemian Rhapsody", review: "На запись песни ушло три недели, а в 75-м за это время многие писали альбом. Всё потому, что были записаны, буквально, сотни дорожек, особенно в оперной части, тогда как в среднем группы писали... четыре.", imageName: "music4"),
        FavoriteItem(title: "The Turtles", subtitle: "Happy Together", review: " «Happy Together» — это рассказ о мужчине, который мечтает о счастье со своей возлюбленной, даже если реальность далека от его представлений. Он представляет, как им было бы хорошо вместе, хотя и осознает, что это может никогда не произойти.", imageName: "music5"),
    ]
    
    static let books = [
        FavoriteItem(title: "1984", subtitle: "Джордж Оруэлл", review: "Свобода — это возможность сказать, что дважды два — четыре", imageName: "book1"),
        FavoriteItem(title: "Джен Эйр", subtitle: "Шарлотта Бронте", review: "Не было еще на свете такой дуры, как Джен Эйр, и ни одна идиотка не предавалась столь сладостному самообману, глотая яд, словно восхитительный нектар.", imageName: "book2"),
        FavoriteItem(title: "Мартин Иден", subtitle: "Джек Лондон", review: "Они изучали жизнь по книгам, в то время как он был занят тем, что жил.", imageName: "book3"),
        FavoriteItem(title: "Грозовой перевал", subtitle: "Эмили Бронте", review: "Оставшееся после умерших ценно для нас, если они были дороги при жизни.", imageName: "book4"),
        FavoriteItem(title: "Мемуары Гейши", subtitle: "Артур Голден", review: "Иногда мы сталкиваемся с неприятностями только потому, что представляем мир таким, каким рисуем его в нашем воображении, а не таким, какой он есть на самом деле.", imageName: "book5"),
    ]
    
    static let courses = [
        FavoriteItem(title: "GoLand", subtitle: "2 семестр", review: "Было интересно все писать и разрабатывать вручную. Но все так просто!", imageName: "course1"),
        FavoriteItem(title: "Web Development", subtitle: "2 семестр", review: "Мой первый практический курс по созданию веб-приложений. Я начала создавать первые свои сайты.", imageName: "course2"),
        FavoriteItem(title: "PHP Laravel", subtitle: "3 семестр", review: "Увлекательное введение в php. Много узнала о архитектуре MVC и разработке RESTful API", imageName: "course3"),
        FavoriteItem(title: "iOS Development", subtitle: "4 семестр", review: "Отличный курс по iOS разработке на Swift. Уже могу разрабатывать мини приложения и игры.", imageName: "course4"),
        FavoriteItem(title: "Android Development", subtitle: "4 семестр", review: "Интересный курс по разработке приложени для Android. Выучили Java и Kotlin", imageName: "course5"),
    ]
}
