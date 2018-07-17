//
//  Post.h
//  InstagramApp
//
//  Created by loneill on 16/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (weak, nonatomic) NSString *fullName;
@property (weak, nonatomic) NSString *profilePicture;
@property (weak, nonatomic) NSString *createdTime;
@property (weak, nonatomic) NSString *imageUrl;
@property (weak, nonatomic) NSString *captionText;
@property (weak, nonatomic) NSString *fromName;
@property (weak, nonatomic) NSString *fromPicture;

-(void) populateFromJSON: (NSMutableArray *)JSONResult;

@end
/*
{
    "data": [{
        "comments": {
            "count": 0
        },
        "caption": {
            "created_time": "1296710352",
            "text": "Inside le truc #foodtruck",
            "from": {
                "username": "kevin",
                "full_name": "Kevin Systrom",
                "type": "user",
                "id": "3"
            },
            "id": "26621408"
        },
        "likes": {
            "count": 15
        },
        "link": "http://instagr.am/p/BWrVZ/",
        "user": {
            "username": "kevin",
            "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_3_75sq_1295574122.jpg",
            "id": "3"
        },
        "created_time": "1296710327",
        "images": {
            "low_resolution": {
                "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_6.jpg",
                "width": 306,
                "height": 306
            },
            "thumbnail": {
                "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_5.jpg",
                "width": 150,
                "height": 150
            },
            "standard_resolution": {
                "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_7.jpg",
                "width": 612,
                "height": 612
            }
        },
        "type": "image",
        "users_in_photo": [],
        "filter": "Earlybird",
        "tags": ["foodtruck"],
        "id": "22721881",
        "location": {
            "latitude": 37.778720183610183,
            "longitude": -122.3962783813477,
            "id": "520640",
            "street_address": "",
            "name": "Le Truc"
        }
    },
             {
                 "videos": {
                     "low_resolution": {
                         "url": "http://distilleryvesper9-13.ak.instagram.com/090d06dad9cd11e2aa0912313817975d_102.mp4",
                         "width": 480,
                         "height": 480
                     },
                     "standard_resolution": {
                         "url": "http://distilleryvesper9-13.ak.instagram.com/090d06dad9cd11e2aa0912313817975d_101.mp4",
                         "width": 640,
                         "height": 640
                     },
                     "comments": {
                         "count": 2
                     },
                     "caption": null,
                     "likes": {
                         "count": 1
                     },
                     "link": "http://instagr.am/p/D/",
                     "created_time": "1279340983",
                     "images": {
                         "low_resolution": {
                             "url": "http://distilleryimage2.ak.instagram.com/11f75f1cd9cc11e2a0fd22000aa8039a_6.jpg",
                             "width": 306,
                             "height": 306
                         },
                         "thumbnail": {
                             "url": "http://distilleryimage2.ak.instagram.com/11f75f1cd9cc11e2a0fd22000aa8039a_5.jpg",
                             "width": 150,
                             "height": 150
                         },
                         "standard_resolution": {
                             "url": "http://distilleryimage2.ak.instagram.com/11f75f1cd9cc11e2a0fd22000aa8039a_7.jpg",
                             "width": 612,
                             "height": 612
                         }
                     },
                     "type": "video",
                     "users_in_photo": null,
                     "filter": "Vesper",
                     "tags": [],
                     "id": "363839373298",
                     "user": {
                         "username": "kevin",
                         "full_name": "Kevin S",
                         "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_3_75sq_1295574122.jpg",
                         "id": "3"
                     },
                     "location": null
                 },
                 ]
             }
             */

/*
 
 data [{1.....user{2...full_name,,,,,profile_picture....2}, images{2.....standard_resolution{3...url3}2}, created_time, caption{2...text......from{3....full_name...profile_picture...3}2}...1}, {repeat above1....user{2..............2}1}
 My posts
 {"pagination": {}, "data": [{1"id": "1825040672594135005_8145354658", "user": {2"id": "8145354658", "full_name": "Lorcan O'Neill", "profile_picture": "https://scontent.cdninstagram.com/vp/4c9989daf61b11d0b1bee0a9abe44ae2/5BDEBFFB/t51.2885-19/s150x150/35576039_244038706382277_5662860692684800000_n.jpg", "username": "lorcan.oneill.14"2}, "images": {2"thumbnail": {3"width": 150, "height": 150, "url": DW PARTY"https://scontent.cdninstagram.com/vp/963b243a9d6f12a5ce77a3bc853261df/5BDC88E6/t51.2885-15/e35/s150x150/36921062_682159128793469_273492015486861312_n.jpg"3}, "low_resolution": {3"width": 320, "height": 320, "url": DW PARTY BIGGER"https://scontent.cdninstagram.com/vp/248098e41b654eda173436001a28baad/5BEBD3EB/t51.2885-15/e35/s320x320/36921062_682159128793469_273492015486861312_n.jpg"3}, "standard_resolution": {3"width": 640, "height": 640, "url": DW PARTY BIGGEST"https://scontent.cdninstagram.com/vp/9a3cf5ee435f549b2fabbd75f2f58bca/5BCD0407/t51.2885-15/sh0.08/e35/s640x640/36921062_682159128793469_273492015486861312_n.jpg"3}2}, "created_time": "1531781823", "caption": {2"id": "17955072106071531", "text": "Another test only", "created_time": "1531781823", "from": {3"id": "8145354658", "full_name": "Lorcan O'Neill", "profile_picture": "https://scontent.cdninstagram.com/vp/4c9989daf61b11d0b1bee0a9abe44ae2/5BDEBFFB/t51.2885-19/s150x150/35576039_244038706382277_5662860692684800000_n.jpg", "username": "lorcan.oneill.14"3}2}, "user_has_liked": false, "likes": {2"count": 02}, "tags": [], "filter": "Normal", "comments": {2"count": 02}, "type": "image", "link": "https://www.instagram.com/p/BlT2NJ-nQfd/", "location": null, "attribution": null, "users_in_photo": []1}, {1"id": "1825039535627393649_8145354658", "user": {2"id": "8145354658", "full_name": "Lorcan O'Neill", "profile_picture": "https://scontent.cdninstagram.com/vp/4c9989daf61b11d0b1bee0a9abe44ae2/5BDEBFFB/t51.2885-19/s150x150/35576039_244038706382277_5662860692684800000_n.jpg", "username": "lorcan.oneill.14"2}, "images": {2"thumbnail": {3"width": 150, "height": 150, "url": EININ SMALL"https://scontent.cdninstagram.com/vp/34b1192ae30c617b999e4d158524ca8d/5BD5FA81/t51.2885-15/e35/s150x150/36645642_287881535090655_604469797408735232_n.jpg"3}, "low_resolution": {3"width": 320, "height": 320, "url": "https://scontent.cdninstagram.com/vp/2c172d8bf03f4241a78277159ba51fec/5BCD528C/t51.2885-15/e35/s320x320/36645642_287881535090655_604469797408735232_n.jpg"3}, "standard_resolution": {3"width": 640, "height": 640, "url": "https://scontent.cdninstagram.com/vp/167e4d81047792250a304382dbf5c498/5BDE0860/t51.2885-15/sh0.08/e35/s640x640/36645642_287881535090655_604469797408735232_n.jpg"3}2}, "created_time": "1531781688", "caption": {2"id": "17940561745092918", "text": "Just a test - writing an app", "created_time": "1531781688", "from": {3"id": "8145354658", "full_name": "Lorcan O'Neill", "profile_picture": "https://scontent.cdninstagram.com/vp/4c9989daf61b11d0b1bee0a9abe44ae2/5BDEBFFB/t51.2885-19/s150x150/35576039_244038706382277_5662860692684800000_n.jpg", "username": "lorcan.oneill.14"3}2}, "user_has_liked": false, "likes": {2"count": 02}, "tags": [], "filter": "Normal", "comments": {2"count": 02}, "type": "image", "link": "https://www.instagram.com/p/BlT18nGHVpx/", "location": null, "attribution": null, "users_in_photo": []1}], "meta": {1"code": 2001}}*/
