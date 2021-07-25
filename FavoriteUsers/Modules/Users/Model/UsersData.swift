let usersData = #"""
{
  "data": [
    {
      "name": {
        "title": "Mr",
        "first": "Nikolai",
        "last": "Skavhaug"
      },
      "location": {
        "street": {
          "number": 9852,
          "name": "Røatoppen"
        },
        "city": "Hareid",
        "state": "Akershus",
        "country": "Norway",
        "postcode": "0125",
        "coordinates": {
          "latitude": "55.0942",
          "longitude": "-116.8376"
        },
        "timezone": {
          "offset": "+1:00",
          "description": "Brussels, Copenhagen, Madrid, Paris"
        }
      },
      "email": "nikolai.skavhaug@example.com",
      "dob": {
        "date": "1963-11-08T06:48:32.229Z",
        "age": 58
      },
      "phone": "20335909",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/87.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/87.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/87.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Lucas",
        "last": "Gill"
      },
      "location": {
        "street": {
          "number": 7784,
          "name": "Bay Ave"
        },
        "city": "Sutton",
        "state": "Newfoundland and Labrador",
        "country": "Canada",
        "postcode": "N2Q 2P0",
        "coordinates": {
          "latitude": "-20.5636",
          "longitude": "-72.6691"
        },
        "timezone": {
          "offset": "+8:00",
          "description": "Beijing, Perth, Singapore, Hong Kong"
        }
      },
      "email": "lucas.gill@example.com",
      "dob": {
        "date": "1986-12-05T18:51:55.062Z",
        "age": 35
      },
      "phone": "505-931-7584",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/21.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/21.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/21.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Jasper",
        "last": "Taylor"
      },
      "location": {
        "street": {
          "number": 3125,
          "name": "Wairere Drive"
        },
        "city": "Napier",
        "state": "Hawke'S Bay",
        "country": "New Zealand",
        "postcode": 16676,
        "coordinates": {
          "latitude": "-51.3630",
          "longitude": "9.9045"
        },
        "timezone": {
          "offset": "-1:00",
          "description": "Azores, Cape Verde Islands"
        }
      },
      "email": "jasper.taylor@example.com",
      "dob": {
        "date": "1974-05-10T07:50:18.195Z",
        "age": 47
      },
      "phone": "(815)-168-8581",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/85.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/85.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/85.jpg"
      }
    },
    {
      "name": {
        "title": "Miss",
        "first": "زهرا",
        "last": "موسوی"
      },
      "location": {
        "street": {
          "number": 7692,
          "name": "امیرکبیر"
        },
        "city": "کرج",
        "state": "کرمانشاه",
        "country": "Iran",
        "postcode": 17496,
        "coordinates": {
          "latitude": "81.0492",
          "longitude": "-10.0834"
        },
        "timezone": {
          "offset": "+4:30",
          "description": "Kabul"
        }
      },
      "email": "zhr.mwswy@example.com",
      "dob": {
        "date": "1952-07-15T23:36:20.200Z",
        "age": 69
      },
      "phone": "092-20923718",
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/3.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/3.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/3.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Blake",
        "last": "Martinez"
      },
      "location": {
        "street": {
          "number": 720,
          "name": "The Crescent"
        },
        "city": "Ennis",
        "state": "Laois",
        "country": "Ireland",
        "postcode": 84257,
        "coordinates": {
          "latitude": "35.3001",
          "longitude": "-39.6272"
        },
        "timezone": {
          "offset": "-4:00",
          "description": "Atlantic Time (Canada), Caracas, La Paz"
        }
      },
      "email": "blake.martinez@example.com",
      "dob": {
        "date": "1979-11-07T13:37:33.650Z",
        "age": 42
      },
      "phone": "041-017-5139",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/47.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/47.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/47.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "اميرحسين",
        "last": "سلطانی نژاد"
      },
      "location": {
        "street": {
          "number": 4041,
          "name": "شهید رحمانی"
        },
        "city": "مشهد",
        "state": "یزد",
        "country": "Iran",
        "postcode": 62194,
        "coordinates": {
          "latitude": "-45.3439",
          "longitude": "-94.3330"
        },
        "timezone": {
          "offset": "-7:00",
          "description": "Mountain Time (US & Canada)"
        }
      },
      "email": "myrhsyn.sltnynjd@example.com",
      "dob": {
        "date": "1950-01-25T12:03:33.160Z",
        "age": 71
      },
      "phone": "086-57867270",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/95.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/95.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/95.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Salvador",
        "last": "Caballero"
      },
      "location": {
        "street": {
          "number": 6155,
          "name": "Calle Nebrija"
        },
        "city": "Málaga",
        "state": "Navarra",
        "country": "Spain",
        "postcode": 90439,
        "coordinates": {
          "latitude": "85.8629",
          "longitude": "-27.3558"
        },
        "timezone": {
          "offset": "+9:00",
          "description": "Tokyo, Seoul, Osaka, Sapporo, Yakutsk"
        }
      },
      "email": "salvador.caballero@example.com",
      "dob": {
        "date": "1952-10-17T09:20:27.302Z",
        "age": 69
      },
      "phone": "912-633-369",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/99.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/99.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/99.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Andy",
        "last": "Fisher"
      },
      "location": {
        "street": {
          "number": 5862,
          "name": "The Avenue"
        },
        "city": "Enniscorthy",
        "state": "Carlow",
        "country": "Ireland",
        "postcode": 11296,
        "coordinates": {
          "latitude": "-18.4300",
          "longitude": "-115.7875"
        },
        "timezone": {
          "offset": "+11:00",
          "description": "Magadan, Solomon Islands, New Caledonia"
        }
      },
      "email": "andy.fisher@example.com",
      "dob": {
        "date": "1975-10-14T05:39:28.940Z",
        "age": 46
      },
      "phone": "061-573-1893",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/14.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/14.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/14.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "احسان",
        "last": "زارعی"
      },
      "location": {
        "street": {
          "number": 6465,
          "name": "مقدس اردبیلی"
        },
        "city": "اسلام‌شهر",
        "state": "لرستان",
        "country": "Iran",
        "postcode": 94695,
        "coordinates": {
          "latitude": "-72.8138",
          "longitude": "-27.0156"
        },
        "timezone": {
          "offset": "+5:30",
          "description": "Bombay, Calcutta, Madras, New Delhi"
        }
      },
      "email": "hsn.zraay@example.com",
      "dob": {
        "date": "1996-01-13T01:30:27.798Z",
        "age": 25
      },
      "phone": "040-87737080",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/78.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/78.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/78.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Ali",
        "last": "Uluhan"
      },
      "location": {
        "street": {
          "number": 2950,
          "name": "Mevlana Cd"
        },
        "city": "Kars",
        "state": "Karaman",
        "country": "Turkey",
        "postcode": 39111,
        "coordinates": {
          "latitude": "70.3487",
          "longitude": "178.0652"
        },
        "timezone": {
          "offset": "-3:30",
          "description": "Newfoundland"
        }
      },
      "email": "ali.uluhan@example.com",
      "dob": {
        "date": "1961-01-15T19:14:58.972Z",
        "age": 60
      },
      "phone": "(733)-714-7182",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/4.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/4.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/4.jpg"
      }
    },
    {
      "name": {
        "title": "Mrs",
        "first": "Eveline",
        "last": "Franck"
      },
      "location": {
        "street": {
          "number": 2714,
          "name": "Rosenstraße"
        },
        "city": "Rheinau",
        "state": "Brandenburg",
        "country": "Germany",
        "postcode": 52705,
        "coordinates": {
          "latitude": "59.4554",
          "longitude": "-37.8691"
        },
        "timezone": {
          "offset": "+9:30",
          "description": "Adelaide, Darwin"
        }
      },
      "email": "eveline.franck@example.com",
      "dob": {
        "date": "1955-07-29T01:41:53.164Z",
        "age": 66
      },
      "phone": "0926-6568801",
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/28.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/28.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/28.jpg"
      }
    },
    {
      "name": {
        "title": "Monsieur",
        "first": "Julio",
        "last": "Riviere"
      },
      "location": {
        "street": {
          "number": 253,
          "name": "Rue de Gerland"
        },
        "city": "Ipsach",
        "state": "Valais",
        "country": "Switzerland",
        "postcode": 6344,
        "coordinates": {
          "latitude": "-35.3058",
          "longitude": "-129.9556"
        },
        "timezone": {
          "offset": "+5:45",
          "description": "Kathmandu"
        }
      },
      "email": "julio.riviere@example.com",
      "dob": {
        "date": "1958-09-12T06:53:05.030Z",
        "age": 63
      },
      "phone": "076 482 84 92",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/32.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/32.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/32.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Soufian",
        "last": "Sandee"
      },
      "location": {
        "street": {
          "number": 4010,
          "name": "Bolakkerweg"
        },
        "city": "Montferland",
        "state": "Drenthe",
        "country": "Netherlands",
        "postcode": 72017,
        "coordinates": {
          "latitude": "-2.6017",
          "longitude": "-161.7095"
        },
        "timezone": {
          "offset": "-1:00",
          "description": "Azores, Cape Verde Islands"
        }
      },
      "email": "soufian.sandee@example.com",
      "dob": {
        "date": "1955-02-10T00:51:56.484Z",
        "age": 66
      },
      "phone": "(438)-147-1077",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/29.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/29.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/29.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "Herbert",
        "last": "Palmer"
      },
      "location": {
        "street": {
          "number": 8486,
          "name": "Grafton Street"
        },
        "city": "Athlone",
        "state": "Offaly",
        "country": "Ireland",
        "postcode": 32143,
        "coordinates": {
          "latitude": "-81.7690",
          "longitude": "12.5356"
        },
        "timezone": {
          "offset": "+10:00",
          "description": "Eastern Australia, Guam, Vladivostok"
        }
      },
      "email": "herbert.palmer@example.com",
      "dob": {
        "date": "1985-02-14T19:19:09.957Z",
        "age": 36
      },
      "phone": "071-910-8320",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/2.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/2.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/2.jpg"
      }
    },
    {
      "name": {
        "title": "Mr",
        "first": "ماهان",
        "last": "رضاییان"
      },
      "location": {
        "street": {
          "number": 7352,
          "name": "آیت‌الله مدنی"
        },
        "city": "نجف‌آباد",
        "state": "البرز",
        "country": "Iran",
        "postcode": 61495,
        "coordinates": {
          "latitude": "-36.7204",
          "longitude": "-106.2685"
        },
        "timezone": {
          "offset": "+2:00",
          "description": "Kaliningrad, South Africa"
        }
      },
      "email": "mhn.rdyyn@example.com",
      "dob": {
        "date": "1982-07-21T01:00:55.601Z",
        "age": 39
      },
      "phone": "092-83454453",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/27.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/27.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/27.jpg"
      }
    }
  ]
}
"""#.data(using: .utf8)!
