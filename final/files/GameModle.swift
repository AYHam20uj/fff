//
//  GameModle.swift
//  final
//
//  Created by Ayham on 2021-11-30.
//



import Foundation
struct GameModel: Decodable ,Identifiable{
    
    let id:Int
    let title:String
    let thumbnail:String
    let shortDescription:String
    let gameUrl:String
    let genre:String
    let platform:String
    let publisher:String
    let developer:String
    let releaseDate:String
    let profileUrl:String

}

/*
 [{"id":1,
 "title":"Dauntless",
 "thumbnail":"https:\/\/www.mmobomb.com\/g\/1\/thumbnail.jpg",
 "short_description":"Gather your friends, forge your weapons, and hunt ferocious behemoths in Dauntless, the co-op multiplayer RPG from Phoenix Labs, a studio consisting of developers from some of the biggest MMORPG ever made. Set adrift in a lush fantasy world known as the Shattered Isles, \"Slayers\" must band together to contend with a harsh environment and even harsher enemies Each Slayer can choose his or her weapon and attack style, from lightning-fast sword attacks to powerful axe strikes.",
 "game_url":"https:\/\/www.mmobomb.com\/open\/dauntless",
 "genre":"MMORPG",
 "platform":"PC (Windows)",
 "publisher":"Phoenix Labs",
 "developer":"Phoenix Labs, Iron Galaxy",
 "release_date":"2019-05-21",
 "profile_url":"https:\/\/www.mmobomb.com\/dauntless"}
 */
