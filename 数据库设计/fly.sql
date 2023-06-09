/*
 Navicat Premium Data Transfer

 Source Server         : MongoDB
 Source Server Type    : MongoDB
 Source Server Version : 50014
 Source Host           : localhost:27017
 Source Schema         : fly

 Target Server Type    : MongoDB
 Target Server Version : 50014
 File Encoding         : 65001

 Date: 07/04/2023 00:10:21
*/


// ----------------------------
// Collection structure for area
// ----------------------------
db.getCollection("area").drop();
db.createCollection("area");

// ----------------------------
// Documents of area
// ----------------------------
db.getCollection("area").insert([ {
    _id: ObjectId("642e6c6a057ed84dd51d769a"),
    areaName: "test1禁飞区",
    geoJsonPolygon: {
        type: "Polygon",
        coordinates: [
            [
                [
                    111.670731,
                    29.049319
                ],
                [
                    111.670747,
                    29.048998
                ],
                [
                    111.671166,
                    29.048985
                ],
                [
                    111.671189,
                    29.049345
                ],
                [
                    111.670731,
                    29.049319
                ]
            ]
        ]
    },
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-04-06T06:53:30.455Z"),
    _class: "com.zzk.system.domain.fly.Area"
} ]);
db.getCollection("area").insert([ {
    _id: ObjectId("642e6c84057ed84dd51d769b"),
    areaName: "test2禁飞区",
    geoJsonPolygon: {
        type: "Polygon",
        coordinates: [
            [
                [
                    111.672155,
                    29.047247
                ],
                [
                    111.672147,
                    29.046971
                ],
                [
                    111.672702,
                    29.046981
                ],
                [
                    111.672671,
                    29.047275
                ],
                [
                    111.672155,
                    29.047247
                ]
            ]
        ]
    },
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-04-06T06:53:56.288Z"),
    _class: "com.zzk.system.domain.fly.Area"
} ]);
db.getCollection("area").insert([ {
    _id: ObjectId("642e6c9c057ed84dd51d769c"),
    areaName: "test3禁飞区",
    geoJsonPolygon: {
        type: "Polygon",
        coordinates: [
            [
                [
                    111.673366,
                    29.048928
                ],
                [
                    111.673358,
                    29.048655
                ],
                [
                    111.673646,
                    29.048679
                ],
                [
                    111.673642,
                    29.048914
                ],
                [
                    111.673366,
                    29.048928
                ]
            ]
        ]
    },
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-04-06T06:54:20.652Z"),
    _class: "com.zzk.system.domain.fly.Area"
} ]);

// ----------------------------
// Collection structure for drone
// ----------------------------
db.getCollection("drone").drop();
db.createCollection("drone");

// ----------------------------
// Documents of drone
// ----------------------------
db.getCollection("drone").insert([ {
    _id: ObjectId("64148971538ba54e4ee0c487"),
    droneId: "800802170200100",
    droneName: "dj无人机",
    model: "djwrj-1",
    cardId: "145811",
    userId: "1",
    username: "admin",
    signal: "4",
    createdAt: ISODate("2023-03-17T15:38:25.363Z"),
    updatedAt: ISODate("2023-04-06T15:04:55.954Z"),
    _class: "com.zzk.system.domain.fly.Drone",
    status: "0",
    currentBatteryLevel: "64.0",
    location: {
        dateTime: ISODate("2023-04-06T15:04:55.000Z"),
        lat: "29.047876683572333",
        lng: "111.6733216469706",
        speed: "79",
        altitude: "93",
        direction: "110"
    }
} ]);
db.getCollection("drone").insert([ {
    _id: ObjectId("6423d499e3c3c804c8cc6c5a"),
    droneId: "800802170200101",
    droneName: "2号无人机",
    model: "22-22",
    cardId: "145812",
    userId: "1",
    username: "admin",
    currentBatteryLevel: "64.0",
    location: {
        dateTime: ISODate("2023-04-05T12:48:09.000Z"),
        lat: "29.047196904810882",
        lng: "111.67167671984139",
        speed: "97",
        altitude: "45",
        direction: "57"
    },
    status: "0",
    signal: "4",
    createdAt: ISODate("2023-03-29T06:03:05.256Z"),
    updatedAt: ISODate("2023-04-05T12:48:09.418Z"),
    _class: "com.zzk.system.domain.fly.Drone"
} ]);

// ----------------------------
// Collection structure for historyPath
// ----------------------------
db.getCollection("historyPath").drop();
db.createCollection("historyPath");

// ----------------------------
// Documents of historyPath
// ----------------------------
db.getCollection("historyPath").insert([ {
    _id: ObjectId("6422a51177a60572979f0f32"),
    droneObjectId: ObjectId("64148971538ba54e4ee0c487"),
    droneId: "64148971538ba54e4ee0c487",
    droneName: "dj无人机",
    cardId: "145811",
    pathName: "test第一条路径",
    startPoint: {
        dateTime: ISODate("2023-03-28T08:27:30.000Z"),
        lat: "29.05150666666667",
        lng: "111.66555666666666",
        speed: "70",
        altitude: "85",
        direction: "72"
    },
    endPoint: {
        dateTime: ISODate("2023-03-28T08:27:40.000Z"),
        lat: "29.056823333333334",
        lng: "111.66193166666666",
        speed: "96",
        altitude: "78",
        direction: "94"
    },
    path: [
        {
            dateTime: ISODate("2023-03-28T08:27:30.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "70",
            altitude: "85",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:35.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "47",
            altitude: "72",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:35.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "47",
            altitude: "72",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:35.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "47",
            altitude: "72",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:35.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "47",
            altitude: "72",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:35.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "47",
            altitude: "72",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:40.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "96",
            altitude: "78",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:40.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "96",
            altitude: "78",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-28T08:27:40.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "96",
            altitude: "78",
            direction: "94"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-03-28T08:28:01.084Z"),
    _class: "com.zzk.system.domain.fly.HistoryPath"
} ]);
db.getCollection("historyPath").insert([ {
    _id: ObjectId("6423d4e2e3c3c804c8cc6c5b"),
    droneObjectId: ObjectId("6423d499e3c3c804c8cc6c5a"),
    droneId: "6423d499e3c3c804c8cc6c5a",
    droneName: "2号无人机",
    cardId: "145812",
    pathName: "test2号",
    startPoint: {
        dateTime: ISODate("2023-03-29T06:03:40.000Z"),
        lat: "29.05234",
        lng: "111.66474333333333",
        speed: "58",
        altitude: "84",
        direction: "71"
    },
    endPoint: {
        dateTime: ISODate("2023-03-29T06:04:05.000Z"),
        lat: "29.050588333333334",
        lng: "111.665705",
        speed: "54",
        altitude: "61",
        direction: "76"
    },
    path: [
        {
            dateTime: ISODate("2023-03-29T06:03:40.000Z"),
            lat: "29.05234",
            lng: "111.66474333333333",
            speed: "58",
            altitude: "84",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:40.000Z"),
            lat: "29.05234",
            lng: "111.66474333333333",
            speed: "58",
            altitude: "84",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:40.000Z"),
            lat: "29.05234",
            lng: "111.66474333333333",
            speed: "58",
            altitude: "84",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:45.000Z"),
            lat: "29.052338333333335",
            lng: "111.66474333333333",
            speed: "91",
            altitude: "42",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:45.000Z"),
            lat: "29.052338333333335",
            lng: "111.66474333333333",
            speed: "91",
            altitude: "42",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:45.000Z"),
            lat: "29.052338333333335",
            lng: "111.66474333333333",
            speed: "91",
            altitude: "42",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:45.000Z"),
            lat: "29.052338333333335",
            lng: "111.66474333333333",
            speed: "91",
            altitude: "42",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:45.000Z"),
            lat: "29.052338333333335",
            lng: "111.66474333333333",
            speed: "91",
            altitude: "42",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:45.000Z"),
            lat: "29.052338333333335",
            lng: "111.66474333333333",
            speed: "91",
            altitude: "42",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:45.000Z"),
            lat: "29.052338333333335",
            lng: "111.66474333333333",
            speed: "91",
            altitude: "42",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:50.000Z"),
            lat: "29.05235",
            lng: "111.66530833333333",
            speed: "58",
            altitude: "63",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:50.000Z"),
            lat: "29.05235",
            lng: "111.66530833333333",
            speed: "58",
            altitude: "63",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:50.000Z"),
            lat: "29.05235",
            lng: "111.66530833333333",
            speed: "58",
            altitude: "63",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:50.000Z"),
            lat: "29.05235",
            lng: "111.66530833333333",
            speed: "58",
            altitude: "63",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:50.000Z"),
            lat: "29.05235",
            lng: "111.66530833333333",
            speed: "58",
            altitude: "63",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:55.000Z"),
            lat: "29.052086666666668",
            lng: "111.66558333333333",
            speed: "97",
            altitude: "70",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:55.000Z"),
            lat: "29.052086666666668",
            lng: "111.66558333333333",
            speed: "97",
            altitude: "70",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:55.000Z"),
            lat: "29.052086666666668",
            lng: "111.66558333333333",
            speed: "97",
            altitude: "70",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:55.000Z"),
            lat: "29.052086666666668",
            lng: "111.66558333333333",
            speed: "97",
            altitude: "70",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:03:55.000Z"),
            lat: "29.052086666666668",
            lng: "111.66558333333333",
            speed: "97",
            altitude: "70",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:04:00.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "53",
            altitude: "58",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-29T06:04:00.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "53",
            altitude: "58",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-29T06:04:00.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "53",
            altitude: "58",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-29T06:04:00.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "53",
            altitude: "58",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-29T06:04:00.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "53",
            altitude: "58",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-29T06:04:05.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "54",
            altitude: "61",
            direction: "76"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-03-29T06:04:18.989Z"),
    _class: "com.zzk.system.domain.fly.HistoryPath"
} ]);
db.getCollection("historyPath").insert([ {
    _id: ObjectId("6423dff6e3c3c804c8cc6c5c"),
    droneObjectId: ObjectId("6423d499e3c3c804c8cc6c5a"),
    droneId: "6423d499e3c3c804c8cc6c5a",
    droneName: "2号无人机",
    cardId: "145812",
    pathName: "65656",
    startPoint: {
        dateTime: ISODate("2023-03-29T06:50:45.000Z"),
        lat: "29.052086666666668",
        lng: "111.66558333333333",
        speed: "71",
        altitude: "43",
        direction: "54"
    },
    endPoint: {
        dateTime: ISODate("2023-03-29T06:51:25.000Z"),
        lat: "29.056946666666665",
        lng: "111.65585",
        speed: "66",
        altitude: "71",
        direction: "89"
    },
    path: [
        {
            dateTime: ISODate("2023-03-29T06:50:45.000Z"),
            lat: "29.052086666666668",
            lng: "111.66558333333333",
            speed: "71",
            altitude: "43",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:45.000Z"),
            lat: "29.052086666666668",
            lng: "111.66558333333333",
            speed: "71",
            altitude: "43",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:50.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "82",
            altitude: "104",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:50.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "82",
            altitude: "104",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:50.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "82",
            altitude: "104",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:50.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "82",
            altitude: "104",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:50.000Z"),
            lat: "29.05150666666667",
            lng: "111.66555666666666",
            speed: "82",
            altitude: "104",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:55.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "97",
            altitude: "49",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:55.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "97",
            altitude: "49",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:55.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "97",
            altitude: "49",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:55.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "97",
            altitude: "49",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:50:55.000Z"),
            lat: "29.050588333333334",
            lng: "111.665705",
            speed: "97",
            altitude: "49",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:00.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "89",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:00.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "89",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:00.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "89",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:00.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "89",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:00.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "89",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:00.000Z"),
            lat: "29.056823333333334",
            lng: "111.66193166666666",
            speed: "89",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:05.000Z"),
            lat: "29.056961666666666",
            lng: "111.66096",
            speed: "73",
            altitude: "72",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:05.000Z"),
            lat: "29.056961666666666",
            lng: "111.66096",
            speed: "73",
            altitude: "72",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:05.000Z"),
            lat: "29.056961666666666",
            lng: "111.66096",
            speed: "73",
            altitude: "72",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:05.000Z"),
            lat: "29.056961666666666",
            lng: "111.66096",
            speed: "73",
            altitude: "72",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:10.000Z"),
            lat: "29.05696",
            lng: "111.65929833333334",
            speed: "79",
            altitude: "103",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:10.000Z"),
            lat: "29.05696",
            lng: "111.65929833333334",
            speed: "79",
            altitude: "103",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:10.000Z"),
            lat: "29.05696",
            lng: "111.65929833333334",
            speed: "79",
            altitude: "103",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:10.000Z"),
            lat: "29.05696",
            lng: "111.65929833333334",
            speed: "79",
            altitude: "103",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:10.000Z"),
            lat: "29.05696",
            lng: "111.65929833333334",
            speed: "79",
            altitude: "103",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:15.000Z"),
            lat: "29.056951666666667",
            lng: "111.65708833333333",
            speed: "79",
            altitude: "69",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:15.000Z"),
            lat: "29.056951666666667",
            lng: "111.65708833333333",
            speed: "79",
            altitude: "69",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:15.000Z"),
            lat: "29.056951666666667",
            lng: "111.65708833333333",
            speed: "79",
            altitude: "69",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:15.000Z"),
            lat: "29.056951666666667",
            lng: "111.65708833333333",
            speed: "79",
            altitude: "69",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:15.000Z"),
            lat: "29.056951666666667",
            lng: "111.65708833333333",
            speed: "79",
            altitude: "69",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:20.000Z"),
            lat: "29.056948333333334",
            lng: "111.655875",
            speed: "90",
            altitude: "50",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:20.000Z"),
            lat: "29.056948333333334",
            lng: "111.655875",
            speed: "90",
            altitude: "50",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:20.000Z"),
            lat: "29.056948333333334",
            lng: "111.655875",
            speed: "90",
            altitude: "50",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:20.000Z"),
            lat: "29.056948333333334",
            lng: "111.655875",
            speed: "90",
            altitude: "50",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:20.000Z"),
            lat: "29.056948333333334",
            lng: "111.655875",
            speed: "90",
            altitude: "50",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:25.000Z"),
            lat: "29.056946666666665",
            lng: "111.65585",
            speed: "66",
            altitude: "71",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:25.000Z"),
            lat: "29.056946666666665",
            lng: "111.65585",
            speed: "66",
            altitude: "71",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-29T06:51:25.000Z"),
            lat: "29.056946666666665",
            lng: "111.65585",
            speed: "66",
            altitude: "71",
            direction: "89"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-03-29T06:51:34.09Z"),
    _class: "com.zzk.system.domain.fly.HistoryPath"
} ]);
db.getCollection("historyPath").insert([ {
    _id: ObjectId("6425ad9d7f60b803cf095e89"),
    droneObjectId: ObjectId("64148971538ba54e4ee0c487"),
    droneId: "64148971538ba54e4ee0c487",
    droneName: "dj无人机",
    cardId: "145811",
    pathName: "上传上传",
    startPoint: {
        dateTime: ISODate("2023-03-30T15:40:37.000Z"),
        lat: "28.951769",
        lng: "111.648698",
        speed: "73",
        altitude: "60",
        direction: "79"
    },
    endPoint: {
        dateTime: ISODate("2023-03-30T15:40:57.000Z"),
        lat: "28.961059",
        lng: "111.656443",
        speed: "87",
        altitude: "82",
        direction: "83"
    },
    path: [
        {
            dateTime: ISODate("2023-03-30T15:40:37.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "73",
            altitude: "60",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:37.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "73",
            altitude: "60",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:37.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "73",
            altitude: "60",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:42.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "100",
            altitude: "98",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:42.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "100",
            altitude: "98",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:42.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "100",
            altitude: "98",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:42.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "100",
            altitude: "98",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:47.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "67",
            altitude: "78",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:47.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "67",
            altitude: "78",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:47.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "67",
            altitude: "78",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:47.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "67",
            altitude: "78",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:47.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "67",
            altitude: "78",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:47.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "67",
            altitude: "78",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:52.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "68",
            altitude: "70",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:52.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "68",
            altitude: "70",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:52.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "68",
            altitude: "70",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:52.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "68",
            altitude: "70",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:52.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "68",
            altitude: "70",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:57.000Z"),
            lat: "28.961059",
            lng: "111.656443",
            speed: "87",
            altitude: "82",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-30T15:40:57.000Z"),
            lat: "28.961059",
            lng: "111.656443",
            speed: "87",
            altitude: "82",
            direction: "83"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-03-30T15:41:17.207Z"),
    _class: "com.zzk.system.domain.fly.HistoryPath"
} ]);
db.getCollection("historyPath").insert([ {
    _id: ObjectId("6425af047f60b803cf095e8a"),
    droneObjectId: ObjectId("64148971538ba54e4ee0c487"),
    droneId: "64148971538ba54e4ee0c487",
    droneName: "dj无人机",
    cardId: "145811",
    pathName: "测试回放",
    startPoint: {
        dateTime: ISODate("2023-03-30T15:45:44.000Z"),
        lat: "29.049272",
        lng: "111.670284",
        speed: "69",
        altitude: "83",
        direction: "63"
    },
    endPoint: {
        dateTime: ISODate("2023-03-30T15:47:04.000Z"),
        lat: "29.05364",
        lng: "111.659211",
        speed: "42",
        altitude: "56",
        direction: "103"
    },
    path: [
        {
            dateTime: ISODate("2023-03-30T15:45:44.000Z"),
            lat: "29.049272",
            lng: "111.670284",
            speed: "69",
            altitude: "83",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:44.000Z"),
            lat: "29.049272",
            lng: "111.670284",
            speed: "69",
            altitude: "83",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:49.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "62",
            altitude: "42",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:49.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "62",
            altitude: "42",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:49.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "62",
            altitude: "42",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:49.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "62",
            altitude: "42",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:54.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "86",
            altitude: "45",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:54.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "86",
            altitude: "45",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:54.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "86",
            altitude: "45",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:54.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "86",
            altitude: "45",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:54.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "86",
            altitude: "45",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:54.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "86",
            altitude: "45",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:59.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "60",
            altitude: "54",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:59.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "60",
            altitude: "54",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:59.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "60",
            altitude: "54",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-30T15:45:59.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "60",
            altitude: "54",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:04.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "67",
            altitude: "45",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:04.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "67",
            altitude: "45",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:04.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "67",
            altitude: "45",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:04.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "67",
            altitude: "45",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:04.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "67",
            altitude: "45",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:04.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "67",
            altitude: "45",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:09.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "80",
            altitude: "90",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:09.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "80",
            altitude: "90",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:09.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "80",
            altitude: "90",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:09.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "80",
            altitude: "90",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:14.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "98",
            altitude: "104",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:14.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "98",
            altitude: "104",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:14.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "98",
            altitude: "104",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:14.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "98",
            altitude: "104",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:14.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "98",
            altitude: "104",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:14.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "98",
            altitude: "104",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:19.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "57",
            altitude: "63",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:19.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "57",
            altitude: "63",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:19.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "57",
            altitude: "63",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:19.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "57",
            altitude: "63",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:24.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "51",
            altitude: "106",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:24.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "51",
            altitude: "106",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:24.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "51",
            altitude: "106",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:24.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "51",
            altitude: "106",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:24.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "51",
            altitude: "106",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:24.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "51",
            altitude: "106",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:29.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "77",
            altitude: "87",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:29.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "77",
            altitude: "87",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:29.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "77",
            altitude: "87",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:29.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "77",
            altitude: "87",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:34.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "44",
            altitude: "75",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:34.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "44",
            altitude: "75",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:34.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "44",
            altitude: "75",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:34.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "44",
            altitude: "75",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:34.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "44",
            altitude: "75",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:34.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "44",
            altitude: "75",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:39.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "50",
            altitude: "83",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:39.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "50",
            altitude: "83",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:39.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "50",
            altitude: "83",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:39.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "50",
            altitude: "83",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:39.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "50",
            altitude: "83",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:44.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "43",
            altitude: "42",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:44.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "43",
            altitude: "42",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:44.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "43",
            altitude: "42",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:44.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "43",
            altitude: "42",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:44.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "43",
            altitude: "42",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:49.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "54",
            altitude: "69",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:49.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "54",
            altitude: "69",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:49.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "54",
            altitude: "69",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:49.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "54",
            altitude: "69",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:49.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "54",
            altitude: "69",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:54.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "75",
            altitude: "42",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:54.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "75",
            altitude: "42",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:54.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "75",
            altitude: "42",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:54.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "75",
            altitude: "42",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:54.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "75",
            altitude: "42",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:59.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "86",
            altitude: "43",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:59.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "86",
            altitude: "43",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:59.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "86",
            altitude: "43",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:59.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "86",
            altitude: "43",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-03-30T15:46:59.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "86",
            altitude: "43",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-03-30T15:47:04.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "42",
            altitude: "56",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-30T15:47:04.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "42",
            altitude: "56",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-30T15:47:04.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "42",
            altitude: "56",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-30T15:47:04.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "42",
            altitude: "56",
            direction: "103"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-03-30T15:47:16.487Z"),
    _class: "com.zzk.system.domain.fly.HistoryPath"
} ]);
db.getCollection("historyPath").insert([ {
    _id: ObjectId("64265fe47f60b803cf095e8b"),
    droneObjectId: ObjectId("64148971538ba54e4ee0c487"),
    droneId: "64148971538ba54e4ee0c487",
    droneName: "dj无人机",
    cardId: "145811",
    pathName: "完整轨迹",
    startPoint: {
        dateTime: ISODate("2023-03-31T04:12:57.000Z"),
        lat: "29.049272",
        lng: "111.670284",
        speed: "77",
        altitude: "104",
        direction: "60"
    },
    endPoint: {
        dateTime: ISODate("2023-03-31T04:21:43.000Z"),
        lat: "29.05357",
        lng: "111.660471",
        speed: "61",
        altitude: "100",
        direction: "40"
    },
    path: [
        {
            dateTime: ISODate("2023-03-31T04:12:57.000Z"),
            lat: "29.049272",
            lng: "111.670284",
            speed: "77",
            altitude: "104",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:12:57.000Z"),
            lat: "29.049272",
            lng: "111.670284",
            speed: "77",
            altitude: "104",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:12:57.000Z"),
            lat: "29.049272",
            lng: "111.670284",
            speed: "77",
            altitude: "104",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:12:57.000Z"),
            lat: "29.049272",
            lng: "111.670284",
            speed: "77",
            altitude: "104",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:02.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "85",
            altitude: "95",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:02.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "85",
            altitude: "95",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:02.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "85",
            altitude: "95",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:02.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "85",
            altitude: "95",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:02.000Z"),
            lat: "29.04927",
            lng: "111.67028",
            speed: "85",
            altitude: "95",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:07.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "91",
            altitude: "75",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:07.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "91",
            altitude: "75",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:07.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "91",
            altitude: "75",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:07.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "91",
            altitude: "75",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:07.000Z"),
            lat: "29.049268",
            lng: "111.67028",
            speed: "91",
            altitude: "75",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:12.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "73",
            altitude: "77",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:12.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "73",
            altitude: "77",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:12.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "73",
            altitude: "77",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:12.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "73",
            altitude: "77",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:12.000Z"),
            lat: "29.049281",
            lng: "111.670847",
            speed: "73",
            altitude: "77",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:17.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "84",
            altitude: "79",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:17.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "84",
            altitude: "79",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:17.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "84",
            altitude: "79",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:17.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "84",
            altitude: "79",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:17.000Z"),
            lat: "29.049018",
            lng: "111.671122",
            speed: "84",
            altitude: "79",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:22.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "85",
            altitude: "70",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:22.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "85",
            altitude: "70",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:22.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "85",
            altitude: "70",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:22.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "85",
            altitude: "70",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:22.000Z"),
            lat: "29.048438",
            lng: "111.671096",
            speed: "85",
            altitude: "70",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:27.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "76",
            altitude: "110",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:27.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "76",
            altitude: "110",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:27.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "76",
            altitude: "110",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:27.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "76",
            altitude: "110",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:27.000Z"),
            lat: "29.047518",
            lng: "111.671244",
            speed: "76",
            altitude: "110",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:32.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "82",
            altitude: "65",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:32.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "82",
            altitude: "65",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:32.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "82",
            altitude: "65",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:32.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "82",
            altitude: "65",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:32.000Z"),
            lat: "29.053751",
            lng: "111.667463",
            speed: "82",
            altitude: "65",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:37.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "50",
            altitude: "43",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:37.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "50",
            altitude: "43",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:37.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "50",
            altitude: "43",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:37.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "50",
            altitude: "43",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:37.000Z"),
            lat: "29.053889",
            lng: "111.666489",
            speed: "50",
            altitude: "43",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:42.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "74",
            altitude: "78",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:42.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "74",
            altitude: "78",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:42.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "74",
            altitude: "78",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:42.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "74",
            altitude: "78",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:42.000Z"),
            lat: "29.053883",
            lng: "111.664823",
            speed: "74",
            altitude: "78",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:47.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "78",
            altitude: "99",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:47.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "78",
            altitude: "99",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:47.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "78",
            altitude: "99",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:47.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "78",
            altitude: "99",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:47.000Z"),
            lat: "29.053871",
            lng: "111.662609",
            speed: "78",
            altitude: "99",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:52.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "84",
            altitude: "110",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:52.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "84",
            altitude: "110",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:52.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "84",
            altitude: "110",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:52.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "84",
            altitude: "110",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:52.000Z"),
            lat: "29.053865",
            lng: "111.661393",
            speed: "84",
            altitude: "110",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:57.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "65",
            altitude: "83",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:57.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "65",
            altitude: "83",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:57.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "65",
            altitude: "83",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:57.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "65",
            altitude: "83",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:13:57.000Z"),
            lat: "29.053864",
            lng: "111.661368",
            speed: "65",
            altitude: "83",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:02.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "60",
            altitude: "98",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:02.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "60",
            altitude: "98",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:02.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "60",
            altitude: "98",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:02.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "60",
            altitude: "98",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:02.000Z"),
            lat: "29.053865",
            lng: "111.66137",
            speed: "60",
            altitude: "98",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:07.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "44",
            altitude: "40",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:07.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "44",
            altitude: "40",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:07.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "44",
            altitude: "40",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:07.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "44",
            altitude: "40",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:07.000Z"),
            lat: "29.053867",
            lng: "111.66137",
            speed: "44",
            altitude: "40",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:12.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "90",
            altitude: "95",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:12.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "90",
            altitude: "95",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:12.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "90",
            altitude: "95",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:12.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "90",
            altitude: "95",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:12.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "90",
            altitude: "95",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:12.000Z"),
            lat: "29.053864",
            lng: "111.660879",
            speed: "90",
            altitude: "95",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:17.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "45",
            altitude: "94",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:17.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "45",
            altitude: "94",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:17.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "45",
            altitude: "94",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:17.000Z"),
            lat: "29.05364",
            lng: "111.659211",
            speed: "45",
            altitude: "94",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:22.000Z"),
            lat: "29.053445",
            lng: "111.657562",
            speed: "54",
            altitude: "90",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:22.000Z"),
            lat: "29.053445",
            lng: "111.657562",
            speed: "54",
            altitude: "90",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:22.000Z"),
            lat: "29.053445",
            lng: "111.657562",
            speed: "54",
            altitude: "90",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:22.000Z"),
            lat: "29.053445",
            lng: "111.657562",
            speed: "54",
            altitude: "90",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:22.000Z"),
            lat: "29.053445",
            lng: "111.657562",
            speed: "54",
            altitude: "90",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:22.000Z"),
            lat: "29.053445",
            lng: "111.657562",
            speed: "54",
            altitude: "90",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:27.000Z"),
            lat: "29.053188",
            lng: "111.655758",
            speed: "71",
            altitude: "58",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:27.000Z"),
            lat: "29.053188",
            lng: "111.655758",
            speed: "71",
            altitude: "58",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:27.000Z"),
            lat: "29.053188",
            lng: "111.655758",
            speed: "71",
            altitude: "58",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:27.000Z"),
            lat: "29.053188",
            lng: "111.655758",
            speed: "71",
            altitude: "58",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:32.000Z"),
            lat: "29.052875",
            lng: "111.653388",
            speed: "50",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:32.000Z"),
            lat: "29.052875",
            lng: "111.653388",
            speed: "50",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:32.000Z"),
            lat: "29.052875",
            lng: "111.653388",
            speed: "50",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:32.000Z"),
            lat: "29.052875",
            lng: "111.653388",
            speed: "50",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:32.000Z"),
            lat: "29.052875",
            lng: "111.653388",
            speed: "50",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:32.000Z"),
            lat: "29.052875",
            lng: "111.653388",
            speed: "50",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:37.000Z"),
            lat: "29.052606",
            lng: "111.651301",
            speed: "59",
            altitude: "107",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:37.000Z"),
            lat: "29.052606",
            lng: "111.651301",
            speed: "59",
            altitude: "107",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:37.000Z"),
            lat: "29.052606",
            lng: "111.651301",
            speed: "59",
            altitude: "107",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:37.000Z"),
            lat: "29.052606",
            lng: "111.651301",
            speed: "59",
            altitude: "107",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:42.000Z"),
            lat: "29.052477",
            lng: "111.650069",
            speed: "40",
            altitude: "106",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:42.000Z"),
            lat: "29.052477",
            lng: "111.650069",
            speed: "40",
            altitude: "106",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:42.000Z"),
            lat: "29.052477",
            lng: "111.650069",
            speed: "40",
            altitude: "106",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:42.000Z"),
            lat: "29.052477",
            lng: "111.650069",
            speed: "40",
            altitude: "106",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:42.000Z"),
            lat: "29.052477",
            lng: "111.650069",
            speed: "40",
            altitude: "106",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:42.000Z"),
            lat: "29.052477",
            lng: "111.650069",
            speed: "40",
            altitude: "106",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:47.000Z"),
            lat: "29.05248",
            lng: "111.650069",
            speed: "64",
            altitude: "79",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:47.000Z"),
            lat: "29.05248",
            lng: "111.650069",
            speed: "64",
            altitude: "79",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:47.000Z"),
            lat: "29.05248",
            lng: "111.650069",
            speed: "64",
            altitude: "79",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:47.000Z"),
            lat: "29.05248",
            lng: "111.650069",
            speed: "64",
            altitude: "79",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:52.000Z"),
            lat: "29.052095",
            lng: "111.648097",
            speed: "60",
            altitude: "85",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:52.000Z"),
            lat: "29.052095",
            lng: "111.648097",
            speed: "60",
            altitude: "85",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:52.000Z"),
            lat: "29.052095",
            lng: "111.648097",
            speed: "60",
            altitude: "85",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:52.000Z"),
            lat: "29.052095",
            lng: "111.648097",
            speed: "60",
            altitude: "85",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:52.000Z"),
            lat: "29.052095",
            lng: "111.648097",
            speed: "60",
            altitude: "85",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:52.000Z"),
            lat: "29.052095",
            lng: "111.648097",
            speed: "60",
            altitude: "85",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:57.000Z"),
            lat: "29.051576",
            lng: "111.645332",
            speed: "99",
            altitude: "59",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:57.000Z"),
            lat: "29.051576",
            lng: "111.645332",
            speed: "99",
            altitude: "59",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:57.000Z"),
            lat: "29.051576",
            lng: "111.645332",
            speed: "99",
            altitude: "59",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-03-31T04:14:57.000Z"),
            lat: "29.051576",
            lng: "111.645332",
            speed: "99",
            altitude: "59",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:02.000Z"),
            lat: "29.051385",
            lng: "111.64303",
            speed: "74",
            altitude: "82",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:02.000Z"),
            lat: "29.051385",
            lng: "111.64303",
            speed: "74",
            altitude: "82",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:02.000Z"),
            lat: "29.051385",
            lng: "111.64303",
            speed: "74",
            altitude: "82",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:02.000Z"),
            lat: "29.051385",
            lng: "111.64303",
            speed: "74",
            altitude: "82",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:02.000Z"),
            lat: "29.051385",
            lng: "111.64303",
            speed: "74",
            altitude: "82",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:02.000Z"),
            lat: "29.051385",
            lng: "111.64303",
            speed: "74",
            altitude: "82",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:07.000Z"),
            lat: "29.051239",
            lng: "111.640551",
            speed: "97",
            altitude: "105",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:07.000Z"),
            lat: "29.051239",
            lng: "111.640551",
            speed: "97",
            altitude: "105",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:07.000Z"),
            lat: "29.051239",
            lng: "111.640551",
            speed: "97",
            altitude: "105",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:07.000Z"),
            lat: "29.051239",
            lng: "111.640551",
            speed: "97",
            altitude: "105",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:12.000Z"),
            lat: "29.057444",
            lng: "111.597179",
            speed: "51",
            altitude: "78",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:12.000Z"),
            lat: "29.057444",
            lng: "111.597179",
            speed: "51",
            altitude: "78",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:12.000Z"),
            lat: "29.057444",
            lng: "111.597179",
            speed: "51",
            altitude: "78",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:12.000Z"),
            lat: "29.057444",
            lng: "111.597179",
            speed: "51",
            altitude: "78",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:12.000Z"),
            lat: "29.057444",
            lng: "111.597179",
            speed: "51",
            altitude: "78",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:12.000Z"),
            lat: "29.057444",
            lng: "111.597179",
            speed: "51",
            altitude: "78",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:17.000Z"),
            lat: "29.058443",
            lng: "111.594854",
            speed: "85",
            altitude: "101",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:17.000Z"),
            lat: "29.058443",
            lng: "111.594854",
            speed: "85",
            altitude: "101",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:17.000Z"),
            lat: "29.058443",
            lng: "111.594854",
            speed: "85",
            altitude: "101",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:17.000Z"),
            lat: "29.058443",
            lng: "111.594854",
            speed: "85",
            altitude: "101",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:22.000Z"),
            lat: "29.059713",
            lng: "111.591891",
            speed: "68",
            altitude: "51",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:22.000Z"),
            lat: "29.059713",
            lng: "111.591891",
            speed: "68",
            altitude: "51",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:22.000Z"),
            lat: "29.059713",
            lng: "111.591891",
            speed: "68",
            altitude: "51",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:22.000Z"),
            lat: "29.059713",
            lng: "111.591891",
            speed: "68",
            altitude: "51",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:22.000Z"),
            lat: "29.059713",
            lng: "111.591891",
            speed: "68",
            altitude: "51",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:22.000Z"),
            lat: "29.059713",
            lng: "111.591891",
            speed: "68",
            altitude: "51",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:27.000Z"),
            lat: "29.06069",
            lng: "111.589658",
            speed: "64",
            altitude: "88",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:27.000Z"),
            lat: "29.06069",
            lng: "111.589658",
            speed: "64",
            altitude: "88",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:27.000Z"),
            lat: "29.06069",
            lng: "111.589658",
            speed: "64",
            altitude: "88",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:27.000Z"),
            lat: "29.06069",
            lng: "111.589658",
            speed: "64",
            altitude: "88",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:32.000Z"),
            lat: "29.061322",
            lng: "111.587439",
            speed: "62",
            altitude: "107",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:32.000Z"),
            lat: "29.061322",
            lng: "111.587439",
            speed: "62",
            altitude: "107",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:32.000Z"),
            lat: "29.061322",
            lng: "111.587439",
            speed: "62",
            altitude: "107",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:32.000Z"),
            lat: "29.061322",
            lng: "111.587439",
            speed: "62",
            altitude: "107",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:32.000Z"),
            lat: "29.061322",
            lng: "111.587439",
            speed: "62",
            altitude: "107",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:32.000Z"),
            lat: "29.061322",
            lng: "111.587439",
            speed: "62",
            altitude: "107",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:37.000Z"),
            lat: "29.061412",
            lng: "111.584959",
            speed: "49",
            altitude: "61",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:37.000Z"),
            lat: "29.061412",
            lng: "111.584959",
            speed: "49",
            altitude: "61",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:37.000Z"),
            lat: "29.061412",
            lng: "111.584959",
            speed: "49",
            altitude: "61",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:37.000Z"),
            lat: "29.061412",
            lng: "111.584959",
            speed: "49",
            altitude: "61",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:42.000Z"),
            lat: "29.062158",
            lng: "111.58401",
            speed: "79",
            altitude: "71",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:42.000Z"),
            lat: "29.062158",
            lng: "111.58401",
            speed: "79",
            altitude: "71",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:42.000Z"),
            lat: "29.062158",
            lng: "111.58401",
            speed: "79",
            altitude: "71",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:42.000Z"),
            lat: "29.062158",
            lng: "111.58401",
            speed: "79",
            altitude: "71",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:42.000Z"),
            lat: "29.062158",
            lng: "111.58401",
            speed: "79",
            altitude: "71",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:42.000Z"),
            lat: "29.062158",
            lng: "111.58401",
            speed: "79",
            altitude: "71",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:47.000Z"),
            lat: "29.062639",
            lng: "111.582811",
            speed: "46",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:47.000Z"),
            lat: "29.062639",
            lng: "111.582811",
            speed: "46",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:47.000Z"),
            lat: "29.062639",
            lng: "111.582811",
            speed: "46",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:47.000Z"),
            lat: "29.062639",
            lng: "111.582811",
            speed: "46",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:52.000Z"),
            lat: "29.048413",
            lng: "111.579541",
            speed: "69",
            altitude: "107",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:52.000Z"),
            lat: "29.048413",
            lng: "111.579541",
            speed: "69",
            altitude: "107",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:52.000Z"),
            lat: "29.048413",
            lng: "111.579541",
            speed: "69",
            altitude: "107",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:52.000Z"),
            lat: "29.048413",
            lng: "111.579541",
            speed: "69",
            altitude: "107",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:52.000Z"),
            lat: "29.048413",
            lng: "111.579541",
            speed: "69",
            altitude: "107",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:52.000Z"),
            lat: "29.048413",
            lng: "111.579541",
            speed: "69",
            altitude: "107",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:57.000Z"),
            lat: "29.044899",
            lng: "111.579624",
            speed: "50",
            altitude: "97",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:57.000Z"),
            lat: "29.044899",
            lng: "111.579624",
            speed: "50",
            altitude: "97",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:57.000Z"),
            lat: "29.044899",
            lng: "111.579624",
            speed: "50",
            altitude: "97",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-03-31T04:15:57.000Z"),
            lat: "29.044899",
            lng: "111.579624",
            speed: "50",
            altitude: "97",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:02.000Z"),
            lat: "29.042106",
            lng: "111.579687",
            speed: "94",
            altitude: "52",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:02.000Z"),
            lat: "29.042106",
            lng: "111.579687",
            speed: "94",
            altitude: "52",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:02.000Z"),
            lat: "29.042106",
            lng: "111.579687",
            speed: "94",
            altitude: "52",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:02.000Z"),
            lat: "29.042106",
            lng: "111.579687",
            speed: "94",
            altitude: "52",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:02.000Z"),
            lat: "29.042106",
            lng: "111.579687",
            speed: "94",
            altitude: "52",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:02.000Z"),
            lat: "29.042106",
            lng: "111.579687",
            speed: "94",
            altitude: "52",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:07.000Z"),
            lat: "29.039331",
            lng: "111.579753",
            speed: "49",
            altitude: "44",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:07.000Z"),
            lat: "29.039331",
            lng: "111.579753",
            speed: "49",
            altitude: "44",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:07.000Z"),
            lat: "29.039331",
            lng: "111.579753",
            speed: "49",
            altitude: "44",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:07.000Z"),
            lat: "29.039331",
            lng: "111.579753",
            speed: "49",
            altitude: "44",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:12.000Z"),
            lat: "29.035921",
            lng: "111.57984",
            speed: "46",
            altitude: "66",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:12.000Z"),
            lat: "29.035921",
            lng: "111.57984",
            speed: "46",
            altitude: "66",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:12.000Z"),
            lat: "29.035921",
            lng: "111.57984",
            speed: "46",
            altitude: "66",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:12.000Z"),
            lat: "29.035921",
            lng: "111.57984",
            speed: "46",
            altitude: "66",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:12.000Z"),
            lat: "29.035921",
            lng: "111.57984",
            speed: "46",
            altitude: "66",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:12.000Z"),
            lat: "29.035921",
            lng: "111.57984",
            speed: "46",
            altitude: "66",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:17.000Z"),
            lat: "29.033108",
            lng: "111.579907",
            speed: "94",
            altitude: "77",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:17.000Z"),
            lat: "29.033108",
            lng: "111.579907",
            speed: "94",
            altitude: "77",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:17.000Z"),
            lat: "29.033108",
            lng: "111.579907",
            speed: "94",
            altitude: "77",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:17.000Z"),
            lat: "29.033108",
            lng: "111.579907",
            speed: "94",
            altitude: "77",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:22.000Z"),
            lat: "29.030355",
            lng: "111.57998",
            speed: "51",
            altitude: "81",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:22.000Z"),
            lat: "29.030355",
            lng: "111.57998",
            speed: "51",
            altitude: "81",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:22.000Z"),
            lat: "29.030355",
            lng: "111.57998",
            speed: "51",
            altitude: "81",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:22.000Z"),
            lat: "29.030355",
            lng: "111.57998",
            speed: "51",
            altitude: "81",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:22.000Z"),
            lat: "29.030355",
            lng: "111.57998",
            speed: "51",
            altitude: "81",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:22.000Z"),
            lat: "29.030355",
            lng: "111.57998",
            speed: "51",
            altitude: "81",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:27.000Z"),
            lat: "29.026827",
            lng: "111.580199",
            speed: "82",
            altitude: "82",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:27.000Z"),
            lat: "29.026827",
            lng: "111.580199",
            speed: "82",
            altitude: "82",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:27.000Z"),
            lat: "29.026827",
            lng: "111.580199",
            speed: "82",
            altitude: "82",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:27.000Z"),
            lat: "29.026827",
            lng: "111.580199",
            speed: "82",
            altitude: "82",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:32.000Z"),
            lat: "28.973994",
            lng: "111.581287",
            speed: "58",
            altitude: "91",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:32.000Z"),
            lat: "28.973994",
            lng: "111.581287",
            speed: "58",
            altitude: "91",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:32.000Z"),
            lat: "28.973994",
            lng: "111.581287",
            speed: "58",
            altitude: "91",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:32.000Z"),
            lat: "28.973994",
            lng: "111.581287",
            speed: "58",
            altitude: "91",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:32.000Z"),
            lat: "28.973994",
            lng: "111.581287",
            speed: "58",
            altitude: "91",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:32.000Z"),
            lat: "28.973994",
            lng: "111.581287",
            speed: "58",
            altitude: "91",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:37.000Z"),
            lat: "28.970409",
            lng: "111.581491",
            speed: "77",
            altitude: "83",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:37.000Z"),
            lat: "28.970409",
            lng: "111.581491",
            speed: "77",
            altitude: "83",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:37.000Z"),
            lat: "28.970409",
            lng: "111.581491",
            speed: "77",
            altitude: "83",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:37.000Z"),
            lat: "28.970409",
            lng: "111.581491",
            speed: "77",
            altitude: "83",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:42.000Z"),
            lat: "28.967363",
            lng: "111.582183",
            speed: "42",
            altitude: "92",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:42.000Z"),
            lat: "28.967363",
            lng: "111.582183",
            speed: "42",
            altitude: "92",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:42.000Z"),
            lat: "28.967363",
            lng: "111.582183",
            speed: "42",
            altitude: "92",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:42.000Z"),
            lat: "28.967363",
            lng: "111.582183",
            speed: "42",
            altitude: "92",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:42.000Z"),
            lat: "28.967363",
            lng: "111.582183",
            speed: "42",
            altitude: "92",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:42.000Z"),
            lat: "28.967363",
            lng: "111.582183",
            speed: "42",
            altitude: "92",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:47.000Z"),
            lat: "28.96434",
            lng: "111.583392",
            speed: "83",
            altitude: "73",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:47.000Z"),
            lat: "28.96434",
            lng: "111.583392",
            speed: "83",
            altitude: "73",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:47.000Z"),
            lat: "28.96434",
            lng: "111.583392",
            speed: "83",
            altitude: "73",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:52.000Z"),
            lat: "28.945057",
            lng: "111.610518",
            speed: "66",
            altitude: "49",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:52.000Z"),
            lat: "28.945057",
            lng: "111.610518",
            speed: "66",
            altitude: "49",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:52.000Z"),
            lat: "28.945057",
            lng: "111.610518",
            speed: "66",
            altitude: "49",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:52.000Z"),
            lat: "28.945057",
            lng: "111.610518",
            speed: "66",
            altitude: "49",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:52.000Z"),
            lat: "28.945057",
            lng: "111.610518",
            speed: "66",
            altitude: "49",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:57.000Z"),
            lat: "28.943625",
            lng: "111.614661",
            speed: "75",
            altitude: "45",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:57.000Z"),
            lat: "28.943625",
            lng: "111.614661",
            speed: "75",
            altitude: "45",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:57.000Z"),
            lat: "28.943625",
            lng: "111.614661",
            speed: "75",
            altitude: "45",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:57.000Z"),
            lat: "28.943625",
            lng: "111.614661",
            speed: "75",
            altitude: "45",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:16:57.000Z"),
            lat: "28.943625",
            lng: "111.614661",
            speed: "75",
            altitude: "45",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:02.000Z"),
            lat: "28.942739",
            lng: "111.617923",
            speed: "57",
            altitude: "108",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:02.000Z"),
            lat: "28.942739",
            lng: "111.617923",
            speed: "57",
            altitude: "108",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:02.000Z"),
            lat: "28.942739",
            lng: "111.617923",
            speed: "57",
            altitude: "108",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:02.000Z"),
            lat: "28.942739",
            lng: "111.617923",
            speed: "57",
            altitude: "108",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:02.000Z"),
            lat: "28.942739",
            lng: "111.617923",
            speed: "57",
            altitude: "108",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:07.000Z"),
            lat: "28.942068",
            lng: "111.621044",
            speed: "72",
            altitude: "101",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:07.000Z"),
            lat: "28.942068",
            lng: "111.621044",
            speed: "72",
            altitude: "101",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:07.000Z"),
            lat: "28.942068",
            lng: "111.621044",
            speed: "72",
            altitude: "101",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:07.000Z"),
            lat: "28.942068",
            lng: "111.621044",
            speed: "72",
            altitude: "101",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:07.000Z"),
            lat: "28.942068",
            lng: "111.621044",
            speed: "72",
            altitude: "101",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:12.000Z"),
            lat: "28.942192",
            lng: "111.640372",
            speed: "94",
            altitude: "64",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:12.000Z"),
            lat: "28.942192",
            lng: "111.640372",
            speed: "94",
            altitude: "64",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:12.000Z"),
            lat: "28.942192",
            lng: "111.640372",
            speed: "94",
            altitude: "64",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:12.000Z"),
            lat: "28.942192",
            lng: "111.640372",
            speed: "94",
            altitude: "64",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:12.000Z"),
            lat: "28.942192",
            lng: "111.640372",
            speed: "94",
            altitude: "64",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:17.000Z"),
            lat: "28.942109",
            lng: "111.642263",
            speed: "60",
            altitude: "53",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:17.000Z"),
            lat: "28.942109",
            lng: "111.642263",
            speed: "60",
            altitude: "53",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:17.000Z"),
            lat: "28.942109",
            lng: "111.642263",
            speed: "60",
            altitude: "53",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:17.000Z"),
            lat: "28.942109",
            lng: "111.642263",
            speed: "60",
            altitude: "53",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:17.000Z"),
            lat: "28.942109",
            lng: "111.642263",
            speed: "60",
            altitude: "53",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:22.000Z"),
            lat: "28.944048",
            lng: "111.642703",
            speed: "66",
            altitude: "77",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:22.000Z"),
            lat: "28.944048",
            lng: "111.642703",
            speed: "66",
            altitude: "77",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:22.000Z"),
            lat: "28.944048",
            lng: "111.642703",
            speed: "66",
            altitude: "77",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:22.000Z"),
            lat: "28.944048",
            lng: "111.642703",
            speed: "66",
            altitude: "77",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:22.000Z"),
            lat: "28.944048",
            lng: "111.642703",
            speed: "66",
            altitude: "77",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:27.000Z"),
            lat: "28.945927",
            lng: "111.643025",
            speed: "48",
            altitude: "60",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:27.000Z"),
            lat: "28.945927",
            lng: "111.643025",
            speed: "48",
            altitude: "60",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:27.000Z"),
            lat: "28.945927",
            lng: "111.643025",
            speed: "48",
            altitude: "60",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:27.000Z"),
            lat: "28.945927",
            lng: "111.643025",
            speed: "48",
            altitude: "60",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:27.000Z"),
            lat: "28.945927",
            lng: "111.643025",
            speed: "48",
            altitude: "60",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:32.000Z"),
            lat: "28.947937",
            lng: "111.644411",
            speed: "59",
            altitude: "74",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:32.000Z"),
            lat: "28.947937",
            lng: "111.644411",
            speed: "59",
            altitude: "74",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:32.000Z"),
            lat: "28.947937",
            lng: "111.644411",
            speed: "59",
            altitude: "74",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:32.000Z"),
            lat: "28.947937",
            lng: "111.644411",
            speed: "59",
            altitude: "74",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:32.000Z"),
            lat: "28.947937",
            lng: "111.644411",
            speed: "59",
            altitude: "74",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:37.000Z"),
            lat: "28.94976",
            lng: "111.646143",
            speed: "89",
            altitude: "84",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:37.000Z"),
            lat: "28.94976",
            lng: "111.646143",
            speed: "89",
            altitude: "84",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:37.000Z"),
            lat: "28.94976",
            lng: "111.646143",
            speed: "89",
            altitude: "84",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:37.000Z"),
            lat: "28.94976",
            lng: "111.646143",
            speed: "89",
            altitude: "84",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:37.000Z"),
            lat: "28.94976",
            lng: "111.646143",
            speed: "89",
            altitude: "84",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:42.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "54",
            altitude: "108",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:42.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "54",
            altitude: "108",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:42.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "54",
            altitude: "108",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:42.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "54",
            altitude: "108",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:42.000Z"),
            lat: "28.951769",
            lng: "111.648698",
            speed: "54",
            altitude: "108",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:47.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "79",
            altitude: "86",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:47.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "79",
            altitude: "86",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:47.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "79",
            altitude: "86",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:47.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "79",
            altitude: "86",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:47.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "79",
            altitude: "86",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:47.000Z"),
            lat: "28.953477",
            lng: "111.650966",
            speed: "79",
            altitude: "86",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:52.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "44",
            altitude: "81",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:52.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "44",
            altitude: "81",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:52.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "44",
            altitude: "81",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:52.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "44",
            altitude: "81",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:52.000Z"),
            lat: "28.955486",
            lng: "111.653035",
            speed: "44",
            altitude: "81",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:57.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "45",
            altitude: "76",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:57.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "45",
            altitude: "76",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:57.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "45",
            altitude: "76",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:57.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "45",
            altitude: "76",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:17:57.000Z"),
            lat: "28.958491",
            lng: "111.655189",
            speed: "45",
            altitude: "76",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:02.000Z"),
            lat: "28.961059",
            lng: "111.656443",
            speed: "46",
            altitude: "105",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:02.000Z"),
            lat: "28.961059",
            lng: "111.656443",
            speed: "46",
            altitude: "105",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:02.000Z"),
            lat: "28.961059",
            lng: "111.656443",
            speed: "46",
            altitude: "105",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:02.000Z"),
            lat: "28.961059",
            lng: "111.656443",
            speed: "46",
            altitude: "105",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:02.000Z"),
            lat: "28.961059",
            lng: "111.656443",
            speed: "46",
            altitude: "105",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:07.000Z"),
            lat: "28.963526",
            lng: "111.657522",
            speed: "54",
            altitude: "83",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:07.000Z"),
            lat: "28.963526",
            lng: "111.657522",
            speed: "54",
            altitude: "83",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:07.000Z"),
            lat: "28.963526",
            lng: "111.657522",
            speed: "54",
            altitude: "83",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:07.000Z"),
            lat: "28.963526",
            lng: "111.657522",
            speed: "54",
            altitude: "83",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:07.000Z"),
            lat: "28.963526",
            lng: "111.657522",
            speed: "54",
            altitude: "83",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:12.000Z"),
            lat: "28.988429",
            lng: "111.664953",
            speed: "67",
            altitude: "100",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:12.000Z"),
            lat: "28.988429",
            lng: "111.664953",
            speed: "67",
            altitude: "100",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:12.000Z"),
            lat: "28.988429",
            lng: "111.664953",
            speed: "67",
            altitude: "100",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:12.000Z"),
            lat: "28.988429",
            lng: "111.664953",
            speed: "67",
            altitude: "100",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:12.000Z"),
            lat: "28.988429",
            lng: "111.664953",
            speed: "67",
            altitude: "100",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:17.000Z"),
            lat: "28.99034",
            lng: "111.665033",
            speed: "80",
            altitude: "93",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:17.000Z"),
            lat: "28.99034",
            lng: "111.665033",
            speed: "80",
            altitude: "93",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:17.000Z"),
            lat: "28.99034",
            lng: "111.665033",
            speed: "80",
            altitude: "93",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:17.000Z"),
            lat: "28.99034",
            lng: "111.665033",
            speed: "80",
            altitude: "93",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:17.000Z"),
            lat: "28.99034",
            lng: "111.665033",
            speed: "80",
            altitude: "93",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:22.000Z"),
            lat: "28.9927",
            lng: "111.665076",
            speed: "56",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:22.000Z"),
            lat: "28.9927",
            lng: "111.665076",
            speed: "56",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:22.000Z"),
            lat: "28.9927",
            lng: "111.665076",
            speed: "56",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:22.000Z"),
            lat: "28.9927",
            lng: "111.665076",
            speed: "56",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:22.000Z"),
            lat: "28.9927",
            lng: "111.665076",
            speed: "56",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:27.000Z"),
            lat: "28.994699",
            lng: "111.665116",
            speed: "66",
            altitude: "72",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:27.000Z"),
            lat: "28.994699",
            lng: "111.665116",
            speed: "66",
            altitude: "72",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:27.000Z"),
            lat: "28.994699",
            lng: "111.665116",
            speed: "66",
            altitude: "72",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:27.000Z"),
            lat: "28.994699",
            lng: "111.665116",
            speed: "66",
            altitude: "72",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:27.000Z"),
            lat: "28.994699",
            lng: "111.665116",
            speed: "66",
            altitude: "72",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:32.000Z"),
            lat: "28.99654",
            lng: "111.665145",
            speed: "90",
            altitude: "87",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:32.000Z"),
            lat: "28.99654",
            lng: "111.665145",
            speed: "90",
            altitude: "87",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:32.000Z"),
            lat: "28.99654",
            lng: "111.665145",
            speed: "90",
            altitude: "87",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:32.000Z"),
            lat: "28.99654",
            lng: "111.665145",
            speed: "90",
            altitude: "87",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:32.000Z"),
            lat: "28.99654",
            lng: "111.665145",
            speed: "90",
            altitude: "87",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:37.000Z"),
            lat: "28.997366",
            lng: "111.665152",
            speed: "86",
            altitude: "85",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:37.000Z"),
            lat: "28.997366",
            lng: "111.665152",
            speed: "86",
            altitude: "85",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:37.000Z"),
            lat: "28.997366",
            lng: "111.665152",
            speed: "86",
            altitude: "85",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:37.000Z"),
            lat: "28.997366",
            lng: "111.665152",
            speed: "86",
            altitude: "85",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:37.000Z"),
            lat: "28.997366",
            lng: "111.665152",
            speed: "86",
            altitude: "85",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:42.000Z"),
            lat: "28.997364",
            lng: "111.665148",
            speed: "53",
            altitude: "79",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:42.000Z"),
            lat: "28.997364",
            lng: "111.665148",
            speed: "53",
            altitude: "79",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:42.000Z"),
            lat: "28.997364",
            lng: "111.665148",
            speed: "53",
            altitude: "79",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:42.000Z"),
            lat: "28.997364",
            lng: "111.665148",
            speed: "53",
            altitude: "79",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:42.000Z"),
            lat: "28.997364",
            lng: "111.665148",
            speed: "53",
            altitude: "79",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:47.000Z"),
            lat: "28.997366",
            lng: "111.665148",
            speed: "43",
            altitude: "76",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:47.000Z"),
            lat: "28.997366",
            lng: "111.665148",
            speed: "43",
            altitude: "76",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:47.000Z"),
            lat: "28.997366",
            lng: "111.665148",
            speed: "43",
            altitude: "76",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:47.000Z"),
            lat: "28.997366",
            lng: "111.665148",
            speed: "43",
            altitude: "76",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:47.000Z"),
            lat: "28.997366",
            lng: "111.665148",
            speed: "43",
            altitude: "76",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:53.000Z"),
            lat: "29.002055",
            lng: "111.665269",
            speed: "83",
            altitude: "74",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:53.000Z"),
            lat: "29.002055",
            lng: "111.665269",
            speed: "83",
            altitude: "74",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:53.000Z"),
            lat: "29.002055",
            lng: "111.665269",
            speed: "83",
            altitude: "74",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:53.000Z"),
            lat: "29.002055",
            lng: "111.665269",
            speed: "83",
            altitude: "74",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:53.000Z"),
            lat: "29.002055",
            lng: "111.665269",
            speed: "83",
            altitude: "74",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:58.000Z"),
            lat: "29.002616",
            lng: "111.665277",
            speed: "76",
            altitude: "43",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:58.000Z"),
            lat: "29.002616",
            lng: "111.665277",
            speed: "76",
            altitude: "43",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:58.000Z"),
            lat: "29.002616",
            lng: "111.665277",
            speed: "76",
            altitude: "43",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:58.000Z"),
            lat: "29.002616",
            lng: "111.665277",
            speed: "76",
            altitude: "43",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-03-31T04:18:58.000Z"),
            lat: "29.002616",
            lng: "111.665277",
            speed: "76",
            altitude: "43",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:03.000Z"),
            lat: "29.002618",
            lng: "111.66528",
            speed: "86",
            altitude: "108",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:03.000Z"),
            lat: "29.002618",
            lng: "111.66528",
            speed: "86",
            altitude: "108",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:03.000Z"),
            lat: "29.002618",
            lng: "111.66528",
            speed: "86",
            altitude: "108",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:03.000Z"),
            lat: "29.002618",
            lng: "111.66528",
            speed: "86",
            altitude: "108",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:03.000Z"),
            lat: "29.002618",
            lng: "111.66528",
            speed: "86",
            altitude: "108",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:08.000Z"),
            lat: "29.002618",
            lng: "111.665284",
            speed: "61",
            altitude: "71",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:08.000Z"),
            lat: "29.002618",
            lng: "111.665284",
            speed: "61",
            altitude: "71",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:08.000Z"),
            lat: "29.002618",
            lng: "111.665284",
            speed: "61",
            altitude: "71",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:08.000Z"),
            lat: "29.002618",
            lng: "111.665284",
            speed: "61",
            altitude: "71",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:08.000Z"),
            lat: "29.002618",
            lng: "111.665284",
            speed: "61",
            altitude: "71",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:13.000Z"),
            lat: "29.002801",
            lng: "111.665287",
            speed: "94",
            altitude: "76",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:13.000Z"),
            lat: "29.002801",
            lng: "111.665287",
            speed: "94",
            altitude: "76",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:13.000Z"),
            lat: "29.002801",
            lng: "111.665287",
            speed: "94",
            altitude: "76",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:13.000Z"),
            lat: "29.002801",
            lng: "111.665287",
            speed: "94",
            altitude: "76",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:13.000Z"),
            lat: "29.002801",
            lng: "111.665287",
            speed: "94",
            altitude: "76",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:18.000Z"),
            lat: "29.004139",
            lng: "111.665284",
            speed: "43",
            altitude: "108",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:18.000Z"),
            lat: "29.004139",
            lng: "111.665284",
            speed: "43",
            altitude: "108",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:18.000Z"),
            lat: "29.004139",
            lng: "111.665284",
            speed: "43",
            altitude: "108",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:18.000Z"),
            lat: "29.004139",
            lng: "111.665284",
            speed: "43",
            altitude: "108",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:18.000Z"),
            lat: "29.004139",
            lng: "111.665284",
            speed: "43",
            altitude: "108",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:23.000Z"),
            lat: "29.00555",
            lng: "111.665296",
            speed: "48",
            altitude: "90",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:23.000Z"),
            lat: "29.00555",
            lng: "111.665296",
            speed: "48",
            altitude: "90",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:23.000Z"),
            lat: "29.00555",
            lng: "111.665296",
            speed: "48",
            altitude: "90",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:23.000Z"),
            lat: "29.00555",
            lng: "111.665296",
            speed: "48",
            altitude: "90",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:23.000Z"),
            lat: "29.00555",
            lng: "111.665296",
            speed: "48",
            altitude: "90",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:28.000Z"),
            lat: "29.006944",
            lng: "111.665313",
            speed: "93",
            altitude: "84",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:28.000Z"),
            lat: "29.006944",
            lng: "111.665313",
            speed: "93",
            altitude: "84",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:28.000Z"),
            lat: "29.006944",
            lng: "111.665313",
            speed: "93",
            altitude: "84",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:28.000Z"),
            lat: "29.006944",
            lng: "111.665313",
            speed: "93",
            altitude: "84",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:28.000Z"),
            lat: "29.006944",
            lng: "111.665313",
            speed: "93",
            altitude: "84",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:33.000Z"),
            lat: "29.00842",
            lng: "111.665343",
            speed: "74",
            altitude: "45",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:33.000Z"),
            lat: "29.00842",
            lng: "111.665343",
            speed: "74",
            altitude: "45",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:33.000Z"),
            lat: "29.00842",
            lng: "111.665343",
            speed: "74",
            altitude: "45",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:33.000Z"),
            lat: "29.00842",
            lng: "111.665343",
            speed: "74",
            altitude: "45",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:33.000Z"),
            lat: "29.00842",
            lng: "111.665343",
            speed: "74",
            altitude: "45",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:38.000Z"),
            lat: "29.010061",
            lng: "111.665403",
            speed: "93",
            altitude: "76",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:38.000Z"),
            lat: "29.010061",
            lng: "111.665403",
            speed: "93",
            altitude: "76",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:38.000Z"),
            lat: "29.010061",
            lng: "111.665403",
            speed: "93",
            altitude: "76",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:38.000Z"),
            lat: "29.010061",
            lng: "111.665403",
            speed: "93",
            altitude: "76",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:38.000Z"),
            lat: "29.010061",
            lng: "111.665403",
            speed: "93",
            altitude: "76",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:43.000Z"),
            lat: "29.010138",
            lng: "111.665408",
            speed: "43",
            altitude: "67",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:43.000Z"),
            lat: "29.010138",
            lng: "111.665408",
            speed: "43",
            altitude: "67",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:43.000Z"),
            lat: "29.010138",
            lng: "111.665408",
            speed: "43",
            altitude: "67",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:43.000Z"),
            lat: "29.010138",
            lng: "111.665408",
            speed: "43",
            altitude: "67",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:43.000Z"),
            lat: "29.010138",
            lng: "111.665408",
            speed: "43",
            altitude: "67",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:48.000Z"),
            lat: "29.010139",
            lng: "111.665411",
            speed: "81",
            altitude: "85",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:48.000Z"),
            lat: "29.010139",
            lng: "111.665411",
            speed: "81",
            altitude: "85",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:48.000Z"),
            lat: "29.010139",
            lng: "111.665411",
            speed: "81",
            altitude: "85",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:48.000Z"),
            lat: "29.010139",
            lng: "111.665411",
            speed: "81",
            altitude: "85",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:48.000Z"),
            lat: "29.010139",
            lng: "111.665411",
            speed: "81",
            altitude: "85",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:53.000Z"),
            lat: "29.01213",
            lng: "111.665086",
            speed: "74",
            altitude: "42",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:53.000Z"),
            lat: "29.01213",
            lng: "111.665086",
            speed: "74",
            altitude: "42",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:53.000Z"),
            lat: "29.01213",
            lng: "111.665086",
            speed: "74",
            altitude: "42",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:53.000Z"),
            lat: "29.01213",
            lng: "111.665086",
            speed: "74",
            altitude: "42",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:53.000Z"),
            lat: "29.01213",
            lng: "111.665086",
            speed: "74",
            altitude: "42",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:58.000Z"),
            lat: "29.013642",
            lng: "111.664311",
            speed: "48",
            altitude: "40",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:58.000Z"),
            lat: "29.013642",
            lng: "111.664311",
            speed: "48",
            altitude: "40",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:58.000Z"),
            lat: "29.013642",
            lng: "111.664311",
            speed: "48",
            altitude: "40",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:58.000Z"),
            lat: "29.013642",
            lng: "111.664311",
            speed: "48",
            altitude: "40",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:19:58.000Z"),
            lat: "29.013642",
            lng: "111.664311",
            speed: "48",
            altitude: "40",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:03.000Z"),
            lat: "29.015059",
            lng: "111.663181",
            speed: "75",
            altitude: "67",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:03.000Z"),
            lat: "29.015059",
            lng: "111.663181",
            speed: "75",
            altitude: "67",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:03.000Z"),
            lat: "29.015059",
            lng: "111.663181",
            speed: "75",
            altitude: "67",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:03.000Z"),
            lat: "29.015059",
            lng: "111.663181",
            speed: "75",
            altitude: "67",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:03.000Z"),
            lat: "29.015059",
            lng: "111.663181",
            speed: "75",
            altitude: "67",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:08.000Z"),
            lat: "29.017031",
            lng: "111.661588",
            speed: "73",
            altitude: "57",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:08.000Z"),
            lat: "29.017031",
            lng: "111.661588",
            speed: "73",
            altitude: "57",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:08.000Z"),
            lat: "29.017031",
            lng: "111.661588",
            speed: "73",
            altitude: "57",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:08.000Z"),
            lat: "29.017031",
            lng: "111.661588",
            speed: "73",
            altitude: "57",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:08.000Z"),
            lat: "29.017031",
            lng: "111.661588",
            speed: "73",
            altitude: "57",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:13.000Z"),
            lat: "29.018814",
            lng: "111.660164",
            speed: "86",
            altitude: "40",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:13.000Z"),
            lat: "29.018814",
            lng: "111.660164",
            speed: "86",
            altitude: "40",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:13.000Z"),
            lat: "29.018814",
            lng: "111.660164",
            speed: "86",
            altitude: "40",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:13.000Z"),
            lat: "29.018814",
            lng: "111.660164",
            speed: "86",
            altitude: "40",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:13.000Z"),
            lat: "29.018814",
            lng: "111.660164",
            speed: "86",
            altitude: "40",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:18.000Z"),
            lat: "29.020366",
            lng: "111.658921",
            speed: "45",
            altitude: "87",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:18.000Z"),
            lat: "29.020366",
            lng: "111.658921",
            speed: "45",
            altitude: "87",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:18.000Z"),
            lat: "29.020366",
            lng: "111.658921",
            speed: "45",
            altitude: "87",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:18.000Z"),
            lat: "29.020366",
            lng: "111.658921",
            speed: "45",
            altitude: "87",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:18.000Z"),
            lat: "29.020366",
            lng: "111.658921",
            speed: "45",
            altitude: "87",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:23.000Z"),
            lat: "29.022178",
            lng: "111.657469",
            speed: "92",
            altitude: "77",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:23.000Z"),
            lat: "29.022178",
            lng: "111.657469",
            speed: "92",
            altitude: "77",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:23.000Z"),
            lat: "29.022178",
            lng: "111.657469",
            speed: "92",
            altitude: "77",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:23.000Z"),
            lat: "29.022178",
            lng: "111.657469",
            speed: "92",
            altitude: "77",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:23.000Z"),
            lat: "29.022178",
            lng: "111.657469",
            speed: "92",
            altitude: "77",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:28.000Z"),
            lat: "29.023667",
            lng: "111.656267",
            speed: "91",
            altitude: "82",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:28.000Z"),
            lat: "29.023667",
            lng: "111.656267",
            speed: "91",
            altitude: "82",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:28.000Z"),
            lat: "29.023667",
            lng: "111.656267",
            speed: "91",
            altitude: "82",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:28.000Z"),
            lat: "29.023667",
            lng: "111.656267",
            speed: "91",
            altitude: "82",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:28.000Z"),
            lat: "29.023667",
            lng: "111.656267",
            speed: "91",
            altitude: "82",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:33.000Z"),
            lat: "29.037734",
            lng: "111.649306",
            speed: "51",
            altitude: "88",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:33.000Z"),
            lat: "29.037734",
            lng: "111.649306",
            speed: "51",
            altitude: "88",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:33.000Z"),
            lat: "29.037734",
            lng: "111.649306",
            speed: "51",
            altitude: "88",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:33.000Z"),
            lat: "29.037734",
            lng: "111.649306",
            speed: "51",
            altitude: "88",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:33.000Z"),
            lat: "29.037734",
            lng: "111.649306",
            speed: "51",
            altitude: "88",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:38.000Z"),
            lat: "29.038752",
            lng: "111.649278",
            speed: "80",
            altitude: "70",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:38.000Z"),
            lat: "29.038752",
            lng: "111.649278",
            speed: "80",
            altitude: "70",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:38.000Z"),
            lat: "29.038752",
            lng: "111.649278",
            speed: "80",
            altitude: "70",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:38.000Z"),
            lat: "29.038752",
            lng: "111.649278",
            speed: "80",
            altitude: "70",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:38.000Z"),
            lat: "29.038752",
            lng: "111.649278",
            speed: "80",
            altitude: "70",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:43.000Z"),
            lat: "29.039928",
            lng: "111.649296",
            speed: "53",
            altitude: "59",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:43.000Z"),
            lat: "29.039928",
            lng: "111.649296",
            speed: "53",
            altitude: "59",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:43.000Z"),
            lat: "29.039928",
            lng: "111.649296",
            speed: "53",
            altitude: "59",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:43.000Z"),
            lat: "29.039928",
            lng: "111.649296",
            speed: "53",
            altitude: "59",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:43.000Z"),
            lat: "29.039928",
            lng: "111.649296",
            speed: "53",
            altitude: "59",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:48.000Z"),
            lat: "29.040964",
            lng: "111.649286",
            speed: "86",
            altitude: "41",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:48.000Z"),
            lat: "29.040964",
            lng: "111.649286",
            speed: "86",
            altitude: "41",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:48.000Z"),
            lat: "29.040964",
            lng: "111.649286",
            speed: "86",
            altitude: "41",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:48.000Z"),
            lat: "29.040964",
            lng: "111.649286",
            speed: "86",
            altitude: "41",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:48.000Z"),
            lat: "29.040964",
            lng: "111.649286",
            speed: "86",
            altitude: "41",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:53.000Z"),
            lat: "29.046501",
            lng: "111.649284",
            speed: "56",
            altitude: "87",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:53.000Z"),
            lat: "29.046501",
            lng: "111.649284",
            speed: "56",
            altitude: "87",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:53.000Z"),
            lat: "29.046501",
            lng: "111.649284",
            speed: "56",
            altitude: "87",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:53.000Z"),
            lat: "29.046501",
            lng: "111.649284",
            speed: "56",
            altitude: "87",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:53.000Z"),
            lat: "29.046501",
            lng: "111.649284",
            speed: "56",
            altitude: "87",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:58.000Z"),
            lat: "29.047872",
            lng: "111.649275",
            speed: "56",
            altitude: "85",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:58.000Z"),
            lat: "29.047872",
            lng: "111.649275",
            speed: "56",
            altitude: "85",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:58.000Z"),
            lat: "29.047872",
            lng: "111.649275",
            speed: "56",
            altitude: "85",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:58.000Z"),
            lat: "29.047872",
            lng: "111.649275",
            speed: "56",
            altitude: "85",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:20:58.000Z"),
            lat: "29.047872",
            lng: "111.649275",
            speed: "56",
            altitude: "85",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:03.000Z"),
            lat: "29.049376",
            lng: "111.649267",
            speed: "45",
            altitude: "107",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:03.000Z"),
            lat: "29.049376",
            lng: "111.649267",
            speed: "45",
            altitude: "107",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:03.000Z"),
            lat: "29.049376",
            lng: "111.649267",
            speed: "45",
            altitude: "107",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:03.000Z"),
            lat: "29.049376",
            lng: "111.649267",
            speed: "45",
            altitude: "107",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:03.000Z"),
            lat: "29.049376",
            lng: "111.649267",
            speed: "45",
            altitude: "107",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:08.000Z"),
            lat: "29.051216",
            lng: "111.649299",
            speed: "45",
            altitude: "69",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:08.000Z"),
            lat: "29.051216",
            lng: "111.649299",
            speed: "45",
            altitude: "69",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:08.000Z"),
            lat: "29.051216",
            lng: "111.649299",
            speed: "45",
            altitude: "69",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:08.000Z"),
            lat: "29.051216",
            lng: "111.649299",
            speed: "45",
            altitude: "69",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:08.000Z"),
            lat: "29.051216",
            lng: "111.649299",
            speed: "45",
            altitude: "69",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:13.000Z"),
            lat: "29.053242",
            lng: "111.657785",
            speed: "58",
            altitude: "50",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:13.000Z"),
            lat: "29.053242",
            lng: "111.657785",
            speed: "58",
            altitude: "50",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:13.000Z"),
            lat: "29.053242",
            lng: "111.657785",
            speed: "58",
            altitude: "50",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:13.000Z"),
            lat: "29.053242",
            lng: "111.657785",
            speed: "58",
            altitude: "50",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:13.000Z"),
            lat: "29.053242",
            lng: "111.657785",
            speed: "58",
            altitude: "50",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:18.000Z"),
            lat: "29.053487",
            lng: "111.659737",
            speed: "71",
            altitude: "51",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:18.000Z"),
            lat: "29.053487",
            lng: "111.659737",
            speed: "71",
            altitude: "51",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:18.000Z"),
            lat: "29.053487",
            lng: "111.659737",
            speed: "71",
            altitude: "51",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:18.000Z"),
            lat: "29.053487",
            lng: "111.659737",
            speed: "71",
            altitude: "51",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:18.000Z"),
            lat: "29.053487",
            lng: "111.659737",
            speed: "71",
            altitude: "51",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:23.000Z"),
            lat: "29.053509",
            lng: "111.659934",
            speed: "84",
            altitude: "99",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:23.000Z"),
            lat: "29.053509",
            lng: "111.659934",
            speed: "84",
            altitude: "99",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:23.000Z"),
            lat: "29.053509",
            lng: "111.659934",
            speed: "84",
            altitude: "99",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:23.000Z"),
            lat: "29.053509",
            lng: "111.659934",
            speed: "84",
            altitude: "99",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:23.000Z"),
            lat: "29.053509",
            lng: "111.659934",
            speed: "84",
            altitude: "99",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:28.000Z"),
            lat: "29.053565",
            lng: "111.660396",
            speed: "52",
            altitude: "106",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:28.000Z"),
            lat: "29.053565",
            lng: "111.660396",
            speed: "52",
            altitude: "106",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:28.000Z"),
            lat: "29.053565",
            lng: "111.660396",
            speed: "52",
            altitude: "106",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:28.000Z"),
            lat: "29.053565",
            lng: "111.660396",
            speed: "52",
            altitude: "106",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:28.000Z"),
            lat: "29.053565",
            lng: "111.660396",
            speed: "52",
            altitude: "106",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:33.000Z"),
            lat: "29.053575",
            lng: "111.660468",
            speed: "74",
            altitude: "105",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:33.000Z"),
            lat: "29.053575",
            lng: "111.660468",
            speed: "74",
            altitude: "105",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:33.000Z"),
            lat: "29.053575",
            lng: "111.660468",
            speed: "74",
            altitude: "105",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:33.000Z"),
            lat: "29.053575",
            lng: "111.660468",
            speed: "74",
            altitude: "105",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:33.000Z"),
            lat: "29.053575",
            lng: "111.660468",
            speed: "74",
            altitude: "105",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:38.000Z"),
            lat: "29.053572",
            lng: "111.660468",
            speed: "95",
            altitude: "67",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:38.000Z"),
            lat: "29.053572",
            lng: "111.660468",
            speed: "95",
            altitude: "67",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:38.000Z"),
            lat: "29.053572",
            lng: "111.660468",
            speed: "95",
            altitude: "67",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:38.000Z"),
            lat: "29.053572",
            lng: "111.660468",
            speed: "95",
            altitude: "67",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:38.000Z"),
            lat: "29.053572",
            lng: "111.660468",
            speed: "95",
            altitude: "67",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:43.000Z"),
            lat: "29.05357",
            lng: "111.660471",
            speed: "61",
            altitude: "100",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-03-31T04:21:43.000Z"),
            lat: "29.05357",
            lng: "111.660471",
            speed: "61",
            altitude: "100",
            direction: "40"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-03-31T04:21:56.262Z"),
    _class: "com.zzk.system.domain.fly.HistoryPath"
} ]);
db.getCollection("historyPath").insert([ {
    _id: ObjectId("6427c876e0deb8242860ba43"),
    droneObjectId: ObjectId("64148971538ba54e4ee0c487"),
    droneId: "64148971538ba54e4ee0c487",
    droneName: "dj无人机",
    cardId: "145811",
    pathName: "白马湖路线",
    startPoint: {
        dateTime: ISODate("2023-04-01T05:45:01.000Z"),
        lat: "29.04925",
        lng: "111.670404",
        speed: "51",
        altitude: "65",
        direction: "89"
    },
    endPoint: {
        dateTime: ISODate("2023-04-01T05:59:55.000Z"),
        lat: "29.049286",
        lng: "111.670371",
        speed: "82",
        altitude: "71",
        direction: "80"
    },
    path: [
        {
            dateTime: ISODate("2023-04-01T05:45:01.000Z"),
            lat: "29.04925",
            lng: "111.670404",
            speed: "51",
            altitude: "65",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:01.000Z"),
            lat: "29.04925",
            lng: "111.670404",
            speed: "51",
            altitude: "65",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:03.000Z"),
            lat: "29.049246",
            lng: "111.670441",
            speed: "89",
            altitude: "75",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:03.000Z"),
            lat: "29.049246",
            lng: "111.670441",
            speed: "89",
            altitude: "75",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:05.000Z"),
            lat: "29.049246",
            lng: "111.67047",
            speed: "44",
            altitude: "44",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:05.000Z"),
            lat: "29.049246",
            lng: "111.67047",
            speed: "44",
            altitude: "44",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:07.000Z"),
            lat: "29.049246",
            lng: "111.670491",
            speed: "92",
            altitude: "46",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:07.000Z"),
            lat: "29.049246",
            lng: "111.670491",
            speed: "92",
            altitude: "46",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:09.000Z"),
            lat: "29.049246",
            lng: "111.670528",
            speed: "97",
            altitude: "60",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:09.000Z"),
            lat: "29.049246",
            lng: "111.670528",
            speed: "97",
            altitude: "60",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:11.000Z"),
            lat: "29.049246",
            lng: "111.670557",
            speed: "99",
            altitude: "91",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:11.000Z"),
            lat: "29.049246",
            lng: "111.670557",
            speed: "99",
            altitude: "91",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:13.000Z"),
            lat: "29.049246",
            lng: "111.670582",
            speed: "61",
            altitude: "67",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:13.000Z"),
            lat: "29.049246",
            lng: "111.670582",
            speed: "61",
            altitude: "67",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:15.000Z"),
            lat: "29.049235",
            lng: "111.67062",
            speed: "49",
            altitude: "42",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:15.000Z"),
            lat: "29.049235",
            lng: "111.67062",
            speed: "49",
            altitude: "42",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:17.000Z"),
            lat: "29.049235",
            lng: "111.67064",
            speed: "96",
            altitude: "98",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:17.000Z"),
            lat: "29.049235",
            lng: "111.67064",
            speed: "96",
            altitude: "98",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:19.000Z"),
            lat: "29.049224",
            lng: "111.670665",
            speed: "42",
            altitude: "69",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:19.000Z"),
            lat: "29.049224",
            lng: "111.670665",
            speed: "42",
            altitude: "69",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:21.000Z"),
            lat: "29.049207",
            lng: "111.670711",
            speed: "52",
            altitude: "98",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:21.000Z"),
            lat: "29.049207",
            lng: "111.670711",
            speed: "52",
            altitude: "98",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:23.000Z"),
            lat: "29.049195",
            lng: "111.67074",
            speed: "75",
            altitude: "104",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:23.000Z"),
            lat: "29.049195",
            lng: "111.67074",
            speed: "75",
            altitude: "104",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:25.000Z"),
            lat: "29.049195",
            lng: "111.67076",
            speed: "57",
            altitude: "110",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:25.000Z"),
            lat: "29.049195",
            lng: "111.67076",
            speed: "57",
            altitude: "110",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:27.000Z"),
            lat: "29.049181",
            lng: "111.670794",
            speed: "65",
            altitude: "55",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:27.000Z"),
            lat: "29.049181",
            lng: "111.670794",
            speed: "65",
            altitude: "55",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:29.000Z"),
            lat: "29.04917",
            lng: "111.670822",
            speed: "40",
            altitude: "77",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:29.000Z"),
            lat: "29.04917",
            lng: "111.670822",
            speed: "40",
            altitude: "77",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:31.000Z"),
            lat: "29.049162",
            lng: "111.670848",
            speed: "77",
            altitude: "55",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:31.000Z"),
            lat: "29.049162",
            lng: "111.670848",
            speed: "77",
            altitude: "55",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:33.000Z"),
            lat: "29.049133",
            lng: "111.67086",
            speed: "79",
            altitude: "43",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:33.000Z"),
            lat: "29.049133",
            lng: "111.67086",
            speed: "79",
            altitude: "43",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:35.000Z"),
            lat: "29.049108",
            lng: "111.670873",
            speed: "89",
            altitude: "93",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:35.000Z"),
            lat: "29.049108",
            lng: "111.670873",
            speed: "89",
            altitude: "93",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:37.000Z"),
            lat: "29.049097",
            lng: "111.67088",
            speed: "67",
            altitude: "58",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:37.000Z"),
            lat: "29.049097",
            lng: "111.67088",
            speed: "67",
            altitude: "58",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:39.000Z"),
            lat: "29.049086",
            lng: "111.670913",
            speed: "73",
            altitude: "69",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:39.000Z"),
            lat: "29.049086",
            lng: "111.670913",
            speed: "73",
            altitude: "69",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:41.000Z"),
            lat: "29.049086",
            lng: "111.670925",
            speed: "54",
            altitude: "87",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:41.000Z"),
            lat: "29.049086",
            lng: "111.670925",
            speed: "54",
            altitude: "87",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:43.000Z"),
            lat: "29.049075",
            lng: "111.670954",
            speed: "95",
            altitude: "95",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:43.000Z"),
            lat: "29.049075",
            lng: "111.670954",
            speed: "95",
            altitude: "95",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:45.000Z"),
            lat: "29.049061",
            lng: "111.670984",
            speed: "96",
            altitude: "93",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:45.000Z"),
            lat: "29.049061",
            lng: "111.670984",
            speed: "96",
            altitude: "93",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:47.000Z"),
            lat: "29.049036",
            lng: "111.671017",
            speed: "65",
            altitude: "55",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:47.000Z"),
            lat: "29.049036",
            lng: "111.671017",
            speed: "65",
            altitude: "55",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:49.000Z"),
            lat: "29.049017",
            lng: "111.671021",
            speed: "60",
            altitude: "76",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:49.000Z"),
            lat: "29.049017",
            lng: "111.671021",
            speed: "60",
            altitude: "76",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:51.000Z"),
            lat: "29.048988",
            lng: "111.671029",
            speed: "79",
            altitude: "69",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:51.000Z"),
            lat: "29.048988",
            lng: "111.671029",
            speed: "79",
            altitude: "69",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:53.000Z"),
            lat: "29.048959",
            lng: "111.671033",
            speed: "59",
            altitude: "107",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:53.000Z"),
            lat: "29.048959",
            lng: "111.671033",
            speed: "59",
            altitude: "107",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:55.000Z"),
            lat: "29.048912",
            lng: "111.671033",
            speed: "43",
            altitude: "58",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:55.000Z"),
            lat: "29.048912",
            lng: "111.671033",
            speed: "43",
            altitude: "58",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:57.000Z"),
            lat: "29.048883",
            lng: "111.671029",
            speed: "90",
            altitude: "52",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:57.000Z"),
            lat: "29.048883",
            lng: "111.671029",
            speed: "90",
            altitude: "52",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:59.000Z"),
            lat: "29.048854",
            lng: "111.671029",
            speed: "44",
            altitude: "95",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:45:59.000Z"),
            lat: "29.048854",
            lng: "111.671029",
            speed: "44",
            altitude: "95",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:01.000Z"),
            lat: "29.048821",
            lng: "111.671046",
            speed: "84",
            altitude: "58",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:01.000Z"),
            lat: "29.048821",
            lng: "111.671046",
            speed: "84",
            altitude: "58",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:03.000Z"),
            lat: "29.048796",
            lng: "111.671046",
            speed: "95",
            altitude: "106",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:03.000Z"),
            lat: "29.048796",
            lng: "111.671046",
            speed: "95",
            altitude: "106",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:05.000Z"),
            lat: "29.048767",
            lng: "111.671037",
            speed: "45",
            altitude: "107",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:05.000Z"),
            lat: "29.048767",
            lng: "111.671037",
            speed: "45",
            altitude: "107",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:07.000Z"),
            lat: "29.048723",
            lng: "111.671042",
            speed: "51",
            altitude: "80",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:07.000Z"),
            lat: "29.048723",
            lng: "111.671042",
            speed: "51",
            altitude: "80",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:09.000Z"),
            lat: "29.048684",
            lng: "111.671042",
            speed: "47",
            altitude: "85",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:09.000Z"),
            lat: "29.048684",
            lng: "111.671042",
            speed: "47",
            altitude: "85",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:11.000Z"),
            lat: "29.048651",
            lng: "111.671029",
            speed: "43",
            altitude: "88",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:11.000Z"),
            lat: "29.048651",
            lng: "111.671029",
            speed: "43",
            altitude: "88",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:13.000Z"),
            lat: "29.048629",
            lng: "111.671029",
            speed: "69",
            altitude: "63",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:13.000Z"),
            lat: "29.048629",
            lng: "111.671029",
            speed: "69",
            altitude: "63",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:15.000Z"),
            lat: "29.048596",
            lng: "111.671033",
            speed: "45",
            altitude: "43",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:15.000Z"),
            lat: "29.048596",
            lng: "111.671033",
            speed: "45",
            altitude: "43",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:17.000Z"),
            lat: "29.048553",
            lng: "111.671029",
            speed: "40",
            altitude: "53",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:17.000Z"),
            lat: "29.048553",
            lng: "111.671029",
            speed: "40",
            altitude: "53",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:19.000Z"),
            lat: "29.04852",
            lng: "111.67105",
            speed: "76",
            altitude: "60",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:19.000Z"),
            lat: "29.04852",
            lng: "111.67105",
            speed: "76",
            altitude: "60",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:21.000Z"),
            lat: "29.04848",
            lng: "111.671062",
            speed: "86",
            altitude: "100",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:21.000Z"),
            lat: "29.04848",
            lng: "111.671062",
            speed: "86",
            altitude: "100",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:23.000Z"),
            lat: "29.048448",
            lng: "111.671067",
            speed: "50",
            altitude: "77",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:23.000Z"),
            lat: "29.048448",
            lng: "111.671067",
            speed: "50",
            altitude: "77",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:25.000Z"),
            lat: "29.048422",
            lng: "111.671087",
            speed: "40",
            altitude: "102",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:25.000Z"),
            lat: "29.048422",
            lng: "111.671087",
            speed: "40",
            altitude: "102",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:27.000Z"),
            lat: "29.04839",
            lng: "111.671087",
            speed: "65",
            altitude: "51",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:27.000Z"),
            lat: "29.04839",
            lng: "111.671087",
            speed: "65",
            altitude: "51",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:29.000Z"),
            lat: "29.048364",
            lng: "111.671103",
            speed: "96",
            altitude: "45",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:29.000Z"),
            lat: "29.048364",
            lng: "111.671103",
            speed: "96",
            altitude: "45",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:31.000Z"),
            lat: "29.04835",
            lng: "111.671103",
            speed: "78",
            altitude: "105",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:31.000Z"),
            lat: "29.04835",
            lng: "111.671103",
            speed: "78",
            altitude: "105",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:33.000Z"),
            lat: "29.048324",
            lng: "111.671103",
            speed: "54",
            altitude: "93",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:33.000Z"),
            lat: "29.048324",
            lng: "111.671103",
            speed: "54",
            altitude: "93",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:35.000Z"),
            lat: "29.048299",
            lng: "111.671096",
            speed: "77",
            altitude: "54",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:35.000Z"),
            lat: "29.048299",
            lng: "111.671096",
            speed: "77",
            altitude: "54",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:37.000Z"),
            lat: "29.048252",
            lng: "111.671091",
            speed: "74",
            altitude: "48",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:37.000Z"),
            lat: "29.048252",
            lng: "111.671091",
            speed: "74",
            altitude: "48",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:39.000Z"),
            lat: "29.048234",
            lng: "111.6711",
            speed: "80",
            altitude: "53",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:39.000Z"),
            lat: "29.048234",
            lng: "111.6711",
            speed: "80",
            altitude: "53",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:41.000Z"),
            lat: "29.048215",
            lng: "111.6711",
            speed: "43",
            altitude: "108",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:41.000Z"),
            lat: "29.048215",
            lng: "111.6711",
            speed: "43",
            altitude: "108",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:41.000Z"),
            lat: "29.048215",
            lng: "111.6711",
            speed: "43",
            altitude: "108",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:44.000Z"),
            lat: "29.04819",
            lng: "111.671108",
            speed: "40",
            altitude: "84",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:44.000Z"),
            lat: "29.04819",
            lng: "111.671108",
            speed: "40",
            altitude: "84",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:46.000Z"),
            lat: "29.048157",
            lng: "111.671108",
            speed: "62",
            altitude: "79",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:46.000Z"),
            lat: "29.048157",
            lng: "111.671108",
            speed: "62",
            altitude: "79",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:48.000Z"),
            lat: "29.04811",
            lng: "111.671091",
            speed: "70",
            altitude: "89",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:48.000Z"),
            lat: "29.04811",
            lng: "111.671091",
            speed: "70",
            altitude: "89",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:50.000Z"),
            lat: "29.048092",
            lng: "111.671096",
            speed: "67",
            altitude: "66",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:50.000Z"),
            lat: "29.048092",
            lng: "111.671096",
            speed: "67",
            altitude: "66",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:52.000Z"),
            lat: "29.048078",
            lng: "111.671103",
            speed: "85",
            altitude: "56",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:52.000Z"),
            lat: "29.048078",
            lng: "111.671103",
            speed: "85",
            altitude: "56",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:54.000Z"),
            lat: "29.048044",
            lng: "111.671108",
            speed: "54",
            altitude: "98",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:56.000Z"),
            lat: "29.048016",
            lng: "111.67112",
            speed: "70",
            altitude: "59",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:56.000Z"),
            lat: "29.048016",
            lng: "111.67112",
            speed: "70",
            altitude: "59",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:56.000Z"),
            lat: "29.048016",
            lng: "111.67112",
            speed: "70",
            altitude: "59",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:58.000Z"),
            lat: "29.047987",
            lng: "111.67112",
            speed: "52",
            altitude: "59",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:46:58.000Z"),
            lat: "29.047987",
            lng: "111.67112",
            speed: "52",
            altitude: "59",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:00.000Z"),
            lat: "29.047973",
            lng: "111.67112",
            speed: "42",
            altitude: "71",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:00.000Z"),
            lat: "29.047973",
            lng: "111.67112",
            speed: "42",
            altitude: "71",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:02.000Z"),
            lat: "29.047944",
            lng: "111.671116",
            speed: "63",
            altitude: "45",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:02.000Z"),
            lat: "29.047944",
            lng: "111.671116",
            speed: "63",
            altitude: "45",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:04.000Z"),
            lat: "29.047929",
            lng: "111.67112",
            speed: "77",
            altitude: "76",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:04.000Z"),
            lat: "29.047929",
            lng: "111.67112",
            speed: "77",
            altitude: "76",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:06.000Z"),
            lat: "29.047919",
            lng: "111.671128",
            speed: "63",
            altitude: "92",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:06.000Z"),
            lat: "29.047919",
            lng: "111.671128",
            speed: "63",
            altitude: "92",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:08.000Z"),
            lat: "29.047903",
            lng: "111.671128",
            speed: "91",
            altitude: "101",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:08.000Z"),
            lat: "29.047903",
            lng: "111.671128",
            speed: "91",
            altitude: "101",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:10.000Z"),
            lat: "29.047894",
            lng: "111.671125",
            speed: "67",
            altitude: "103",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:10.000Z"),
            lat: "29.047894",
            lng: "111.671125",
            speed: "67",
            altitude: "103",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:12.000Z"),
            lat: "29.047871",
            lng: "111.671128",
            speed: "69",
            altitude: "73",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:12.000Z"),
            lat: "29.047871",
            lng: "111.671128",
            speed: "69",
            altitude: "73",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:14.000Z"),
            lat: "29.047853",
            lng: "111.671128",
            speed: "65",
            altitude: "60",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:14.000Z"),
            lat: "29.047853",
            lng: "111.671128",
            speed: "65",
            altitude: "60",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:16.000Z"),
            lat: "29.047833",
            lng: "111.67114",
            speed: "72",
            altitude: "40",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:16.000Z"),
            lat: "29.047833",
            lng: "111.67114",
            speed: "72",
            altitude: "40",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:18.000Z"),
            lat: "29.047818",
            lng: "111.671141",
            speed: "97",
            altitude: "56",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:18.000Z"),
            lat: "29.047818",
            lng: "111.671141",
            speed: "97",
            altitude: "56",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:20.000Z"),
            lat: "29.047808",
            lng: "111.671151",
            speed: "52",
            altitude: "65",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:20.000Z"),
            lat: "29.047808",
            lng: "111.671151",
            speed: "52",
            altitude: "65",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:22.000Z"),
            lat: "29.047779",
            lng: "111.671161",
            speed: "64",
            altitude: "95",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:22.000Z"),
            lat: "29.047779",
            lng: "111.671161",
            speed: "64",
            altitude: "95",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:24.000Z"),
            lat: "29.047773",
            lng: "111.671162",
            speed: "64",
            altitude: "42",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:24.000Z"),
            lat: "29.047773",
            lng: "111.671162",
            speed: "64",
            altitude: "42",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:26.000Z"),
            lat: "29.047763",
            lng: "111.671167",
            speed: "92",
            altitude: "105",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:26.000Z"),
            lat: "29.047763",
            lng: "111.671167",
            speed: "92",
            altitude: "105",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:28.000Z"),
            lat: "29.047759",
            lng: "111.67117",
            speed: "81",
            altitude: "58",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:28.000Z"),
            lat: "29.047759",
            lng: "111.67117",
            speed: "81",
            altitude: "58",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:30.000Z"),
            lat: "29.047748",
            lng: "111.671172",
            speed: "57",
            altitude: "106",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:30.000Z"),
            lat: "29.047748",
            lng: "111.671172",
            speed: "57",
            altitude: "106",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:32.000Z"),
            lat: "29.047732",
            lng: "111.671182",
            speed: "76",
            altitude: "92",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:32.000Z"),
            lat: "29.047732",
            lng: "111.671182",
            speed: "76",
            altitude: "92",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:34.000Z"),
            lat: "29.047713",
            lng: "111.67119",
            speed: "87",
            altitude: "62",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:34.000Z"),
            lat: "29.047713",
            lng: "111.67119",
            speed: "87",
            altitude: "62",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:36.000Z"),
            lat: "29.047696",
            lng: "111.671197",
            speed: "56",
            altitude: "88",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:36.000Z"),
            lat: "29.047696",
            lng: "111.671197",
            speed: "56",
            altitude: "88",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:38.000Z"),
            lat: "29.047684",
            lng: "111.6712",
            speed: "93",
            altitude: "49",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:38.000Z"),
            lat: "29.047684",
            lng: "111.6712",
            speed: "93",
            altitude: "49",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:40.000Z"),
            lat: "29.047664",
            lng: "111.67121",
            speed: "52",
            altitude: "55",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:40.000Z"),
            lat: "29.047664",
            lng: "111.67121",
            speed: "52",
            altitude: "55",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:42.000Z"),
            lat: "29.047645",
            lng: "111.671219",
            speed: "47",
            altitude: "88",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:42.000Z"),
            lat: "29.047645",
            lng: "111.671219",
            speed: "47",
            altitude: "88",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:44.000Z"),
            lat: "29.047629",
            lng: "111.671228",
            speed: "65",
            altitude: "98",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:44.000Z"),
            lat: "29.047629",
            lng: "111.671228",
            speed: "65",
            altitude: "98",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:46.000Z"),
            lat: "29.047619",
            lng: "111.671228",
            speed: "71",
            altitude: "48",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:46.000Z"),
            lat: "29.047619",
            lng: "111.671228",
            speed: "71",
            altitude: "48",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:48.000Z"),
            lat: "29.047609",
            lng: "111.67123",
            speed: "41",
            altitude: "71",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:48.000Z"),
            lat: "29.047609",
            lng: "111.67123",
            speed: "41",
            altitude: "71",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:50.000Z"),
            lat: "29.047587",
            lng: "111.671251",
            speed: "86",
            altitude: "78",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:50.000Z"),
            lat: "29.047587",
            lng: "111.671251",
            speed: "86",
            altitude: "78",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:52.000Z"),
            lat: "29.047574",
            lng: "111.671258",
            speed: "71",
            altitude: "81",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:52.000Z"),
            lat: "29.047574",
            lng: "111.671258",
            speed: "71",
            altitude: "81",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:54.000Z"),
            lat: "29.047555",
            lng: "111.671271",
            speed: "53",
            altitude: "89",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:54.000Z"),
            lat: "29.047555",
            lng: "111.671271",
            speed: "53",
            altitude: "89",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:56.000Z"),
            lat: "29.047544",
            lng: "111.671281",
            speed: "43",
            altitude: "96",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:56.000Z"),
            lat: "29.047544",
            lng: "111.671281",
            speed: "43",
            altitude: "96",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:58.000Z"),
            lat: "29.047534",
            lng: "111.67129",
            speed: "84",
            altitude: "45",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:47:58.000Z"),
            lat: "29.047534",
            lng: "111.67129",
            speed: "84",
            altitude: "45",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:00.000Z"),
            lat: "29.047524",
            lng: "111.671298",
            speed: "54",
            altitude: "93",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:00.000Z"),
            lat: "29.047524",
            lng: "111.671298",
            speed: "54",
            altitude: "93",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:02.000Z"),
            lat: "29.047509",
            lng: "111.671305",
            speed: "91",
            altitude: "107",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:02.000Z"),
            lat: "29.047509",
            lng: "111.671305",
            speed: "91",
            altitude: "107",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:04.000Z"),
            lat: "29.047492",
            lng: "111.671312",
            speed: "82",
            altitude: "56",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:04.000Z"),
            lat: "29.047492",
            lng: "111.671312",
            speed: "82",
            altitude: "56",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:06.000Z"),
            lat: "29.047479",
            lng: "111.671324",
            speed: "99",
            altitude: "108",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:06.000Z"),
            lat: "29.047479",
            lng: "111.671324",
            speed: "99",
            altitude: "108",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:08.000Z"),
            lat: "29.047469",
            lng: "111.671334",
            speed: "74",
            altitude: "106",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:08.000Z"),
            lat: "29.047469",
            lng: "111.671334",
            speed: "74",
            altitude: "106",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:10.000Z"),
            lat: "29.04746",
            lng: "111.671346",
            speed: "66",
            altitude: "97",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:10.000Z"),
            lat: "29.04746",
            lng: "111.671346",
            speed: "66",
            altitude: "97",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:12.000Z"),
            lat: "29.047453",
            lng: "111.671351",
            speed: "65",
            altitude: "105",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:12.000Z"),
            lat: "29.047453",
            lng: "111.671351",
            speed: "65",
            altitude: "105",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:14.000Z"),
            lat: "29.047434",
            lng: "111.671365",
            speed: "47",
            altitude: "86",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:14.000Z"),
            lat: "29.047434",
            lng: "111.671365",
            speed: "47",
            altitude: "86",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:16.000Z"),
            lat: "29.047428",
            lng: "111.671375",
            speed: "72",
            altitude: "87",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:16.000Z"),
            lat: "29.047428",
            lng: "111.671375",
            speed: "72",
            altitude: "87",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:18.000Z"),
            lat: "29.047414",
            lng: "111.671405",
            speed: "46",
            altitude: "88",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:18.000Z"),
            lat: "29.047414",
            lng: "111.671405",
            speed: "46",
            altitude: "88",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:20.000Z"),
            lat: "29.047407",
            lng: "111.67142",
            speed: "70",
            altitude: "48",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:20.000Z"),
            lat: "29.047407",
            lng: "111.67142",
            speed: "70",
            altitude: "48",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:22.000Z"),
            lat: "29.047403",
            lng: "111.67144",
            speed: "65",
            altitude: "46",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:22.000Z"),
            lat: "29.047403",
            lng: "111.67144",
            speed: "65",
            altitude: "46",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:24.000Z"),
            lat: "29.047394",
            lng: "111.67146",
            speed: "43",
            altitude: "40",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:24.000Z"),
            lat: "29.047394",
            lng: "111.67146",
            speed: "43",
            altitude: "40",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:26.000Z"),
            lat: "29.047382",
            lng: "111.671469",
            speed: "46",
            altitude: "44",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:26.000Z"),
            lat: "29.047382",
            lng: "111.671469",
            speed: "46",
            altitude: "44",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:28.000Z"),
            lat: "29.047367",
            lng: "111.671472",
            speed: "67",
            altitude: "72",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:28.000Z"),
            lat: "29.047367",
            lng: "111.671472",
            speed: "67",
            altitude: "72",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:30.000Z"),
            lat: "29.047354",
            lng: "111.671489",
            speed: "85",
            altitude: "42",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:30.000Z"),
            lat: "29.047354",
            lng: "111.671489",
            speed: "85",
            altitude: "42",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:32.000Z"),
            lat: "29.047344",
            lng: "111.671497",
            speed: "85",
            altitude: "80",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:32.000Z"),
            lat: "29.047344",
            lng: "111.671497",
            speed: "85",
            altitude: "80",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:34.000Z"),
            lat: "29.047332",
            lng: "111.671506",
            speed: "85",
            altitude: "95",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:34.000Z"),
            lat: "29.047332",
            lng: "111.671506",
            speed: "85",
            altitude: "95",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:36.000Z"),
            lat: "29.047322",
            lng: "111.671524",
            speed: "61",
            altitude: "103",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:36.000Z"),
            lat: "29.047322",
            lng: "111.671524",
            speed: "61",
            altitude: "103",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:38.000Z"),
            lat: "29.047316",
            lng: "111.671538",
            speed: "65",
            altitude: "77",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:38.000Z"),
            lat: "29.047316",
            lng: "111.671538",
            speed: "65",
            altitude: "77",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:40.000Z"),
            lat: "29.047298",
            lng: "111.671533",
            speed: "65",
            altitude: "93",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:40.000Z"),
            lat: "29.047298",
            lng: "111.671533",
            speed: "65",
            altitude: "93",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:42.000Z"),
            lat: "29.047288",
            lng: "111.671539",
            speed: "43",
            altitude: "40",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:42.000Z"),
            lat: "29.047288",
            lng: "111.671539",
            speed: "43",
            altitude: "40",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:44.000Z"),
            lat: "29.047269",
            lng: "111.671551",
            speed: "43",
            altitude: "71",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:44.000Z"),
            lat: "29.047269",
            lng: "111.671551",
            speed: "43",
            altitude: "71",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:46.000Z"),
            lat: "29.047269",
            lng: "111.671564",
            speed: "59",
            altitude: "74",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:46.000Z"),
            lat: "29.047269",
            lng: "111.671564",
            speed: "59",
            altitude: "74",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:48.000Z"),
            lat: "29.04726",
            lng: "111.671583",
            speed: "41",
            altitude: "65",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:48.000Z"),
            lat: "29.04726",
            lng: "111.671583",
            speed: "41",
            altitude: "65",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:50.000Z"),
            lat: "29.04726",
            lng: "111.671598",
            speed: "47",
            altitude: "43",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:50.000Z"),
            lat: "29.04726",
            lng: "111.671598",
            speed: "47",
            altitude: "43",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:50.000Z"),
            lat: "29.04726",
            lng: "111.671598",
            speed: "47",
            altitude: "43",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:52.000Z"),
            lat: "29.047247",
            lng: "111.671622",
            speed: "50",
            altitude: "90",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:52.000Z"),
            lat: "29.047247",
            lng: "111.671622",
            speed: "50",
            altitude: "90",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:54.000Z"),
            lat: "29.047241",
            lng: "111.671623",
            speed: "88",
            altitude: "100",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:54.000Z"),
            lat: "29.047241",
            lng: "111.671623",
            speed: "88",
            altitude: "100",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:56.000Z"),
            lat: "29.047225",
            lng: "111.671639",
            speed: "93",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:56.000Z"),
            lat: "29.047225",
            lng: "111.671639",
            speed: "93",
            altitude: "48",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:58.000Z"),
            lat: "29.04721",
            lng: "111.671652",
            speed: "70",
            altitude: "76",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:48:58.000Z"),
            lat: "29.04721",
            lng: "111.671652",
            speed: "70",
            altitude: "76",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:00.000Z"),
            lat: "29.047202",
            lng: "111.671663",
            speed: "79",
            altitude: "67",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:00.000Z"),
            lat: "29.047202",
            lng: "111.671663",
            speed: "79",
            altitude: "67",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:02.000Z"),
            lat: "29.047197",
            lng: "111.671677",
            speed: "94",
            altitude: "91",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:04.000Z"),
            lat: "29.04719",
            lng: "111.671693",
            speed: "44",
            altitude: "84",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:04.000Z"),
            lat: "29.04719",
            lng: "111.671693",
            speed: "44",
            altitude: "84",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:06.000Z"),
            lat: "29.047185",
            lng: "111.671717",
            speed: "91",
            altitude: "65",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:06.000Z"),
            lat: "29.047185",
            lng: "111.671717",
            speed: "91",
            altitude: "65",
            direction: "68"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:08.000Z"),
            lat: "29.047175",
            lng: "111.671731",
            speed: "93",
            altitude: "61",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:08.000Z"),
            lat: "29.047175",
            lng: "111.671731",
            speed: "93",
            altitude: "61",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:10.000Z"),
            lat: "29.047171",
            lng: "111.671752",
            speed: "99",
            altitude: "62",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:10.000Z"),
            lat: "29.047171",
            lng: "111.671752",
            speed: "99",
            altitude: "62",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:10.000Z"),
            lat: "29.047171",
            lng: "111.671752",
            speed: "99",
            altitude: "62",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:12.000Z"),
            lat: "29.047162",
            lng: "111.671774",
            speed: "80",
            altitude: "76",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:12.000Z"),
            lat: "29.047162",
            lng: "111.671774",
            speed: "80",
            altitude: "76",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:14.000Z"),
            lat: "29.047156",
            lng: "111.671796",
            speed: "97",
            altitude: "99",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:14.000Z"),
            lat: "29.047156",
            lng: "111.671796",
            speed: "97",
            altitude: "99",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:16.000Z"),
            lat: "29.047153",
            lng: "111.671807",
            speed: "44",
            altitude: "94",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:16.000Z"),
            lat: "29.047153",
            lng: "111.671807",
            speed: "44",
            altitude: "94",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:18.000Z"),
            lat: "29.04715",
            lng: "111.671819",
            speed: "41",
            altitude: "40",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:18.000Z"),
            lat: "29.04715",
            lng: "111.671819",
            speed: "41",
            altitude: "40",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:20.000Z"),
            lat: "29.047144",
            lng: "111.671843",
            speed: "87",
            altitude: "99",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:20.000Z"),
            lat: "29.047144",
            lng: "111.671843",
            speed: "87",
            altitude: "99",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:22.000Z"),
            lat: "29.047144",
            lng: "111.671855",
            speed: "49",
            altitude: "82",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:22.000Z"),
            lat: "29.047144",
            lng: "111.671855",
            speed: "49",
            altitude: "82",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:24.000Z"),
            lat: "29.047138",
            lng: "111.671868",
            speed: "79",
            altitude: "83",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:24.000Z"),
            lat: "29.047138",
            lng: "111.671868",
            speed: "79",
            altitude: "83",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:26.000Z"),
            lat: "29.047137",
            lng: "111.671887",
            speed: "70",
            altitude: "89",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:26.000Z"),
            lat: "29.047137",
            lng: "111.671887",
            speed: "70",
            altitude: "89",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:28.000Z"),
            lat: "29.047137",
            lng: "111.671907",
            speed: "56",
            altitude: "101",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:28.000Z"),
            lat: "29.047137",
            lng: "111.671907",
            speed: "56",
            altitude: "101",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:30.000Z"),
            lat: "29.047135",
            lng: "111.671942",
            speed: "60",
            altitude: "79",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:30.000Z"),
            lat: "29.047135",
            lng: "111.671942",
            speed: "60",
            altitude: "79",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:32.000Z"),
            lat: "29.047131",
            lng: "111.671971",
            speed: "65",
            altitude: "57",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:32.000Z"),
            lat: "29.047131",
            lng: "111.671971",
            speed: "65",
            altitude: "57",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:34.000Z"),
            lat: "29.047131",
            lng: "111.671999",
            speed: "59",
            altitude: "53",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:34.000Z"),
            lat: "29.047131",
            lng: "111.671999",
            speed: "59",
            altitude: "53",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:36.000Z"),
            lat: "29.047125",
            lng: "111.672025",
            speed: "71",
            altitude: "59",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:36.000Z"),
            lat: "29.047125",
            lng: "111.672025",
            speed: "71",
            altitude: "59",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:38.000Z"),
            lat: "29.047125",
            lng: "111.67204",
            speed: "92",
            altitude: "79",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:38.000Z"),
            lat: "29.047125",
            lng: "111.67204",
            speed: "92",
            altitude: "79",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:40.000Z"),
            lat: "29.047128",
            lng: "111.672074",
            speed: "83",
            altitude: "80",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:40.000Z"),
            lat: "29.047128",
            lng: "111.672074",
            speed: "83",
            altitude: "80",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:42.000Z"),
            lat: "29.047125",
            lng: "111.672098",
            speed: "88",
            altitude: "109",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:42.000Z"),
            lat: "29.047125",
            lng: "111.672098",
            speed: "88",
            altitude: "109",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:44.000Z"),
            lat: "29.047125",
            lng: "111.672123",
            speed: "88",
            altitude: "107",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:44.000Z"),
            lat: "29.047125",
            lng: "111.672123",
            speed: "88",
            altitude: "107",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:46.000Z"),
            lat: "29.047125",
            lng: "111.672148",
            speed: "59",
            altitude: "62",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:46.000Z"),
            lat: "29.047125",
            lng: "111.672148",
            speed: "59",
            altitude: "62",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:49.000Z"),
            lat: "29.047125",
            lng: "111.672172",
            speed: "99",
            altitude: "56",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:49.000Z"),
            lat: "29.047125",
            lng: "111.672172",
            speed: "99",
            altitude: "56",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:51.000Z"),
            lat: "29.047131",
            lng: "111.672196",
            speed: "52",
            altitude: "77",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:51.000Z"),
            lat: "29.047131",
            lng: "111.672196",
            speed: "52",
            altitude: "77",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:53.000Z"),
            lat: "29.047131",
            lng: "111.672211",
            speed: "40",
            altitude: "110",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:53.000Z"),
            lat: "29.047131",
            lng: "111.672211",
            speed: "40",
            altitude: "110",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:55.000Z"),
            lat: "29.047134",
            lng: "111.672233",
            speed: "80",
            altitude: "41",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:55.000Z"),
            lat: "29.047134",
            lng: "111.672233",
            speed: "80",
            altitude: "41",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:57.000Z"),
            lat: "29.047134",
            lng: "111.672257",
            speed: "66",
            altitude: "88",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:57.000Z"),
            lat: "29.047134",
            lng: "111.672257",
            speed: "66",
            altitude: "88",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:59.000Z"),
            lat: "29.047134",
            lng: "111.672275",
            speed: "57",
            altitude: "92",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:49:59.000Z"),
            lat: "29.047134",
            lng: "111.672275",
            speed: "57",
            altitude: "92",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:01.000Z"),
            lat: "29.047134",
            lng: "111.672295",
            speed: "53",
            altitude: "82",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:01.000Z"),
            lat: "29.047134",
            lng: "111.672295",
            speed: "53",
            altitude: "82",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:03.000Z"),
            lat: "29.047134",
            lng: "111.672312",
            speed: "51",
            altitude: "69",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:03.000Z"),
            lat: "29.047134",
            lng: "111.672312",
            speed: "51",
            altitude: "69",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:05.000Z"),
            lat: "29.047134",
            lng: "111.672329",
            speed: "58",
            altitude: "52",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:05.000Z"),
            lat: "29.047134",
            lng: "111.672329",
            speed: "58",
            altitude: "52",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:07.000Z"),
            lat: "29.047134",
            lng: "111.672349",
            speed: "81",
            altitude: "106",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:07.000Z"),
            lat: "29.047134",
            lng: "111.672349",
            speed: "81",
            altitude: "106",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:09.000Z"),
            lat: "29.047134",
            lng: "111.672365",
            speed: "85",
            altitude: "67",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:09.000Z"),
            lat: "29.047134",
            lng: "111.672365",
            speed: "85",
            altitude: "67",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:11.000Z"),
            lat: "29.047141",
            lng: "111.672386",
            speed: "45",
            altitude: "89",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:11.000Z"),
            lat: "29.047141",
            lng: "111.672386",
            speed: "45",
            altitude: "89",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:13.000Z"),
            lat: "29.047146",
            lng: "111.672402",
            speed: "78",
            altitude: "47",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:13.000Z"),
            lat: "29.047146",
            lng: "111.672402",
            speed: "78",
            altitude: "47",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:15.000Z"),
            lat: "29.047151",
            lng: "111.672424",
            speed: "63",
            altitude: "68",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:15.000Z"),
            lat: "29.047151",
            lng: "111.672424",
            speed: "63",
            altitude: "68",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:17.000Z"),
            lat: "29.04716",
            lng: "111.672443",
            speed: "47",
            altitude: "69",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:17.000Z"),
            lat: "29.04716",
            lng: "111.672443",
            speed: "47",
            altitude: "69",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:19.000Z"),
            lat: "29.04716",
            lng: "111.672458",
            speed: "73",
            altitude: "54",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:19.000Z"),
            lat: "29.04716",
            lng: "111.672458",
            speed: "73",
            altitude: "54",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:21.000Z"),
            lat: "29.047163",
            lng: "111.67247",
            speed: "80",
            altitude: "55",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:21.000Z"),
            lat: "29.047163",
            lng: "111.67247",
            speed: "80",
            altitude: "55",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:23.000Z"),
            lat: "29.047163",
            lng: "111.672485",
            speed: "74",
            altitude: "59",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:23.000Z"),
            lat: "29.047163",
            lng: "111.672485",
            speed: "74",
            altitude: "59",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:25.000Z"),
            lat: "29.047166",
            lng: "111.6725",
            speed: "71",
            altitude: "91",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:25.000Z"),
            lat: "29.047166",
            lng: "111.6725",
            speed: "71",
            altitude: "91",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:27.000Z"),
            lat: "29.04717",
            lng: "111.67252",
            speed: "45",
            altitude: "42",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:27.000Z"),
            lat: "29.04717",
            lng: "111.67252",
            speed: "45",
            altitude: "42",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:29.000Z"),
            lat: "29.047171",
            lng: "111.672533",
            speed: "99",
            altitude: "98",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:29.000Z"),
            lat: "29.047171",
            lng: "111.672533",
            speed: "99",
            altitude: "98",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:31.000Z"),
            lat: "29.047175",
            lng: "111.672546",
            speed: "66",
            altitude: "94",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:31.000Z"),
            lat: "29.047175",
            lng: "111.672546",
            speed: "66",
            altitude: "94",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:33.000Z"),
            lat: "29.047177",
            lng: "111.672561",
            speed: "69",
            altitude: "43",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:33.000Z"),
            lat: "29.047177",
            lng: "111.672561",
            speed: "69",
            altitude: "43",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:35.000Z"),
            lat: "29.047181",
            lng: "111.672574",
            speed: "54",
            altitude: "98",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:35.000Z"),
            lat: "29.047181",
            lng: "111.672574",
            speed: "54",
            altitude: "98",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:37.000Z"),
            lat: "29.047182",
            lng: "111.672587",
            speed: "68",
            altitude: "92",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:37.000Z"),
            lat: "29.047182",
            lng: "111.672587",
            speed: "68",
            altitude: "92",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:39.000Z"),
            lat: "29.047187",
            lng: "111.672611",
            speed: "91",
            altitude: "100",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:39.000Z"),
            lat: "29.047187",
            lng: "111.672611",
            speed: "91",
            altitude: "100",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:41.000Z"),
            lat: "29.04719",
            lng: "111.672633",
            speed: "68",
            altitude: "105",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:41.000Z"),
            lat: "29.04719",
            lng: "111.672633",
            speed: "68",
            altitude: "105",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:43.000Z"),
            lat: "29.047202",
            lng: "111.672653",
            speed: "66",
            altitude: "86",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:43.000Z"),
            lat: "29.047202",
            lng: "111.672653",
            speed: "66",
            altitude: "86",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:45.000Z"),
            lat: "29.04721",
            lng: "111.672666",
            speed: "92",
            altitude: "104",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:45.000Z"),
            lat: "29.04721",
            lng: "111.672666",
            speed: "92",
            altitude: "104",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:47.000Z"),
            lat: "29.047221",
            lng: "111.672678",
            speed: "85",
            altitude: "106",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:47.000Z"),
            lat: "29.047221",
            lng: "111.672678",
            speed: "85",
            altitude: "106",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:49.000Z"),
            lat: "29.047229",
            lng: "111.672695",
            speed: "56",
            altitude: "101",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:49.000Z"),
            lat: "29.047229",
            lng: "111.672695",
            speed: "56",
            altitude: "101",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:51.000Z"),
            lat: "29.047241",
            lng: "111.672708",
            speed: "76",
            altitude: "57",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:51.000Z"),
            lat: "29.047241",
            lng: "111.672708",
            speed: "76",
            altitude: "57",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:53.000Z"),
            lat: "29.047249",
            lng: "111.672716",
            speed: "59",
            altitude: "84",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:53.000Z"),
            lat: "29.047249",
            lng: "111.672716",
            speed: "59",
            altitude: "84",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:55.000Z"),
            lat: "29.047275",
            lng: "111.672762",
            speed: "91",
            altitude: "77",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:55.000Z"),
            lat: "29.047275",
            lng: "111.672762",
            speed: "91",
            altitude: "77",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:57.000Z"),
            lat: "29.047281",
            lng: "111.672794",
            speed: "60",
            altitude: "81",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:57.000Z"),
            lat: "29.047281",
            lng: "111.672794",
            speed: "60",
            altitude: "81",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:59.000Z"),
            lat: "29.047284",
            lng: "111.672827",
            speed: "66",
            altitude: "92",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:50:59.000Z"),
            lat: "29.047284",
            lng: "111.672827",
            speed: "66",
            altitude: "92",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:01.000Z"),
            lat: "29.04729",
            lng: "111.672842",
            speed: "85",
            altitude: "101",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:01.000Z"),
            lat: "29.04729",
            lng: "111.672842",
            speed: "85",
            altitude: "101",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:03.000Z"),
            lat: "29.04729",
            lng: "111.672867",
            speed: "92",
            altitude: "97",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:03.000Z"),
            lat: "29.04729",
            lng: "111.672867",
            speed: "92",
            altitude: "97",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:05.000Z"),
            lat: "29.04731",
            lng: "111.672904",
            speed: "92",
            altitude: "69",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:05.000Z"),
            lat: "29.04731",
            lng: "111.672904",
            speed: "92",
            altitude: "69",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:07.000Z"),
            lat: "29.047319",
            lng: "111.672921",
            speed: "67",
            altitude: "90",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:07.000Z"),
            lat: "29.047319",
            lng: "111.672921",
            speed: "67",
            altitude: "90",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:09.000Z"),
            lat: "29.047332",
            lng: "111.672935",
            speed: "60",
            altitude: "96",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:09.000Z"),
            lat: "29.047332",
            lng: "111.672935",
            speed: "60",
            altitude: "96",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:11.000Z"),
            lat: "29.047338",
            lng: "111.67295",
            speed: "57",
            altitude: "54",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:11.000Z"),
            lat: "29.047338",
            lng: "111.67295",
            speed: "57",
            altitude: "54",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:13.000Z"),
            lat: "29.047345",
            lng: "111.672976",
            speed: "49",
            altitude: "82",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:13.000Z"),
            lat: "29.047345",
            lng: "111.672976",
            speed: "49",
            altitude: "82",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:15.000Z"),
            lat: "29.047353",
            lng: "111.67299",
            speed: "40",
            altitude: "109",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:15.000Z"),
            lat: "29.047353",
            lng: "111.67299",
            speed: "40",
            altitude: "109",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:17.000Z"),
            lat: "29.047375",
            lng: "111.673015",
            speed: "78",
            altitude: "80",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:17.000Z"),
            lat: "29.047375",
            lng: "111.673015",
            speed: "78",
            altitude: "80",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:19.000Z"),
            lat: "29.04739",
            lng: "111.673034",
            speed: "70",
            altitude: "71",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:19.000Z"),
            lat: "29.04739",
            lng: "111.673034",
            speed: "70",
            altitude: "71",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:21.000Z"),
            lat: "29.047401",
            lng: "111.673056",
            speed: "83",
            altitude: "109",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:21.000Z"),
            lat: "29.047401",
            lng: "111.673056",
            speed: "83",
            altitude: "109",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:23.000Z"),
            lat: "29.047416",
            lng: "111.673073",
            speed: "65",
            altitude: "108",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:23.000Z"),
            lat: "29.047416",
            lng: "111.673073",
            speed: "65",
            altitude: "108",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:25.000Z"),
            lat: "29.047423",
            lng: "111.673082",
            speed: "59",
            altitude: "102",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:25.000Z"),
            lat: "29.047423",
            lng: "111.673082",
            speed: "59",
            altitude: "102",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:27.000Z"),
            lat: "29.047447",
            lng: "111.673104",
            speed: "55",
            altitude: "104",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:27.000Z"),
            lat: "29.047447",
            lng: "111.673104",
            speed: "55",
            altitude: "104",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:29.000Z"),
            lat: "29.047464",
            lng: "111.673119",
            speed: "59",
            altitude: "105",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:29.000Z"),
            lat: "29.047464",
            lng: "111.673119",
            speed: "59",
            altitude: "105",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:31.000Z"),
            lat: "29.047485",
            lng: "111.673138",
            speed: "70",
            altitude: "65",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:31.000Z"),
            lat: "29.047485",
            lng: "111.673138",
            speed: "70",
            altitude: "65",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:33.000Z"),
            lat: "29.047497",
            lng: "111.673146",
            speed: "68",
            altitude: "94",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:33.000Z"),
            lat: "29.047497",
            lng: "111.673146",
            speed: "68",
            altitude: "94",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:35.000Z"),
            lat: "29.04752",
            lng: "111.673161",
            speed: "56",
            altitude: "43",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:35.000Z"),
            lat: "29.04752",
            lng: "111.673161",
            speed: "56",
            altitude: "43",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:37.000Z"),
            lat: "29.047542",
            lng: "111.673165",
            speed: "78",
            altitude: "101",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:37.000Z"),
            lat: "29.047542",
            lng: "111.673165",
            speed: "78",
            altitude: "101",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:39.000Z"),
            lat: "29.047555",
            lng: "111.673178",
            speed: "92",
            altitude: "47",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:39.000Z"),
            lat: "29.047555",
            lng: "111.673178",
            speed: "92",
            altitude: "47",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:41.000Z"),
            lat: "29.047573",
            lng: "111.673187",
            speed: "55",
            altitude: "96",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:41.000Z"),
            lat: "29.047573",
            lng: "111.673187",
            speed: "55",
            altitude: "96",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:43.000Z"),
            lat: "29.047594",
            lng: "111.673193",
            speed: "46",
            altitude: "80",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:43.000Z"),
            lat: "29.047594",
            lng: "111.673193",
            speed: "46",
            altitude: "80",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:45.000Z"),
            lat: "29.047611",
            lng: "111.673205",
            speed: "91",
            altitude: "104",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:45.000Z"),
            lat: "29.047611",
            lng: "111.673205",
            speed: "91",
            altitude: "104",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:47.000Z"),
            lat: "29.047627",
            lng: "111.673225",
            speed: "60",
            altitude: "90",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:47.000Z"),
            lat: "29.047627",
            lng: "111.673225",
            speed: "60",
            altitude: "90",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:49.000Z"),
            lat: "29.047648",
            lng: "111.673245",
            speed: "95",
            altitude: "53",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:49.000Z"),
            lat: "29.047648",
            lng: "111.673245",
            speed: "95",
            altitude: "53",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:51.000Z"),
            lat: "29.04767",
            lng: "111.673247",
            speed: "50",
            altitude: "76",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:51.000Z"),
            lat: "29.04767",
            lng: "111.673247",
            speed: "50",
            altitude: "76",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:53.000Z"),
            lat: "29.047695",
            lng: "111.673259",
            speed: "44",
            altitude: "49",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:53.000Z"),
            lat: "29.047695",
            lng: "111.673259",
            speed: "44",
            altitude: "49",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:55.000Z"),
            lat: "29.047729",
            lng: "111.673269",
            speed: "90",
            altitude: "98",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:55.000Z"),
            lat: "29.047729",
            lng: "111.673269",
            speed: "90",
            altitude: "98",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:57.000Z"),
            lat: "29.047756",
            lng: "111.67328",
            speed: "62",
            altitude: "97",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:57.000Z"),
            lat: "29.047756",
            lng: "111.67328",
            speed: "62",
            altitude: "97",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:59.000Z"),
            lat: "29.047767",
            lng: "111.673292",
            speed: "77",
            altitude: "45",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:51:59.000Z"),
            lat: "29.047767",
            lng: "111.673292",
            speed: "77",
            altitude: "45",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:01.000Z"),
            lat: "29.047786",
            lng: "111.673298",
            speed: "75",
            altitude: "93",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:01.000Z"),
            lat: "29.047786",
            lng: "111.673298",
            speed: "75",
            altitude: "93",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:03.000Z"),
            lat: "29.047808",
            lng: "111.673302",
            speed: "48",
            altitude: "41",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:03.000Z"),
            lat: "29.047808",
            lng: "111.673302",
            speed: "48",
            altitude: "41",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:05.000Z"),
            lat: "29.04784",
            lng: "111.673306",
            speed: "51",
            altitude: "52",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:05.000Z"),
            lat: "29.04784",
            lng: "111.673306",
            speed: "51",
            altitude: "52",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:07.000Z"),
            lat: "29.047858",
            lng: "111.673318",
            speed: "64",
            altitude: "100",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:07.000Z"),
            lat: "29.047858",
            lng: "111.673318",
            speed: "64",
            altitude: "100",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:09.000Z"),
            lat: "29.047877",
            lng: "111.673322",
            speed: "74",
            altitude: "78",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:09.000Z"),
            lat: "29.047877",
            lng: "111.673322",
            speed: "74",
            altitude: "78",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:11.000Z"),
            lat: "29.047896",
            lng: "111.673332",
            speed: "70",
            altitude: "54",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:11.000Z"),
            lat: "29.047896",
            lng: "111.673332",
            speed: "70",
            altitude: "54",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:13.000Z"),
            lat: "29.047931",
            lng: "111.673337",
            speed: "45",
            altitude: "106",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:13.000Z"),
            lat: "29.047931",
            lng: "111.673337",
            speed: "45",
            altitude: "106",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:15.000Z"),
            lat: "29.047952",
            lng: "111.673342",
            speed: "93",
            altitude: "105",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:15.000Z"),
            lat: "29.047952",
            lng: "111.673342",
            speed: "93",
            altitude: "105",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:15.000Z"),
            lat: "29.047952",
            lng: "111.673342",
            speed: "93",
            altitude: "105",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:17.000Z"),
            lat: "29.047971",
            lng: "111.673342",
            speed: "94",
            altitude: "110",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:17.000Z"),
            lat: "29.047971",
            lng: "111.673342",
            speed: "94",
            altitude: "110",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:19.000Z"),
            lat: "29.048013",
            lng: "111.673342",
            speed: "70",
            altitude: "43",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:19.000Z"),
            lat: "29.048013",
            lng: "111.673342",
            speed: "70",
            altitude: "43",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:21.000Z"),
            lat: "29.048041",
            lng: "111.673337",
            speed: "82",
            altitude: "98",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:21.000Z"),
            lat: "29.048041",
            lng: "111.673337",
            speed: "82",
            altitude: "98",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:23.000Z"),
            lat: "29.048066",
            lng: "111.673337",
            speed: "40",
            altitude: "41",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:23.000Z"),
            lat: "29.048066",
            lng: "111.673337",
            speed: "40",
            altitude: "41",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:25.000Z"),
            lat: "29.048082",
            lng: "111.673337",
            speed: "99",
            altitude: "106",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:25.000Z"),
            lat: "29.048082",
            lng: "111.673337",
            speed: "99",
            altitude: "106",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:27.000Z"),
            lat: "29.04809",
            lng: "111.673337",
            speed: "61",
            altitude: "52",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:27.000Z"),
            lat: "29.04809",
            lng: "111.673337",
            speed: "61",
            altitude: "52",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:29.000Z"),
            lat: "29.048111",
            lng: "111.673337",
            speed: "57",
            altitude: "48",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:29.000Z"),
            lat: "29.048111",
            lng: "111.673337",
            speed: "57",
            altitude: "48",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:31.000Z"),
            lat: "29.048137",
            lng: "111.673343",
            speed: "84",
            altitude: "68",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:31.000Z"),
            lat: "29.048137",
            lng: "111.673343",
            speed: "84",
            altitude: "68",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:33.000Z"),
            lat: "29.048166",
            lng: "111.673343",
            speed: "61",
            altitude: "101",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:33.000Z"),
            lat: "29.048166",
            lng: "111.673343",
            speed: "61",
            altitude: "101",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:35.000Z"),
            lat: "29.048194",
            lng: "111.673347",
            speed: "64",
            altitude: "67",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:35.000Z"),
            lat: "29.048194",
            lng: "111.673347",
            speed: "64",
            altitude: "67",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:37.000Z"),
            lat: "29.048214",
            lng: "111.673347",
            speed: "62",
            altitude: "73",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:37.000Z"),
            lat: "29.048214",
            lng: "111.673347",
            speed: "62",
            altitude: "73",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:39.000Z"),
            lat: "29.048228",
            lng: "111.673343",
            speed: "88",
            altitude: "60",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:39.000Z"),
            lat: "29.048228",
            lng: "111.673343",
            speed: "88",
            altitude: "60",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:41.000Z"),
            lat: "29.04825",
            lng: "111.673341",
            speed: "44",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:41.000Z"),
            lat: "29.04825",
            lng: "111.673341",
            speed: "44",
            altitude: "69",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:43.000Z"),
            lat: "29.048283",
            lng: "111.673342",
            speed: "45",
            altitude: "103",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:43.000Z"),
            lat: "29.048283",
            lng: "111.673342",
            speed: "45",
            altitude: "103",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:45.000Z"),
            lat: "29.048308",
            lng: "111.673345",
            speed: "82",
            altitude: "84",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:45.000Z"),
            lat: "29.048308",
            lng: "111.673345",
            speed: "82",
            altitude: "84",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:47.000Z"),
            lat: "29.048331",
            lng: "111.673341",
            speed: "78",
            altitude: "79",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:47.000Z"),
            lat: "29.048331",
            lng: "111.673341",
            speed: "78",
            altitude: "79",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:49.000Z"),
            lat: "29.048352",
            lng: "111.673341",
            speed: "63",
            altitude: "49",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:49.000Z"),
            lat: "29.048352",
            lng: "111.673341",
            speed: "63",
            altitude: "49",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:51.000Z"),
            lat: "29.048363",
            lng: "111.673342",
            speed: "66",
            altitude: "43",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:51.000Z"),
            lat: "29.048363",
            lng: "111.673342",
            speed: "66",
            altitude: "43",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:53.000Z"),
            lat: "29.048383",
            lng: "111.673343",
            speed: "53",
            altitude: "90",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:53.000Z"),
            lat: "29.048383",
            lng: "111.673343",
            speed: "53",
            altitude: "90",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:55.000Z"),
            lat: "29.048396",
            lng: "111.673343",
            speed: "85",
            altitude: "100",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:55.000Z"),
            lat: "29.048396",
            lng: "111.673343",
            speed: "85",
            altitude: "100",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:57.000Z"),
            lat: "29.048418",
            lng: "111.673343",
            speed: "68",
            altitude: "55",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:57.000Z"),
            lat: "29.048418",
            lng: "111.673343",
            speed: "68",
            altitude: "55",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:59.000Z"),
            lat: "29.048433",
            lng: "111.673345",
            speed: "49",
            altitude: "55",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:52:59.000Z"),
            lat: "29.048433",
            lng: "111.673345",
            speed: "49",
            altitude: "55",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:01.000Z"),
            lat: "29.048454",
            lng: "111.673343",
            speed: "50",
            altitude: "44",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:01.000Z"),
            lat: "29.048454",
            lng: "111.673343",
            speed: "50",
            altitude: "44",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:03.000Z"),
            lat: "29.048474",
            lng: "111.67335",
            speed: "94",
            altitude: "102",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:03.000Z"),
            lat: "29.048474",
            lng: "111.67335",
            speed: "94",
            altitude: "102",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:05.000Z"),
            lat: "29.048489",
            lng: "111.673351",
            speed: "83",
            altitude: "91",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:05.000Z"),
            lat: "29.048489",
            lng: "111.673351",
            speed: "83",
            altitude: "91",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:07.000Z"),
            lat: "29.048504",
            lng: "111.673351",
            speed: "77",
            altitude: "59",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:07.000Z"),
            lat: "29.048504",
            lng: "111.673351",
            speed: "77",
            altitude: "59",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:09.000Z"),
            lat: "29.048525",
            lng: "111.67335",
            speed: "95",
            altitude: "64",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:09.000Z"),
            lat: "29.048525",
            lng: "111.67335",
            speed: "95",
            altitude: "64",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:11.000Z"),
            lat: "29.048545",
            lng: "111.673343",
            speed: "90",
            altitude: "80",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:11.000Z"),
            lat: "29.048545",
            lng: "111.673343",
            speed: "90",
            altitude: "80",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:13.000Z"),
            lat: "29.048563",
            lng: "111.673342",
            speed: "77",
            altitude: "79",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:13.000Z"),
            lat: "29.048563",
            lng: "111.673342",
            speed: "77",
            altitude: "79",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:15.000Z"),
            lat: "29.048587",
            lng: "111.673342",
            speed: "46",
            altitude: "102",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:15.000Z"),
            lat: "29.048587",
            lng: "111.673342",
            speed: "46",
            altitude: "102",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:17.000Z"),
            lat: "29.048603",
            lng: "111.673347",
            speed: "84",
            altitude: "41",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:17.000Z"),
            lat: "29.048603",
            lng: "111.673347",
            speed: "84",
            altitude: "41",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:19.000Z"),
            lat: "29.048623",
            lng: "111.67335",
            speed: "44",
            altitude: "95",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:19.000Z"),
            lat: "29.048623",
            lng: "111.67335",
            speed: "44",
            altitude: "95",
            direction: "77"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:21.000Z"),
            lat: "29.048644",
            lng: "111.673345",
            speed: "67",
            altitude: "94",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:21.000Z"),
            lat: "29.048644",
            lng: "111.673345",
            speed: "67",
            altitude: "94",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:24.000Z"),
            lat: "29.048659",
            lng: "111.673345",
            speed: "67",
            altitude: "79",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:24.000Z"),
            lat: "29.048659",
            lng: "111.673345",
            speed: "67",
            altitude: "79",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:26.000Z"),
            lat: "29.048679",
            lng: "111.673343",
            speed: "57",
            altitude: "65",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:26.000Z"),
            lat: "29.048679",
            lng: "111.673343",
            speed: "57",
            altitude: "65",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:28.000Z"),
            lat: "29.048706",
            lng: "111.67335",
            speed: "88",
            altitude: "72",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:28.000Z"),
            lat: "29.048706",
            lng: "111.67335",
            speed: "88",
            altitude: "72",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:30.000Z"),
            lat: "29.048732",
            lng: "111.67336",
            speed: "57",
            altitude: "58",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:30.000Z"),
            lat: "29.048732",
            lng: "111.67336",
            speed: "57",
            altitude: "58",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:32.000Z"),
            lat: "29.048746",
            lng: "111.673366",
            speed: "98",
            altitude: "56",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:32.000Z"),
            lat: "29.048746",
            lng: "111.673366",
            speed: "98",
            altitude: "56",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:34.000Z"),
            lat: "29.048761",
            lng: "111.673372",
            speed: "88",
            altitude: "61",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:34.000Z"),
            lat: "29.048761",
            lng: "111.673372",
            speed: "88",
            altitude: "61",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:36.000Z"),
            lat: "29.048778",
            lng: "111.673378",
            speed: "67",
            altitude: "60",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:36.000Z"),
            lat: "29.048778",
            lng: "111.673378",
            speed: "67",
            altitude: "60",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:38.000Z"),
            lat: "29.04879",
            lng: "111.673391",
            speed: "72",
            altitude: "85",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:38.000Z"),
            lat: "29.04879",
            lng: "111.673391",
            speed: "72",
            altitude: "85",
            direction: "101"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:40.000Z"),
            lat: "29.048808",
            lng: "111.673395",
            speed: "42",
            altitude: "64",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:40.000Z"),
            lat: "29.048808",
            lng: "111.673395",
            speed: "42",
            altitude: "64",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:42.000Z"),
            lat: "29.048828",
            lng: "111.673395",
            speed: "60",
            altitude: "66",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:42.000Z"),
            lat: "29.048828",
            lng: "111.673395",
            speed: "60",
            altitude: "66",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:44.000Z"),
            lat: "29.048837",
            lng: "111.673382",
            speed: "54",
            altitude: "94",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:44.000Z"),
            lat: "29.048837",
            lng: "111.673382",
            speed: "54",
            altitude: "94",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:46.000Z"),
            lat: "29.048853",
            lng: "111.673382",
            speed: "96",
            altitude: "98",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:46.000Z"),
            lat: "29.048853",
            lng: "111.673382",
            speed: "96",
            altitude: "98",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:48.000Z"),
            lat: "29.048865",
            lng: "111.673381",
            speed: "86",
            altitude: "100",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:48.000Z"),
            lat: "29.048865",
            lng: "111.673381",
            speed: "86",
            altitude: "100",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:50.000Z"),
            lat: "29.048879",
            lng: "111.67338",
            speed: "75",
            altitude: "63",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:50.000Z"),
            lat: "29.048879",
            lng: "111.67338",
            speed: "75",
            altitude: "63",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:52.000Z"),
            lat: "29.048897",
            lng: "111.673372",
            speed: "95",
            altitude: "50",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:52.000Z"),
            lat: "29.048897",
            lng: "111.673372",
            speed: "95",
            altitude: "50",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:54.000Z"),
            lat: "29.048912",
            lng: "111.673376",
            speed: "67",
            altitude: "51",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:54.000Z"),
            lat: "29.048912",
            lng: "111.673376",
            speed: "67",
            altitude: "51",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:56.000Z"),
            lat: "29.04893",
            lng: "111.673376",
            speed: "41",
            altitude: "48",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:56.000Z"),
            lat: "29.04893",
            lng: "111.673376",
            speed: "41",
            altitude: "48",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:58.000Z"),
            lat: "29.048947",
            lng: "111.673378",
            speed: "41",
            altitude: "80",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:53:58.000Z"),
            lat: "29.048947",
            lng: "111.673378",
            speed: "41",
            altitude: "80",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:00.000Z"),
            lat: "29.048962",
            lng: "111.673376",
            speed: "80",
            altitude: "84",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:00.000Z"),
            lat: "29.048962",
            lng: "111.673376",
            speed: "80",
            altitude: "84",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:02.000Z"),
            lat: "29.048978",
            lng: "111.673372",
            speed: "80",
            altitude: "66",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:02.000Z"),
            lat: "29.048978",
            lng: "111.673372",
            speed: "80",
            altitude: "66",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:04.000Z"),
            lat: "29.048997",
            lng: "111.67337",
            speed: "54",
            altitude: "56",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:04.000Z"),
            lat: "29.048997",
            lng: "111.67337",
            speed: "54",
            altitude: "56",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:06.000Z"),
            lat: "29.049018",
            lng: "111.673372",
            speed: "61",
            altitude: "88",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:06.000Z"),
            lat: "29.049018",
            lng: "111.673372",
            speed: "61",
            altitude: "88",
            direction: "52"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:08.000Z"),
            lat: "29.049032",
            lng: "111.673366",
            speed: "93",
            altitude: "60",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:08.000Z"),
            lat: "29.049032",
            lng: "111.673366",
            speed: "93",
            altitude: "60",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:10.000Z"),
            lat: "29.049057",
            lng: "111.673357",
            speed: "40",
            altitude: "61",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:10.000Z"),
            lat: "29.049057",
            lng: "111.673357",
            speed: "40",
            altitude: "61",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:12.000Z"),
            lat: "29.04908",
            lng: "111.673361",
            speed: "53",
            altitude: "69",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:12.000Z"),
            lat: "29.04908",
            lng: "111.673361",
            speed: "53",
            altitude: "69",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:14.000Z"),
            lat: "29.049099",
            lng: "111.673352",
            speed: "77",
            altitude: "48",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:14.000Z"),
            lat: "29.049099",
            lng: "111.673352",
            speed: "77",
            altitude: "48",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:16.000Z"),
            lat: "29.049117",
            lng: "111.673351",
            speed: "74",
            altitude: "66",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:16.000Z"),
            lat: "29.049117",
            lng: "111.673351",
            speed: "74",
            altitude: "66",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:18.000Z"),
            lat: "29.049127",
            lng: "111.673347",
            speed: "67",
            altitude: "57",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:18.000Z"),
            lat: "29.049127",
            lng: "111.673347",
            speed: "67",
            altitude: "57",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:20.000Z"),
            lat: "29.049137",
            lng: "111.673346",
            speed: "54",
            altitude: "88",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:20.000Z"),
            lat: "29.049137",
            lng: "111.673346",
            speed: "54",
            altitude: "88",
            direction: "61"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:22.000Z"),
            lat: "29.049147",
            lng: "111.673343",
            speed: "88",
            altitude: "107",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:22.000Z"),
            lat: "29.049147",
            lng: "111.673343",
            speed: "88",
            altitude: "107",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:24.000Z"),
            lat: "29.049172",
            lng: "111.673333",
            speed: "94",
            altitude: "89",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:24.000Z"),
            lat: "29.049172",
            lng: "111.673333",
            speed: "94",
            altitude: "89",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:26.000Z"),
            lat: "29.049182",
            lng: "111.673331",
            speed: "54",
            altitude: "109",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:26.000Z"),
            lat: "29.049182",
            lng: "111.673331",
            speed: "54",
            altitude: "109",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:28.000Z"),
            lat: "29.049202",
            lng: "111.673321",
            speed: "86",
            altitude: "78",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:28.000Z"),
            lat: "29.049202",
            lng: "111.673321",
            speed: "86",
            altitude: "78",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:30.000Z"),
            lat: "29.049212",
            lng: "111.673316",
            speed: "84",
            altitude: "40",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:30.000Z"),
            lat: "29.049212",
            lng: "111.673316",
            speed: "84",
            altitude: "40",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:32.000Z"),
            lat: "29.049222",
            lng: "111.673306",
            speed: "91",
            altitude: "47",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:32.000Z"),
            lat: "29.049222",
            lng: "111.673306",
            speed: "91",
            altitude: "47",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:34.000Z"),
            lat: "29.049231",
            lng: "111.673283",
            speed: "52",
            altitude: "43",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:34.000Z"),
            lat: "29.049231",
            lng: "111.673283",
            speed: "52",
            altitude: "43",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:36.000Z"),
            lat: "29.04925",
            lng: "111.673271",
            speed: "47",
            altitude: "76",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:36.000Z"),
            lat: "29.04925",
            lng: "111.673271",
            speed: "47",
            altitude: "76",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:38.000Z"),
            lat: "29.049252",
            lng: "111.67326",
            speed: "55",
            altitude: "106",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:38.000Z"),
            lat: "29.049252",
            lng: "111.67326",
            speed: "55",
            altitude: "106",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:40.000Z"),
            lat: "29.049265",
            lng: "111.673243",
            speed: "91",
            altitude: "40",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:40.000Z"),
            lat: "29.049265",
            lng: "111.673243",
            speed: "91",
            altitude: "40",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:42.000Z"),
            lat: "29.049269",
            lng: "111.673224",
            speed: "80",
            altitude: "58",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:42.000Z"),
            lat: "29.049269",
            lng: "111.673224",
            speed: "80",
            altitude: "58",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:44.000Z"),
            lat: "29.049278",
            lng: "111.673214",
            speed: "63",
            altitude: "55",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:44.000Z"),
            lat: "29.049278",
            lng: "111.673214",
            speed: "63",
            altitude: "55",
            direction: "67"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:46.000Z"),
            lat: "29.049288",
            lng: "111.673192",
            speed: "58",
            altitude: "51",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:46.000Z"),
            lat: "29.049288",
            lng: "111.673192",
            speed: "58",
            altitude: "51",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:48.000Z"),
            lat: "29.049308",
            lng: "111.67316",
            speed: "76",
            altitude: "105",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:48.000Z"),
            lat: "29.049308",
            lng: "111.67316",
            speed: "76",
            altitude: "105",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:50.000Z"),
            lat: "29.049318",
            lng: "111.673137",
            speed: "61",
            altitude: "103",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:50.000Z"),
            lat: "29.049318",
            lng: "111.673137",
            speed: "61",
            altitude: "103",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:52.000Z"),
            lat: "29.049331",
            lng: "111.673112",
            speed: "70",
            altitude: "46",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:52.000Z"),
            lat: "29.049331",
            lng: "111.673112",
            speed: "70",
            altitude: "46",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:54.000Z"),
            lat: "29.049344",
            lng: "111.673096",
            speed: "76",
            altitude: "49",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:54.000Z"),
            lat: "29.049344",
            lng: "111.673096",
            speed: "76",
            altitude: "49",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:56.000Z"),
            lat: "29.049352",
            lng: "111.673069",
            speed: "71",
            altitude: "50",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:56.000Z"),
            lat: "29.049352",
            lng: "111.673069",
            speed: "71",
            altitude: "50",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:58.000Z"),
            lat: "29.049364",
            lng: "111.673047",
            speed: "49",
            altitude: "74",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:54:58.000Z"),
            lat: "29.049364",
            lng: "111.673047",
            speed: "49",
            altitude: "74",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:00.000Z"),
            lat: "29.04939",
            lng: "111.673024",
            speed: "53",
            altitude: "61",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:00.000Z"),
            lat: "29.04939",
            lng: "111.673024",
            speed: "53",
            altitude: "61",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:02.000Z"),
            lat: "29.049398",
            lng: "111.673012",
            speed: "62",
            altitude: "89",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:02.000Z"),
            lat: "29.049398",
            lng: "111.673012",
            speed: "62",
            altitude: "89",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:04.000Z"),
            lat: "29.049403",
            lng: "111.672989",
            speed: "91",
            altitude: "68",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:04.000Z"),
            lat: "29.049403",
            lng: "111.672989",
            speed: "91",
            altitude: "68",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:06.000Z"),
            lat: "29.049415",
            lng: "111.672971",
            speed: "73",
            altitude: "86",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:06.000Z"),
            lat: "29.049415",
            lng: "111.672971",
            speed: "73",
            altitude: "86",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:08.000Z"),
            lat: "29.049418",
            lng: "111.672949",
            speed: "96",
            altitude: "103",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:08.000Z"),
            lat: "29.049418",
            lng: "111.672949",
            speed: "96",
            altitude: "103",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:10.000Z"),
            lat: "29.049425",
            lng: "111.672936",
            speed: "74",
            altitude: "48",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:10.000Z"),
            lat: "29.049425",
            lng: "111.672936",
            speed: "74",
            altitude: "48",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:12.000Z"),
            lat: "29.049439",
            lng: "111.672925",
            speed: "59",
            altitude: "47",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:12.000Z"),
            lat: "29.049439",
            lng: "111.672925",
            speed: "59",
            altitude: "47",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:14.000Z"),
            lat: "29.049444",
            lng: "111.672916",
            speed: "64",
            altitude: "107",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:14.000Z"),
            lat: "29.049444",
            lng: "111.672916",
            speed: "64",
            altitude: "107",
            direction: "109"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:16.000Z"),
            lat: "29.049455",
            lng: "111.672905",
            speed: "90",
            altitude: "76",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:16.000Z"),
            lat: "29.049455",
            lng: "111.672905",
            speed: "90",
            altitude: "76",
            direction: "45"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:18.000Z"),
            lat: "29.04946",
            lng: "111.672897",
            speed: "61",
            altitude: "40",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:18.000Z"),
            lat: "29.04946",
            lng: "111.672897",
            speed: "61",
            altitude: "40",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:20.000Z"),
            lat: "29.049471",
            lng: "111.672885",
            speed: "55",
            altitude: "56",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:20.000Z"),
            lat: "29.049471",
            lng: "111.672885",
            speed: "55",
            altitude: "56",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:22.000Z"),
            lat: "29.049478",
            lng: "111.672881",
            speed: "64",
            altitude: "97",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:22.000Z"),
            lat: "29.049478",
            lng: "111.672881",
            speed: "64",
            altitude: "97",
            direction: "64"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:24.000Z"),
            lat: "29.049485",
            lng: "111.67287",
            speed: "95",
            altitude: "59",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:24.000Z"),
            lat: "29.049485",
            lng: "111.67287",
            speed: "95",
            altitude: "59",
            direction: "90"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:26.000Z"),
            lat: "29.049499",
            lng: "111.672854",
            speed: "76",
            altitude: "87",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:26.000Z"),
            lat: "29.049499",
            lng: "111.672854",
            speed: "76",
            altitude: "87",
            direction: "63"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:28.000Z"),
            lat: "29.049512",
            lng: "111.672842",
            speed: "43",
            altitude: "61",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:28.000Z"),
            lat: "29.049512",
            lng: "111.672842",
            speed: "43",
            altitude: "61",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:30.000Z"),
            lat: "29.04952",
            lng: "111.672834",
            speed: "94",
            altitude: "81",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:30.000Z"),
            lat: "29.04952",
            lng: "111.672834",
            speed: "94",
            altitude: "81",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:32.000Z"),
            lat: "29.049533",
            lng: "111.672817",
            speed: "73",
            altitude: "80",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:32.000Z"),
            lat: "29.049533",
            lng: "111.672817",
            speed: "73",
            altitude: "80",
            direction: "100"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:34.000Z"),
            lat: "29.049544",
            lng: "111.672811",
            speed: "53",
            altitude: "75",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:34.000Z"),
            lat: "29.049544",
            lng: "111.672811",
            speed: "53",
            altitude: "75",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:36.000Z"),
            lat: "29.049554",
            lng: "111.672799",
            speed: "71",
            altitude: "47",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:36.000Z"),
            lat: "29.049554",
            lng: "111.672799",
            speed: "71",
            altitude: "47",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:38.000Z"),
            lat: "29.049566",
            lng: "111.672791",
            speed: "83",
            altitude: "46",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:38.000Z"),
            lat: "29.049566",
            lng: "111.672791",
            speed: "83",
            altitude: "46",
            direction: "66"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:40.000Z"),
            lat: "29.049582",
            lng: "111.672776",
            speed: "93",
            altitude: "55",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:40.000Z"),
            lat: "29.049582",
            lng: "111.672776",
            speed: "93",
            altitude: "55",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:42.000Z"),
            lat: "29.049592",
            lng: "111.672766",
            speed: "77",
            altitude: "72",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:42.000Z"),
            lat: "29.049592",
            lng: "111.672766",
            speed: "77",
            altitude: "72",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:44.000Z"),
            lat: "29.049598",
            lng: "111.672759",
            speed: "55",
            altitude: "76",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:44.000Z"),
            lat: "29.049598",
            lng: "111.672759",
            speed: "55",
            altitude: "76",
            direction: "62"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:46.000Z"),
            lat: "29.049617",
            lng: "111.672739",
            speed: "95",
            altitude: "51",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:46.000Z"),
            lat: "29.049617",
            lng: "111.672739",
            speed: "95",
            altitude: "51",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:48.000Z"),
            lat: "29.049632",
            lng: "111.672724",
            speed: "100",
            altitude: "100",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:48.000Z"),
            lat: "29.049632",
            lng: "111.672724",
            speed: "100",
            altitude: "100",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:48.000Z"),
            lat: "29.049632",
            lng: "111.672724",
            speed: "100",
            altitude: "100",
            direction: "65"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:50.000Z"),
            lat: "29.049641",
            lng: "111.672711",
            speed: "59",
            altitude: "94",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:50.000Z"),
            lat: "29.049641",
            lng: "111.672711",
            speed: "59",
            altitude: "94",
            direction: "58"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:52.000Z"),
            lat: "29.049649",
            lng: "111.672701",
            speed: "89",
            altitude: "43",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:52.000Z"),
            lat: "29.049649",
            lng: "111.672701",
            speed: "89",
            altitude: "43",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:54.000Z"),
            lat: "29.049654",
            lng: "111.672686",
            speed: "85",
            altitude: "95",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:54.000Z"),
            lat: "29.049654",
            lng: "111.672686",
            speed: "85",
            altitude: "95",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:56.000Z"),
            lat: "29.049666",
            lng: "111.672672",
            speed: "84",
            altitude: "55",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:56.000Z"),
            lat: "29.049666",
            lng: "111.672672",
            speed: "84",
            altitude: "55",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:58.000Z"),
            lat: "29.049674",
            lng: "111.672659",
            speed: "71",
            altitude: "50",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:55:58.000Z"),
            lat: "29.049674",
            lng: "111.672659",
            speed: "71",
            altitude: "50",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:00.000Z"),
            lat: "29.049687",
            lng: "111.672652",
            speed: "42",
            altitude: "45",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:00.000Z"),
            lat: "29.049687",
            lng: "111.672652",
            speed: "42",
            altitude: "45",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:02.000Z"),
            lat: "29.049692",
            lng: "111.672647",
            speed: "79",
            altitude: "94",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:02.000Z"),
            lat: "29.049692",
            lng: "111.672647",
            speed: "79",
            altitude: "94",
            direction: "79"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:04.000Z"),
            lat: "29.049701",
            lng: "111.672642",
            speed: "69",
            altitude: "106",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:04.000Z"),
            lat: "29.049701",
            lng: "111.672642",
            speed: "69",
            altitude: "106",
            direction: "69"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:06.000Z"),
            lat: "29.049707",
            lng: "111.672631",
            speed: "41",
            altitude: "88",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:06.000Z"),
            lat: "29.049707",
            lng: "111.672631",
            speed: "41",
            altitude: "88",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:08.000Z"),
            lat: "29.04972",
            lng: "111.672618",
            speed: "58",
            altitude: "100",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:08.000Z"),
            lat: "29.04972",
            lng: "111.672618",
            speed: "58",
            altitude: "100",
            direction: "91"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:10.000Z"),
            lat: "29.049731",
            lng: "111.672587",
            speed: "71",
            altitude: "75",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:10.000Z"),
            lat: "29.049731",
            lng: "111.672587",
            speed: "71",
            altitude: "75",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:12.000Z"),
            lat: "29.049741",
            lng: "111.672578",
            speed: "41",
            altitude: "45",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:12.000Z"),
            lat: "29.049741",
            lng: "111.672578",
            speed: "41",
            altitude: "45",
            direction: "89"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:14.000Z"),
            lat: "29.049751",
            lng: "111.672558",
            speed: "56",
            altitude: "40",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:14.000Z"),
            lat: "29.049751",
            lng: "111.672558",
            speed: "56",
            altitude: "40",
            direction: "84"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:16.000Z"),
            lat: "29.049758",
            lng: "111.672551",
            speed: "90",
            altitude: "66",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:16.000Z"),
            lat: "29.049758",
            lng: "111.672551",
            speed: "90",
            altitude: "66",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:18.000Z"),
            lat: "29.049764",
            lng: "111.672542",
            speed: "77",
            altitude: "59",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:18.000Z"),
            lat: "29.049764",
            lng: "111.672542",
            speed: "77",
            altitude: "59",
            direction: "98"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:20.000Z"),
            lat: "29.049774",
            lng: "111.672539",
            speed: "63",
            altitude: "94",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:20.000Z"),
            lat: "29.049774",
            lng: "111.672539",
            speed: "63",
            altitude: "94",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:22.000Z"),
            lat: "29.049792",
            lng: "111.672529",
            speed: "93",
            altitude: "83",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:22.000Z"),
            lat: "29.049792",
            lng: "111.672529",
            speed: "93",
            altitude: "83",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:24.000Z"),
            lat: "29.049804",
            lng: "111.672523",
            speed: "91",
            altitude: "61",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:24.000Z"),
            lat: "29.049804",
            lng: "111.672523",
            speed: "91",
            altitude: "61",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:26.000Z"),
            lat: "29.049813",
            lng: "111.672516",
            speed: "56",
            altitude: "91",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:26.000Z"),
            lat: "29.049813",
            lng: "111.672516",
            speed: "56",
            altitude: "91",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:28.000Z"),
            lat: "29.049836",
            lng: "111.672489",
            speed: "89",
            altitude: "101",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:28.000Z"),
            lat: "29.049836",
            lng: "111.672489",
            speed: "89",
            altitude: "101",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:30.000Z"),
            lat: "29.049842",
            lng: "111.672476",
            speed: "40",
            altitude: "46",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:30.000Z"),
            lat: "29.049842",
            lng: "111.672476",
            speed: "40",
            altitude: "46",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:32.000Z"),
            lat: "29.049842",
            lng: "111.672469",
            speed: "46",
            altitude: "53",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:32.000Z"),
            lat: "29.049842",
            lng: "111.672469",
            speed: "46",
            altitude: "53",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:34.000Z"),
            lat: "29.049846",
            lng: "111.672444",
            speed: "40",
            altitude: "56",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:34.000Z"),
            lat: "29.049846",
            lng: "111.672444",
            speed: "40",
            altitude: "56",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:36.000Z"),
            lat: "29.049846",
            lng: "111.672431",
            speed: "85",
            altitude: "69",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:36.000Z"),
            lat: "29.049846",
            lng: "111.672431",
            speed: "85",
            altitude: "69",
            direction: "44"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:38.000Z"),
            lat: "29.049852",
            lng: "111.672415",
            speed: "53",
            altitude: "61",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:38.000Z"),
            lat: "29.049852",
            lng: "111.672415",
            speed: "53",
            altitude: "61",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:40.000Z"),
            lat: "29.049861",
            lng: "111.672394",
            speed: "47",
            altitude: "54",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:40.000Z"),
            lat: "29.049861",
            lng: "111.672394",
            speed: "47",
            altitude: "54",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:42.000Z"),
            lat: "29.049856",
            lng: "111.672371",
            speed: "70",
            altitude: "54",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:42.000Z"),
            lat: "29.049856",
            lng: "111.672371",
            speed: "70",
            altitude: "54",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:44.000Z"),
            lat: "29.049855",
            lng: "111.672355",
            speed: "67",
            altitude: "103",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:44.000Z"),
            lat: "29.049855",
            lng: "111.672355",
            speed: "67",
            altitude: "103",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:47.000Z"),
            lat: "29.049851",
            lng: "111.672341",
            speed: "44",
            altitude: "47",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:47.000Z"),
            lat: "29.049851",
            lng: "111.672341",
            speed: "44",
            altitude: "47",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:49.000Z"),
            lat: "29.049841",
            lng: "111.672307",
            speed: "91",
            altitude: "97",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:49.000Z"),
            lat: "29.049841",
            lng: "111.672307",
            speed: "91",
            altitude: "97",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:51.000Z"),
            lat: "29.049841",
            lng: "111.672293",
            speed: "50",
            altitude: "42",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:51.000Z"),
            lat: "29.049841",
            lng: "111.672293",
            speed: "50",
            altitude: "42",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:53.000Z"),
            lat: "29.049834",
            lng: "111.672277",
            speed: "87",
            altitude: "65",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:53.000Z"),
            lat: "29.049834",
            lng: "111.672277",
            speed: "87",
            altitude: "65",
            direction: "78"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:55.000Z"),
            lat: "29.049832",
            lng: "111.672261",
            speed: "80",
            altitude: "66",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:55.000Z"),
            lat: "29.049832",
            lng: "111.672261",
            speed: "80",
            altitude: "66",
            direction: "54"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:57.000Z"),
            lat: "29.049828",
            lng: "111.672248",
            speed: "67",
            altitude: "96",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:57.000Z"),
            lat: "29.049828",
            lng: "111.672248",
            speed: "67",
            altitude: "96",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:59.000Z"),
            lat: "29.049827",
            lng: "111.672226",
            speed: "54",
            altitude: "43",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:56:59.000Z"),
            lat: "29.049827",
            lng: "111.672226",
            speed: "54",
            altitude: "43",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:01.000Z"),
            lat: "29.049827",
            lng: "111.672213",
            speed: "98",
            altitude: "110",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:01.000Z"),
            lat: "29.049827",
            lng: "111.672213",
            speed: "98",
            altitude: "110",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:03.000Z"),
            lat: "29.049823",
            lng: "111.672196",
            speed: "66",
            altitude: "79",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:03.000Z"),
            lat: "29.049823",
            lng: "111.672196",
            speed: "66",
            altitude: "79",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:05.000Z"),
            lat: "29.049817",
            lng: "111.672177",
            speed: "46",
            altitude: "101",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:05.000Z"),
            lat: "29.049817",
            lng: "111.672177",
            speed: "46",
            altitude: "101",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:07.000Z"),
            lat: "29.049812",
            lng: "111.672167",
            speed: "100",
            altitude: "102",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:07.000Z"),
            lat: "29.049812",
            lng: "111.672167",
            speed: "100",
            altitude: "102",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:09.000Z"),
            lat: "29.049807",
            lng: "111.672122",
            speed: "95",
            altitude: "54",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:09.000Z"),
            lat: "29.049807",
            lng: "111.672122",
            speed: "95",
            altitude: "54",
            direction: "94"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:11.000Z"),
            lat: "29.04982",
            lng: "111.67211",
            speed: "75",
            altitude: "102",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:11.000Z"),
            lat: "29.04982",
            lng: "111.67211",
            speed: "75",
            altitude: "102",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:13.000Z"),
            lat: "29.049832",
            lng: "111.672072",
            speed: "76",
            altitude: "63",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:13.000Z"),
            lat: "29.049832",
            lng: "111.672072",
            speed: "76",
            altitude: "63",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:15.000Z"),
            lat: "29.049845",
            lng: "111.672044",
            speed: "76",
            altitude: "57",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:15.000Z"),
            lat: "29.049845",
            lng: "111.672044",
            speed: "76",
            altitude: "57",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:17.000Z"),
            lat: "29.049845",
            lng: "111.672025",
            speed: "57",
            altitude: "74",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:17.000Z"),
            lat: "29.049845",
            lng: "111.672025",
            speed: "57",
            altitude: "74",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:19.000Z"),
            lat: "29.04984",
            lng: "111.671998",
            speed: "46",
            altitude: "104",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:19.000Z"),
            lat: "29.04984",
            lng: "111.671998",
            speed: "46",
            altitude: "104",
            direction: "59"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:21.000Z"),
            lat: "29.04984",
            lng: "111.671989",
            speed: "91",
            altitude: "102",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:21.000Z"),
            lat: "29.04984",
            lng: "111.671989",
            speed: "91",
            altitude: "102",
            direction: "104"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:23.000Z"),
            lat: "29.049828",
            lng: "111.671985",
            speed: "81",
            altitude: "65",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:23.000Z"),
            lat: "29.049828",
            lng: "111.671985",
            speed: "81",
            altitude: "65",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:25.000Z"),
            lat: "29.049816",
            lng: "111.67198",
            speed: "84",
            altitude: "64",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:25.000Z"),
            lat: "29.049816",
            lng: "111.67198",
            speed: "84",
            altitude: "64",
            direction: "99"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:27.000Z"),
            lat: "29.049793",
            lng: "111.671962",
            speed: "74",
            altitude: "65",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:27.000Z"),
            lat: "29.049793",
            lng: "111.671962",
            speed: "74",
            altitude: "65",
            direction: "105"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:29.000Z"),
            lat: "29.049792",
            lng: "111.671954",
            speed: "98",
            altitude: "59",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:29.000Z"),
            lat: "29.049792",
            lng: "111.671954",
            speed: "98",
            altitude: "59",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:31.000Z"),
            lat: "29.049791",
            lng: "111.671942",
            speed: "42",
            altitude: "96",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:31.000Z"),
            lat: "29.049791",
            lng: "111.671942",
            speed: "42",
            altitude: "96",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:33.000Z"),
            lat: "29.049782",
            lng: "111.67193",
            speed: "51",
            altitude: "102",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:33.000Z"),
            lat: "29.049782",
            lng: "111.67193",
            speed: "51",
            altitude: "102",
            direction: "72"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:35.000Z"),
            lat: "29.049772",
            lng: "111.67192",
            speed: "85",
            altitude: "81",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:35.000Z"),
            lat: "29.049772",
            lng: "111.67192",
            speed: "85",
            altitude: "81",
            direction: "42"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:37.000Z"),
            lat: "29.049766",
            lng: "111.671915",
            speed: "49",
            altitude: "66",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:37.000Z"),
            lat: "29.049766",
            lng: "111.671915",
            speed: "49",
            altitude: "66",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:39.000Z"),
            lat: "29.049746",
            lng: "111.671905",
            speed: "47",
            altitude: "53",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:39.000Z"),
            lat: "29.049746",
            lng: "111.671905",
            speed: "47",
            altitude: "53",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:41.000Z"),
            lat: "29.049725",
            lng: "111.671893",
            speed: "53",
            altitude: "43",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:41.000Z"),
            lat: "29.049725",
            lng: "111.671893",
            speed: "53",
            altitude: "43",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:43.000Z"),
            lat: "29.049714",
            lng: "111.671871",
            speed: "78",
            altitude: "57",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:43.000Z"),
            lat: "29.049714",
            lng: "111.671871",
            speed: "78",
            altitude: "57",
            direction: "86"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:45.000Z"),
            lat: "29.049695",
            lng: "111.67185",
            speed: "86",
            altitude: "90",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:45.000Z"),
            lat: "29.049695",
            lng: "111.67185",
            speed: "86",
            altitude: "90",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:47.000Z"),
            lat: "29.049676",
            lng: "111.671828",
            speed: "62",
            altitude: "101",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:47.000Z"),
            lat: "29.049676",
            lng: "111.671828",
            speed: "62",
            altitude: "101",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:49.000Z"),
            lat: "29.049649",
            lng: "111.671816",
            speed: "46",
            altitude: "108",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:49.000Z"),
            lat: "29.049649",
            lng: "111.671816",
            speed: "46",
            altitude: "108",
            direction: "96"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:51.000Z"),
            lat: "29.049617",
            lng: "111.671782",
            speed: "72",
            altitude: "82",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:51.000Z"),
            lat: "29.049617",
            lng: "111.671782",
            speed: "72",
            altitude: "82",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:53.000Z"),
            lat: "29.049606",
            lng: "111.671766",
            speed: "55",
            altitude: "86",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:53.000Z"),
            lat: "29.049606",
            lng: "111.671766",
            speed: "55",
            altitude: "86",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:55.000Z"),
            lat: "29.049587",
            lng: "111.671745",
            speed: "47",
            altitude: "49",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:55.000Z"),
            lat: "29.049587",
            lng: "111.671745",
            speed: "47",
            altitude: "49",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:57.000Z"),
            lat: "29.049574",
            lng: "111.671731",
            speed: "99",
            altitude: "79",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:57.000Z"),
            lat: "29.049574",
            lng: "111.671731",
            speed: "99",
            altitude: "79",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:59.000Z"),
            lat: "29.049541",
            lng: "111.671711",
            speed: "76",
            altitude: "72",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:57:59.000Z"),
            lat: "29.049541",
            lng: "111.671711",
            speed: "76",
            altitude: "72",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:01.000Z"),
            lat: "29.04952",
            lng: "111.671682",
            speed: "85",
            altitude: "110",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:01.000Z"),
            lat: "29.04952",
            lng: "111.671682",
            speed: "85",
            altitude: "110",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:03.000Z"),
            lat: "29.049512",
            lng: "111.671679",
            speed: "67",
            altitude: "77",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:03.000Z"),
            lat: "29.049512",
            lng: "111.671679",
            speed: "67",
            altitude: "77",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:05.000Z"),
            lat: "29.049495",
            lng: "111.671666",
            speed: "51",
            altitude: "54",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:05.000Z"),
            lat: "29.049495",
            lng: "111.671666",
            speed: "51",
            altitude: "54",
            direction: "110"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:07.000Z"),
            lat: "29.049492",
            lng: "111.671663",
            speed: "42",
            altitude: "40",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:07.000Z"),
            lat: "29.049492",
            lng: "111.671663",
            speed: "42",
            altitude: "40",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:09.000Z"),
            lat: "29.049477",
            lng: "111.671647",
            speed: "85",
            altitude: "70",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:09.000Z"),
            lat: "29.049477",
            lng: "111.671647",
            speed: "85",
            altitude: "70",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:11.000Z"),
            lat: "29.049467",
            lng: "111.671637",
            speed: "68",
            altitude: "110",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:11.000Z"),
            lat: "29.049467",
            lng: "111.671637",
            speed: "68",
            altitude: "110",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:13.000Z"),
            lat: "29.049459",
            lng: "111.671632",
            speed: "84",
            altitude: "82",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:13.000Z"),
            lat: "29.049459",
            lng: "111.671632",
            speed: "84",
            altitude: "82",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:15.000Z"),
            lat: "29.049452",
            lng: "111.671625",
            speed: "92",
            altitude: "98",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:15.000Z"),
            lat: "29.049452",
            lng: "111.671625",
            speed: "92",
            altitude: "98",
            direction: "93"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:17.000Z"),
            lat: "29.04944",
            lng: "111.671607",
            speed: "57",
            altitude: "79",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:17.000Z"),
            lat: "29.04944",
            lng: "111.671607",
            speed: "57",
            altitude: "79",
            direction: "49"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:19.000Z"),
            lat: "29.049432",
            lng: "111.671596",
            speed: "88",
            altitude: "89",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:19.000Z"),
            lat: "29.049432",
            lng: "111.671596",
            speed: "88",
            altitude: "89",
            direction: "48"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:21.000Z"),
            lat: "29.049419",
            lng: "111.671587",
            speed: "63",
            altitude: "93",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:21.000Z"),
            lat: "29.049419",
            lng: "111.671587",
            speed: "63",
            altitude: "93",
            direction: "51"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:23.000Z"),
            lat: "29.049391",
            lng: "111.671567",
            speed: "47",
            altitude: "102",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:23.000Z"),
            lat: "29.049391",
            lng: "111.671567",
            speed: "47",
            altitude: "102",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:25.000Z"),
            lat: "29.049381",
            lng: "111.671558",
            speed: "40",
            altitude: "48",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:25.000Z"),
            lat: "29.049381",
            lng: "111.671558",
            speed: "40",
            altitude: "48",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:27.000Z"),
            lat: "29.049364",
            lng: "111.671551",
            speed: "73",
            altitude: "44",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:27.000Z"),
            lat: "29.049364",
            lng: "111.671551",
            speed: "73",
            altitude: "44",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:29.000Z"),
            lat: "29.04935",
            lng: "111.671524",
            speed: "86",
            altitude: "54",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:29.000Z"),
            lat: "29.04935",
            lng: "111.671524",
            speed: "86",
            altitude: "54",
            direction: "102"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:31.000Z"),
            lat: "29.049345",
            lng: "111.671503",
            speed: "77",
            altitude: "74",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:31.000Z"),
            lat: "29.049345",
            lng: "111.671503",
            speed: "77",
            altitude: "74",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:33.000Z"),
            lat: "29.049338",
            lng: "111.671497",
            speed: "76",
            altitude: "73",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:33.000Z"),
            lat: "29.049338",
            lng: "111.671497",
            speed: "76",
            altitude: "73",
            direction: "85"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:35.000Z"),
            lat: "29.049326",
            lng: "111.671486",
            speed: "100",
            altitude: "87",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:35.000Z"),
            lat: "29.049326",
            lng: "111.671486",
            speed: "100",
            altitude: "87",
            direction: "75"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:37.000Z"),
            lat: "29.04931",
            lng: "111.671465",
            speed: "70",
            altitude: "61",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:37.000Z"),
            lat: "29.04931",
            lng: "111.671465",
            speed: "70",
            altitude: "61",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:39.000Z"),
            lat: "29.049293",
            lng: "111.671443",
            speed: "100",
            altitude: "64",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:39.000Z"),
            lat: "29.049293",
            lng: "111.671443",
            speed: "100",
            altitude: "64",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:41.000Z"),
            lat: "29.049281",
            lng: "111.671429",
            speed: "60",
            altitude: "55",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:41.000Z"),
            lat: "29.049281",
            lng: "111.671429",
            speed: "60",
            altitude: "55",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:43.000Z"),
            lat: "29.049273",
            lng: "111.671403",
            speed: "88",
            altitude: "57",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:43.000Z"),
            lat: "29.049273",
            lng: "111.671403",
            speed: "88",
            altitude: "57",
            direction: "50"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:45.000Z"),
            lat: "29.04926",
            lng: "111.671374",
            speed: "100",
            altitude: "88",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:45.000Z"),
            lat: "29.04926",
            lng: "111.671374",
            speed: "100",
            altitude: "88",
            direction: "108"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:47.000Z"),
            lat: "29.049253",
            lng: "111.671356",
            speed: "73",
            altitude: "83",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:47.000Z"),
            lat: "29.049253",
            lng: "111.671356",
            speed: "73",
            altitude: "83",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:49.000Z"),
            lat: "29.049258",
            lng: "111.67134",
            speed: "42",
            altitude: "87",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:49.000Z"),
            lat: "29.049258",
            lng: "111.67134",
            speed: "42",
            altitude: "87",
            direction: "76"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:51.000Z"),
            lat: "29.049254",
            lng: "111.671313",
            speed: "46",
            altitude: "50",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:51.000Z"),
            lat: "29.049254",
            lng: "111.671313",
            speed: "46",
            altitude: "50",
            direction: "107"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:53.000Z"),
            lat: "29.049245",
            lng: "111.671291",
            speed: "91",
            altitude: "73",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:53.000Z"),
            lat: "29.049245",
            lng: "111.671291",
            speed: "91",
            altitude: "73",
            direction: "41"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:55.000Z"),
            lat: "29.049239",
            lng: "111.671255",
            speed: "64",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:55.000Z"),
            lat: "29.049239",
            lng: "111.671255",
            speed: "64",
            altitude: "69",
            direction: "40"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:57.000Z"),
            lat: "29.049238",
            lng: "111.671233",
            speed: "41",
            altitude: "70",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:57.000Z"),
            lat: "29.049238",
            lng: "111.671233",
            speed: "41",
            altitude: "70",
            direction: "82"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:59.000Z"),
            lat: "29.049235",
            lng: "111.671223",
            speed: "92",
            altitude: "85",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:58:59.000Z"),
            lat: "29.049235",
            lng: "111.671223",
            speed: "92",
            altitude: "85",
            direction: "95"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:01.000Z"),
            lat: "29.049234",
            lng: "111.671206",
            speed: "89",
            altitude: "106",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:01.000Z"),
            lat: "29.049234",
            lng: "111.671206",
            speed: "89",
            altitude: "106",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:03.000Z"),
            lat: "29.049231",
            lng: "111.671195",
            speed: "81",
            altitude: "96",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:03.000Z"),
            lat: "29.049231",
            lng: "111.671195",
            speed: "81",
            altitude: "96",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:05.000Z"),
            lat: "29.049227",
            lng: "111.671187",
            speed: "71",
            altitude: "104",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:05.000Z"),
            lat: "29.049227",
            lng: "111.671187",
            speed: "71",
            altitude: "104",
            direction: "83"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:07.000Z"),
            lat: "29.049218",
            lng: "111.671166",
            speed: "88",
            altitude: "97",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:07.000Z"),
            lat: "29.049218",
            lng: "111.671166",
            speed: "88",
            altitude: "97",
            direction: "73"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:09.000Z"),
            lat: "29.049218",
            lng: "111.671161",
            speed: "54",
            altitude: "62",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:09.000Z"),
            lat: "29.049218",
            lng: "111.671161",
            speed: "54",
            altitude: "62",
            direction: "47"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:11.000Z"),
            lat: "29.049214",
            lng: "111.671147",
            speed: "99",
            altitude: "78",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:11.000Z"),
            lat: "29.049214",
            lng: "111.671147",
            speed: "99",
            altitude: "78",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:13.000Z"),
            lat: "29.049214",
            lng: "111.671136",
            speed: "98",
            altitude: "107",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:13.000Z"),
            lat: "29.049214",
            lng: "111.671136",
            speed: "98",
            altitude: "107",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:15.000Z"),
            lat: "29.049215",
            lng: "111.671115",
            speed: "98",
            altitude: "68",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:15.000Z"),
            lat: "29.049215",
            lng: "111.671115",
            speed: "98",
            altitude: "68",
            direction: "56"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:17.000Z"),
            lat: "29.049211",
            lng: "111.671076",
            speed: "40",
            altitude: "44",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:17.000Z"),
            lat: "29.049211",
            lng: "111.671076",
            speed: "40",
            altitude: "44",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:19.000Z"),
            lat: "29.049217",
            lng: "111.670985",
            speed: "47",
            altitude: "42",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:19.000Z"),
            lat: "29.049217",
            lng: "111.670985",
            speed: "47",
            altitude: "42",
            direction: "60"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:21.000Z"),
            lat: "29.049227",
            lng: "111.670918",
            speed: "77",
            altitude: "104",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:21.000Z"),
            lat: "29.049227",
            lng: "111.670918",
            speed: "77",
            altitude: "104",
            direction: "103"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:23.000Z"),
            lat: "29.049233",
            lng: "111.670872",
            speed: "95",
            altitude: "103",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:23.000Z"),
            lat: "29.049233",
            lng: "111.670872",
            speed: "95",
            altitude: "103",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:25.000Z"),
            lat: "29.04924",
            lng: "111.670835",
            speed: "68",
            altitude: "43",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:25.000Z"),
            lat: "29.04924",
            lng: "111.670835",
            speed: "68",
            altitude: "43",
            direction: "55"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:27.000Z"),
            lat: "29.049247",
            lng: "111.670808",
            speed: "65",
            altitude: "94",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:27.000Z"),
            lat: "29.049247",
            lng: "111.670808",
            speed: "65",
            altitude: "94",
            direction: "53"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:29.000Z"),
            lat: "29.049251",
            lng: "111.670716",
            speed: "89",
            altitude: "59",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:29.000Z"),
            lat: "29.049251",
            lng: "111.670716",
            speed: "89",
            altitude: "59",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:31.000Z"),
            lat: "29.049253",
            lng: "111.670701",
            speed: "93",
            altitude: "108",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:31.000Z"),
            lat: "29.049253",
            lng: "111.670701",
            speed: "93",
            altitude: "108",
            direction: "87"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:33.000Z"),
            lat: "29.049258",
            lng: "111.670674",
            speed: "62",
            altitude: "50",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:33.000Z"),
            lat: "29.049258",
            lng: "111.670674",
            speed: "62",
            altitude: "50",
            direction: "46"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:35.000Z"),
            lat: "29.049262",
            lng: "111.670654",
            speed: "71",
            altitude: "44",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:35.000Z"),
            lat: "29.049262",
            lng: "111.670654",
            speed: "71",
            altitude: "44",
            direction: "70"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:37.000Z"),
            lat: "29.049269",
            lng: "111.670624",
            speed: "89",
            altitude: "76",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:37.000Z"),
            lat: "29.049269",
            lng: "111.670624",
            speed: "89",
            altitude: "76",
            direction: "106"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:39.000Z"),
            lat: "29.049271",
            lng: "111.670585",
            speed: "77",
            altitude: "43",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:39.000Z"),
            lat: "29.049271",
            lng: "111.670585",
            speed: "77",
            altitude: "43",
            direction: "71"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:41.000Z"),
            lat: "29.049274",
            lng: "111.670568",
            speed: "96",
            altitude: "50",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:41.000Z"),
            lat: "29.049274",
            lng: "111.670568",
            speed: "96",
            altitude: "50",
            direction: "43"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:43.000Z"),
            lat: "29.049274",
            lng: "111.670542",
            speed: "70",
            altitude: "61",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:43.000Z"),
            lat: "29.049274",
            lng: "111.670542",
            speed: "70",
            altitude: "61",
            direction: "81"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:45.000Z"),
            lat: "29.04928",
            lng: "111.670518",
            speed: "76",
            altitude: "62",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:45.000Z"),
            lat: "29.04928",
            lng: "111.670518",
            speed: "76",
            altitude: "62",
            direction: "88"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:47.000Z"),
            lat: "29.04928",
            lng: "111.670501",
            speed: "54",
            altitude: "97",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:47.000Z"),
            lat: "29.04928",
            lng: "111.670501",
            speed: "54",
            altitude: "97",
            direction: "57"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:49.000Z"),
            lat: "29.049284",
            lng: "111.670474",
            speed: "72",
            altitude: "73",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:49.000Z"),
            lat: "29.049284",
            lng: "111.670474",
            speed: "72",
            altitude: "73",
            direction: "97"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:51.000Z"),
            lat: "29.049283",
            lng: "111.670444",
            speed: "100",
            altitude: "45",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:51.000Z"),
            lat: "29.049283",
            lng: "111.670444",
            speed: "100",
            altitude: "45",
            direction: "74"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:53.000Z"),
            lat: "29.049283",
            lng: "111.67041",
            speed: "55",
            altitude: "92",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:53.000Z"),
            lat: "29.049283",
            lng: "111.67041",
            speed: "55",
            altitude: "92",
            direction: "92"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:55.000Z"),
            lat: "29.049286",
            lng: "111.670371",
            speed: "82",
            altitude: "71",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:55.000Z"),
            lat: "29.049286",
            lng: "111.670371",
            speed: "82",
            altitude: "71",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:55.000Z"),
            lat: "29.049286",
            lng: "111.670371",
            speed: "82",
            altitude: "71",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:55.000Z"),
            lat: "29.049286",
            lng: "111.670371",
            speed: "82",
            altitude: "71",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:55.000Z"),
            lat: "29.049286",
            lng: "111.670371",
            speed: "82",
            altitude: "71",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:55.000Z"),
            lat: "29.049286",
            lng: "111.670371",
            speed: "82",
            altitude: "71",
            direction: "80"
        },
        {
            dateTime: ISODate("2023-04-01T05:59:55.000Z"),
            lat: "29.049286",
            lng: "111.670371",
            speed: "82",
            altitude: "71",
            direction: "80"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-04-01T06:00:22.915Z"),
    _class: "com.zzk.system.domain.fly.HistoryPath"
} ]);

// ----------------------------
// Collection structure for planPath
// ----------------------------
db.getCollection("planPath").drop();
db.createCollection("planPath");

// ----------------------------
// Documents of planPath
// ----------------------------
db.getCollection("planPath").insert([ {
    _id: ObjectId("642abf42294b8367a6e9dbd0"),
    droneObjectId: ObjectId("64148971538ba54e4ee0c487"),
    planName: "白马湖",
    path: [
        {
            lat: "29.049235",
            lng: "111.670291"
        },
        {
            lat: "29.049235",
            lng: "111.670565"
        },
        {
            lat: "29.049235",
            lng: "111.670804"
        },
        {
            lat: "29.049187",
            lng: "111.671186"
        },
        {
            lat: "29.049026",
            lng: "111.671152"
        },
        {
            lat: "29.048751",
            lng: "111.671111"
        },
        {
            lat: "29.048596",
            lng: "111.671077"
        },
        {
            lat: "29.048428",
            lng: "111.671056"
        },
        {
            lat: "29.048184",
            lng: "111.671125"
        },
        {
            lat: "29.047963",
            lng: "111.671125"
        },
        {
            lat: "29.047831",
            lng: "111.671104"
        },
        {
            lat: "29.047706",
            lng: "111.6712"
        },
        {
            lat: "29.047449",
            lng: "111.671336"
        },
        {
            lat: "29.04733",
            lng: "111.671555"
        },
        {
            lat: "29.047192",
            lng: "111.671787"
        },
        {
            lat: "29.047144",
            lng: "111.672067"
        },
        {
            lat: "29.047073",
            lng: "111.672395"
        },
        {
            lat: "29.047115",
            lng: "111.672641"
        },
        {
            lat: "29.047198",
            lng: "111.672914"
        },
        {
            lat: "29.047348",
            lng: "111.673099"
        },
        {
            lat: "29.047527",
            lng: "111.673215"
        },
        {
            lat: "29.047892",
            lng: "111.673365"
        },
        {
            lat: "29.048275",
            lng: "111.673454"
        },
        {
            lat: "29.048645",
            lng: "111.673454"
        },
        {
            lat: "29.048991",
            lng: "111.67344"
        },
        {
            lat: "29.049373",
            lng: "111.673399"
        },
        {
            lat: "29.049475",
            lng: "111.672976"
        },
        {
            lat: "29.049684",
            lng: "111.672812"
        },
        {
            lat: "29.049941",
            lng: "111.672648"
        },
        {
            lat: "29.049994",
            lng: "111.672429"
        },
        {
            lat: "29.049977",
            lng: "111.672143"
        },
        {
            lat: "29.049941",
            lng: "111.671897"
        },
        {
            lat: "29.049756",
            lng: "111.671733"
        },
        {
            lat: "29.04966",
            lng: "111.671596"
        },
        {
            lat: "29.049571",
            lng: "111.671487"
        },
        {
            lat: "29.049475",
            lng: "111.671323"
        },
        {
            lat: "29.04935",
            lng: "111.671234"
        },
        {
            lat: "29.049361",
            lng: "111.670974"
        },
        {
            lat: "29.049332",
            lng: "111.670729"
        },
        {
            lat: "29.049356",
            lng: "111.670442"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-04-03T11:57:54.073Z"),
    _class: "com.zzk.system.domain.fly.PlanPath"
} ]);
db.getCollection("planPath").insert([ {
    _id: ObjectId("642abfb3294b8367a6e9dbd1"),
    droneObjectId: ObjectId("6423d499e3c3c804c8cc6c5a"),
    planName: "湖南文理",
    path: [
        {
            lat: "29.053588",
            lng: "111.667773"
        },
        {
            lat: "29.051954",
            lng: "111.667619"
        },
        {
            lat: "29.049667",
            lng: "111.667557"
        },
        {
            lat: "29.0482",
            lng: "111.667665"
        },
        {
            lat: "29.046908",
            lng: "111.667696"
        },
        {
            lat: "29.04633",
            lng: "111.667819"
        },
        {
            lat: "29.046208",
            lng: "111.670405"
        },
        {
            lat: "29.046316",
            lng: "111.672898"
        },
        {
            lat: "29.046397",
            lng: "111.675684"
        },
        {
            lat: "29.049034",
            lng: "111.675607"
        },
        {
            lat: "29.050918",
            lng: "111.675299"
        },
        {
            lat: "29.051927",
            lng: "111.675238"
        },
        {
            lat: "29.053272",
            lng: "111.675192"
        },
        {
            lat: "29.053811",
            lng: "111.675176"
        },
        {
            lat: "29.05377",
            lng: "111.671636"
        },
        {
            lat: "29.053784",
            lng: "111.670235"
        },
        {
            lat: "29.05373",
            lng: "111.668681"
        },
        {
            lat: "29.053824",
            lng: "111.66825"
        },
        {
            lat: "29.053716",
            lng: "111.667942"
        }
    ],
    userId: "1",
    username: "admin",
    createdAt: ISODate("2023-04-03T11:59:47.465Z"),
    _class: "com.zzk.system.domain.fly.PlanPath"
} ]);
